import 'package:dartz/dartz.dart';
import 'package:desafio_flutter/modules/pull/domain/entities/pull_request.dart';
import 'package:desafio_flutter/modules/pull/domain/errors/errors.dart';
import 'package:desafio_flutter/modules/pull/domain/repositories/pull_repository_interface.dart';
import 'package:desafio_flutter/modules/pull/domain/usecases/fetch_pull_repositorie.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'fetch_pull_request_repositorie_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PullRepositoryInterface>()])
void main() {
  final repository = MockPullRepositoryInterface();
  final usecase = FetchPullRepositorie(repository);

  test('Deve retornar uma lista de PullRequest', () async {
    when(repository.fetchPulls(any))
        .thenAnswer((_) async => const Right(<PullRequest>[]));
    final result = await usecase('url');
    expect(result | null, isA<List<PullRequest>>());
  });

  test('Deve retornar InvalidArgs', () async {
    when(repository.fetchPulls(any))
        .thenAnswer((_) async => const Right(<PullRequest>[]));

    var result = await usecase("");
    expect(result.fold(id, id), isA<InvalidArgs>());

    result = await usecase(null);
    expect(result.fold(id, id), isA<InvalidArgs>());
  });
}
