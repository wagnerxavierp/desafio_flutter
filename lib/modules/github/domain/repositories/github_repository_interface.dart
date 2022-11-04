import 'package:dartz/dartz.dart';
import 'package:desafio_flutter/modules/github/domain/entities/github_container.dart';
import 'package:desafio_flutter/modules/github/domain/errors/errors.dart';

abstract class GithubRepositoryInterface {
  Future<Either<FailureGithubInterface?, GithubContainer?>> fetchRepositories(
      String? language, int? page);
}
