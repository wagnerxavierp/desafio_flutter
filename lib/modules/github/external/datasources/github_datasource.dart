import 'package:desafio_flutter/modules/github/domain/errors/errors.dart';
import 'package:desafio_flutter/modules/github/infra/datasources/github_datasource_interface.dart';
import 'package:desafio_flutter/modules/github/infra/models/result_github_container_model.dart';
import 'package:dio/dio.dart';

class GithubDatasource implements GithubDatasourceInterface {
  final Dio dio;

  GithubDatasource(this.dio);

  @override
  Future<ResultGithubContainerModel?> getRepositories(
      String? language, int? page) async {
    final response = await dio.get(
        "https://api.github.com/search/repositories?q=language:$language&sort=stars&page=$page");

    switch (response.statusCode) {
      case 200:
        return ResultGithubContainerModel.fromJson(response.data);
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
