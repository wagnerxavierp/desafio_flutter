import 'package:desafio_flutter/modules/github/domain/repositories/github_repository_interface.dart';
import 'package:desafio_flutter/modules/github/domain/usecases/fetch_github_repositories.dart';
import 'package:desafio_flutter/modules/github/external/datasources/github_datasource.dart';
import 'package:desafio_flutter/modules/github/infra/datasources/github_datasource_interface.dart';
import 'package:desafio_flutter/modules/github/infra/repositories/github_repository.dart';
import 'package:desafio_flutter/modules/pull/cubit/pull_cubit.dart';
import 'package:desafio_flutter/modules/pull/domain/repositories/pull_repository_interface.dart';
import 'package:desafio_flutter/modules/pull/domain/usecases/fetch_pull_repositorie.dart';
import 'package:desafio_flutter/modules/pull/external/pull_datasource.dart';
import 'package:desafio_flutter/modules/pull/infra/datasources/pull_datasource_interface.dart';
import 'package:desafio_flutter/modules/pull/infra/repositories/pull_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../github/cubit/github_cubit.dart';

final getIt = GetIt.instance;

setupProviders() {
  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<GithubDatasourceInterface>(
      () => GithubDatasource(getIt()));
  getIt.registerLazySingleton<GithubRepositoryInterface>(
      () => GithubRepository(getIt()));
  getIt.registerLazySingleton<FetchGithubRepositoriesInterface>(
      () => FetchGithubRepositories(getIt()));
  getIt.registerLazySingleton<GithubCubit>(() => GithubCubit(getIt()));

  getIt.registerLazySingleton<PullDatasourceInterface>(
      () => PullDatasource(getIt()));
  getIt.registerLazySingleton<PullRepositoryInterface>(
      () => PullRepository(getIt()));
  getIt.registerLazySingleton<FetchPullRepositorieInterface>(
      () => FetchPullRepositorie(getIt()));
  getIt.registerLazySingleton<PullCubit>(() => PullCubit(getIt()));
}
