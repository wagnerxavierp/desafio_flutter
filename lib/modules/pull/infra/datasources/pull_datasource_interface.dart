import 'package:desafio_flutter/modules/pull/infra/models/result_pull_request_model.dart';

abstract class PullDatasourceInterface {
  Future<List<ResultPullRequestModel>?> getPulls(String? url);
}
