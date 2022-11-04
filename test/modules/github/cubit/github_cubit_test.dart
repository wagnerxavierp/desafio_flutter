import 'package:dartz/dartz.dart';
import 'package:desafio_flutter/modules/github/cubit/github_cubit.dart';
import 'package:desafio_flutter/modules/github/domain/entities/github_container.dart';
import 'package:desafio_flutter/modules/github/domain/errors/errors.dart';
import 'package:desafio_flutter/modules/github/domain/usecases/fetch_github_repositories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'github_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FetchGithubRepositoriesInterface>()])
void main() {
  final usecase = MockFetchGithubRepositoriesInterface();
  final cubit = GithubCubit(usecase);

  test("Deve retornar os estados na ordem correta", () {
    when(usecase(any, any)).thenAnswer((_) async => Right(GithubContainer()));
    expect(cubit.stream,
        emitsInOrder([isA<GithubLoadingState>(), isA<GithubSuccesState>()]));
    cubit.fetchRepositories("java", 1);
  });

  test("Deve retornar GithubErrorState", () {
    when(usecase(any, any))
        .thenAnswer((_) async => Left(InvalidArgs(message: "Invalid Args")));
    expect(cubit.stream,
        emitsInOrder([isA<GithubLoadingState>(), isA<GithubErrorState>()]));
    cubit.fetchRepositories("java", 1);
  });
}
