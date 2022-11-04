import 'dart:convert';
import 'package:desafio_flutter/modules/github/domain/entities/github_container.dart';
import 'package:desafio_flutter/modules/github/domain/usecases/fetch_github_repositories.dart';
import 'package:desafio_flutter/modules/id/getit.dart';
import 'package:desafio_flutter/modules/pull/domain/usecases/fetch_pull_repositorie.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../github/utils/result_github.dart';
import '../pull/utils/result_pulls.dart';
import 'getit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  final dio = MockDio();

  setUpAll(() {
    setupProviders();
    if (getIt.isRegistered<Dio>()) {
      getIt.unregister<Dio>();
      getIt.registerLazySingleton<Dio>(() => dio);
    }
  });

  test('Deve recuperar o usecase FetchGithubRepositoriesInterface', () {
    final usecase = getIt<FetchGithubRepositoriesInterface>();
    expect(usecase, isA<FetchGithubRepositories>());
  });

  test('Deve trazer um GithubContainer', () async {
    when(dio.get(any)).thenAnswer((_) async => Response(
        data: jsonDecode(resultGithub),
        statusCode: 200,
        requestOptions: RequestOptions(path: '')));
    final usecase = getIt<FetchGithubRepositoriesInterface>();
    final result = await usecase('java', 1);
    expect(result | null, isA<GithubContainer>());
  });

  test('Deve recuperar o usecase FetchPullRepositorieInterface', () {
    final usecase = getIt<FetchPullRepositorieInterface>();
    expect(usecase, isA<FetchPullRepositorie>());
  });

  test('Deve trazer uma lista de Pull', () async {
    when(dio.get(any)).thenAnswer((_) async => Response(
        data: jsonDecode(resultPulls),
        statusCode: 200,
        requestOptions: RequestOptions(path: '')));
    final usecase = getIt<FetchPullRepositorieInterface>();
    final result = await usecase('url');
    expect(result | null, isA<List>());
  });
}
