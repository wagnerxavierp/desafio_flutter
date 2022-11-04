import 'package:dartz/dartz.dart';
import 'package:desafio_flutter/modules/github/domain/entities/github_container.dart';
import 'package:desafio_flutter/modules/github/domain/errors/errors.dart';
import 'package:desafio_flutter/modules/github/domain/repositories/github_repository_interface.dart';
import 'package:desafio_flutter/modules/github/infra/datasources/github_datasource_interface.dart';

class GithubRepository implements GithubRepositoryInterface {
  GithubDatasourceInterface datasource;

  GithubRepository(this.datasource);

  @override
  Future<Either<FailureGithubInterface?, GithubContainer?>> fetchRepositories(
      String? language, int? page) async {
    try {
      final result = await datasource.getRepositories(language, page);
      return Right(result);
    } on FailureGithubInterface catch (e) {
      return Left(e);
    } on Exception catch (e) {
      if (e.runtimeType.toString() == "DioError") {
        return Left(DatasourceError(message: "Erro de requisição"));
      }
      return Left(DatasourceError(message: "Erro desconhecido"));
    }
  }
}
