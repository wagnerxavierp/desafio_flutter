import 'package:dartz/dartz.dart';
import 'package:desafio_flutter/modules/github/domain/entities/github_container.dart';
import 'package:desafio_flutter/modules/github/domain/errors/errors.dart';
import 'package:desafio_flutter/modules/github/infra/datasources/github_datasource_interface.dart';
import 'package:desafio_flutter/modules/github/infra/models/result_github_container_model.dart';
import 'package:desafio_flutter/modules/github/infra/repositories/github_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'github_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GithubDatasourceInterface>()])
void main() {
  final datasource = MockGithubDatasourceInterface();
  final repository = GithubRepository(datasource);

  test('Deve retornar um GithubContainer', () async {
    when(datasource.getRepositories(any, any))
        .thenAnswer((_) async => ResultGithubContainerModel());
    final result = await repository.fetchRepositories('java', 1);
    expect(result | null, isA<GithubContainer>());
  });

  test('Deve retornar um error se o datasource falhar', () async {
    when(datasource.getRepositories(any, any)).thenThrow(Exception());
    final result = await repository.fetchRepositories('java', 1);
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
