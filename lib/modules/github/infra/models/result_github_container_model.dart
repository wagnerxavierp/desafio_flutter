import 'package:desafio_flutter/modules/github/domain/entities/github_container.dart';
import 'package:desafio_flutter/modules/github/infra/models/result_item_model.dart';

class ResultGithubContainerModel extends GithubContainer {
  ResultGithubContainerModel({
    int? totalCount,
    bool? incompleteResults,
    List<ResultItemModel>? items,
  }) : super(
          totalCount: totalCount,
          incompleteResults: incompleteResults,
          items: items,
        );

  factory ResultGithubContainerModel.fromJson(Map<String, dynamic> json) {
    return ResultGithubContainerModel(
      totalCount: json['total_count'],
      incompleteResults: json['incomplete_results'],
      items: List<ResultItemModel>.from(
          json['items'].map((x) => ResultItemModel.fromJson(x))),
    );
  }
}
