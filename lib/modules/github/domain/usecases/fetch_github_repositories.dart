import 'package:dartz/dartz.dart';
import 'package:desafio_flutter/modules/github/domain/entities/github_container.dart';
import 'package:desafio_flutter/modules/github/domain/errors/errors.dart';

import '../repositories/github_repository_interface.dart';

abstract class FetchGithubRepositoriesInterface {
  Future<Either<FailureGithubInterface?, GithubContainer?>> call(
      String? language, int? page);
}

class FetchGithubRepositories implements FetchGithubRepositoriesInterface {
  final GithubRepositoryInterface repository;

  FetchGithubRepositories(this.repository);

  @override
  Future<Either<FailureGithubInterface?, GithubContainer?>> call(
      String? language, int? page) async {
    if (language == null || page == null || language.isEmpty || page < 1) {
      return Future.value(Left(InvalidArgs(message: "Argumentos inválidos")));
    }
    return await repository.fetchRepositories(language, page);
  }
}
