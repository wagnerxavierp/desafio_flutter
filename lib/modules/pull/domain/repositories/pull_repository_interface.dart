import 'package:dartz/dartz.dart';
import 'package:desafio_flutter/modules/pull/domain/entities/pull_request.dart';
import 'package:desafio_flutter/modules/pull/domain/errors/errors.dart';

abstract class PullRepositoryInterface {
  Future<Either<FailurePullInterface?, List<PullRequest>?>> fetchPulls(
      String? url);
}
