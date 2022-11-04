import 'package:desafio_flutter/modules/pull/domain/errors/errors.dart';
import 'package:desafio_flutter/modules/pull/domain/entities/pull_request.dart';
import 'package:dartz/dartz.dart';
import 'package:desafio_flutter/modules/pull/domain/repositories/pull_repository_interface.dart';
import 'package:desafio_flutter/modules/pull/infra/datasources/pull_datasource_interface.dart';

class PullRepository implements PullRepositoryInterface {
  PullDatasourceInterface datasource;

  PullRepository(this.datasource);

  @override
  Future<Either<FailurePullInterface?, List<PullRequest>?>> fetchPulls(
      String? url) async {
    try {
      final result = await datasource.getPulls(url);
      return Right(result);
    } on FailurePullInterface catch (e) {
      return Left(e);
    } on Exception catch (e) {
      if (e.runtimeType.toString() == "DioError") {
        return Left(DatasourceError(message: "Erro de requisição"));
      }
      return Left(DatasourceError(message: "Erro desconhecido"));
    }
  }
}
