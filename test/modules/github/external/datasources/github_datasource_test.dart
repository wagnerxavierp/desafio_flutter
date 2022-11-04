import 'dart:convert';
import 'package:desafio_flutter/modules/github/domain/errors/errors.dart';
import 'package:desafio_flutter/modules/github/external/datasources/github_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../utils/result_github.dart';
import 'package:mockito/annotations.dart';
import 'github_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  final dio = MockDio();
  final datasource = GithubDatasource(dio);

  test('Deve retornar um ResultGithubContainerModel', () async {
    when(dio.get(any)).thenAnswer((_) async => Response(
        data: jsonDecode(resultGithub),
        statusCode: 200,
        requestOptions: RequestOptions(path: '')));
    final future = datasource.getRepositories('java', 1);
    expect(future, completes);
  });

  test('Deve retornar um erro se statusCode não for 200', () async {
    when(dio.get(any)).thenAnswer((_) async => Response(
        data: null, statusCode: 401, requestOptions: RequestOptions(path: '')));
    final future = datasource.getRepositories('java', 1);
    expect(future, throwsA(isA<DatasourceError>()));
  });
}
