import 'package:dartz/dartz.dart';
import 'package:desafio_flutter/modules/pull/cubit/pull_cubit.dart';
import 'package:desafio_flutter/modules/pull/domain/entities/pull_request.dart';
import 'package:desafio_flutter/modules/pull/domain/errors/errors.dart';
import 'package:desafio_flutter/modules/pull/domain/usecases/fetch_pull_repositorie.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'pull_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FetchPullRepositorieInterface>()])
void main() {
  final usecase = MockFetchPullRepositorieInterface();
  final cubit = PullCubit(usecase);

  test("Deve retornar os estados na ordem correta", () {
    when(usecase(any)).thenAnswer((_) async => const Right(<PullRequest>[]));
    expect(cubit.stream,
        emitsInOrder([isA<PullLoadingState>(), isA<PullSuccessState>()]));
    cubit.fetchPulls("url");
  });

  test("Deve retornar PullErrorState", () {
    when(usecase(any))
        .thenAnswer((_) async => Left(InvalidArgs(message: "Invalid Args")));
    expect(cubit.stream,
        emitsInOrder([isA<PullLoadingState>(), isA<PullErrorState>()]));
    cubit.fetchPulls("url");
  });
}
