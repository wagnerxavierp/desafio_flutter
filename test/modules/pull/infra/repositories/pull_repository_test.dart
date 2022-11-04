import 'package:dartz/dartz.dart';
import 'package:desafio_flutter/modules/pull/domain/entities/pull_request.dart';
import 'package:desafio_flutter/modules/pull/domain/errors/errors.dart';
import 'package:desafio_flutter/modules/pull/infra/datasources/pull_datasource_interface.dart';
import 'package:desafio_flutter/modules/pull/infra/models/result_pull_request_model.dart';
import 'package:desafio_flutter/modules/pull/infra/repositories/pull_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'pull_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PullDatasourceInterface>()])
void main() {
  final datasource = MockPullDatasourceInterface();
  final repository = PullRepository(datasource);

  test('Deve retornar uma lista de PullRequest', () async {
    when(datasource.getPulls(any))
        .thenAnswer((_) async => <ResultPullRequestModel>[]);
    final result = await repository.fetchPulls('url');
    expect(result | null, isA<List<PullRequest>>());
  });

  test('Deve retornar um error se o datasource falhar', () async {
    when(datasource.getPulls(any)).thenThrow(Exception());
    final result = await repository.fetchPulls('url');
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
