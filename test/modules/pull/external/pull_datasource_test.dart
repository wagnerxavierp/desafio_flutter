import 'dart:convert';
import 'package:desafio_flutter/modules/pull/domain/errors/errors.dart';
import 'package:desafio_flutter/modules/pull/external/pull_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../github/external/datasources/github_datasource_test.mocks.dart';
import '../utils/result_pulls.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  final dio = MockDio();
  final datasource = PullDatasource(dio);

  test('Deve retornar uma lista de ResultPullRequestModel', () async {
    when(dio.get(any)).thenAnswer((_) async => Response(
        data: jsonDecode(resultPulls),
        statusCode: 200,
        requestOptions: RequestOptions(path: '')));
    final future = datasource.getPulls('url');
    expect(future, completes);
  });

  test('Deve retornar um erro se statusCode não for 200', () async {
    when(dio.get(any)).thenAnswer((_) async => Response(
        data: null, statusCode: 401, requestOptions: RequestOptions(path: '')));
    final future = datasource.getPulls('url');
    expect(future, throwsA(isA<DatasourceError>()));
  });
}
