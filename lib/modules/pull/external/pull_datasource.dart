import 'package:desafio_flutter/modules/pull/domain/errors/errors.dart';
import 'package:desafio_flutter/modules/pull/infra/datasources/pull_datasource_interface.dart';
import 'package:desafio_flutter/modules/pull/infra/models/result_pull_request_model.dart';
import 'package:dio/dio.dart';

class PullDatasource implements PullDatasourceInterface {
  final Dio dio;

  PullDatasource(this.dio);
  @override
  Future<List<ResultPullRequestModel>?> getPulls(String? url) async {
    if (url == null) throw InvalidArgs(message: "URL inválida");
    final response = await dio.get(url);

    switch (response.statusCode) {
      case 200:
        {
          final result = response.data as List;
          List<ResultPullRequestModel> list =
              result.map((e) => ResultPullRequestModel.fromJson(e)).toList();
          return list;
        }
      case 300:
        throw DatasourceError(message: "Erro de redirecionamento");
      case 400:
        throw DatasourceError(message: "Erro de requisição");
      case 500:
        throw DatasourceError(message: "Erro interno do servidor");
      default:
        throw DatasourceError(message: "Erro desconhecido");
    }
  }
}
