import 'package:desafio_flutter/modules/pull/domain/entities/pull_request.dart';
import 'package:desafio_flutter/modules/pull/infra/models/result_user_model.dart';
import 'package:desafio_flutter/utils/data_utils.dart';

class ResultPullRequestModel extends PullRequest {
  ResultPullRequestModel(
      {String? htmlUrl,
      String? title,
      String? body,
      String? createdAt,
      ResultUserModel? user})
      : super(
          htmlUrl: htmlUrl,
          title: title,
          body: body,
          createdAt: createdAt,
          user: user,
        );

  factory ResultPullRequestModel.fromJson(Map<String, dynamic> json) {
    return ResultPullRequestModel(
      htmlUrl: json['html_url'],
      title: json['title'],
      body: json['body'],
      createdAt: formatData(json['created_at']),
      user: ResultUserModel.fromJson(json['user']),
    );
  }
}
