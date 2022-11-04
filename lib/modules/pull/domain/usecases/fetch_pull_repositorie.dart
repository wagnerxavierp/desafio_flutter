import 'package:dartz/dartz.dart';
import 'package:desafio_flutter/modules/pull/domain/entities/pull_request.dart';
import 'package:desafio_flutter/modules/pull/domain/errors/errors.dart';
import 'package:desafio_flutter/modules/pull/domain/repositories/pull_repository_interface.dart';

abstract class FetchPullRepositorieInterface {
  Future<Either<FailurePullInterface?, List<PullRequest>?>> call(String? url);
}

class FetchPullRepositorie implements FetchPullRepositorieInterface {
  final PullRepositoryInterface repository;

  FetchPullRepositorie(this.repository);

  @override
  Future<Either<FailurePullInterface?, List<PullRequest>?>> call(
      String? url) async {
    if (url == null || url.isEmpty) {
      return Future.value(Left(InvalidArgs(message: "Argumentos inválidos")));
    }
    return await repository.fetchPulls(url);
  }
}
