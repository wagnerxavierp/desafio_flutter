import 'package:desafio_flutter/modules/github/domain/entities/item.dart';
import 'package:desafio_flutter/modules/github/infra/models/result_owner_model.dart';

class ResultItemModel extends Item {
  ResultItemModel({
    String? name,
    String? description,
    int? forksCount,
    int? stargazersCount,
    ResultOwnerModel? owner,
    String? pullsUrl,
  }) : super(
          name: name,
          description: description,
          forksCount: forksCount,
          stargazersCount: stargazersCount,
          owner: owner,
          pullsUrl: pullsUrl,
        );

  factory ResultItemModel.fromJson(Map<String, dynamic> json) {
    return ResultItemModel(
      name: json['name'],
      description: json['description'],
      forksCount: json['forks_count'],
      stargazersCount: json['stargazers_count'],
      owner: ResultOwnerModel.fromJson(json['owner']),
      pullsUrl: json['pulls_url'].toString().replaceAll("{/number}", ""),
    );
  }
}
