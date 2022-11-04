import 'package:dartz/dartz.dart';
import 'package:desafio_flutter/modules/github/domain/entities/github_container.dart';
import 'package:desafio_flutter/modules/github/domain/errors/errors.dart';
import 'package:desafio_flutter/modules/github/domain/repositories/github_repository_interface.dart';
import 'package:desafio_flutter/modules/github/domain/usecases/fetch_github_repositories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'fetch_github_repositories_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GithubRepositoryInterface>()])
void main() {
  final repository = MockGithubRepositoryInterface();
  final usecase = FetchGithubRepositories(repository);

  test('Deve retornar um GithubContainer', () async {
    when(repository.fetchRepositories(any, any))
        .thenAnswer((_) async => Right(GithubContainer()));
    final result = await usecase('java', 1);
    expect(result | null, isA<GithubContainer>());
  });

  test('Deve retornar InvalidArgs', () async {
    when(repository.fetchRepositories(any, any))
        .thenAnswer((_) async => Right(GithubContainer()));

    var result = await usecase("java", null);
    expect(result.fold(id, id), isA<InvalidArgs>());

    result = await usecase(null, 1);
    expect(result.fold(id, id), isA<InvalidArgs>());

    result = await usecase("", 1);
    expect(result.fold(id, id), isA<InvalidArgs>());

    result = await usecase("", 0);
    expect(result.fold(id, id), isA<InvalidArgs>());
  });
}
