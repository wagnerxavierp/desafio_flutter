import 'package:desafio_flutter/modules/github/infra/models/result_github_container_model.dart';

abstract class GithubDatasourceInterface {
  Future<ResultGithubContainerModel?> getRepositories(
      String? language, int? page);
}
