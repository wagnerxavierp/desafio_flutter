import 'package:desafio_flutter/modules/github/domain/entities/owner.dart';

class ResultOwnerModel extends Owner {
  ResultOwnerModel({
    String? login,
    String? avatarUrl,
  }) : super(
          login: login,
          avatarUrl: avatarUrl,
        );

  factory ResultOwnerModel.fromJson(Map<String, dynamic> json) {
    return ResultOwnerModel(
      login: json['login'],
      avatarUrl: json['avatar_url'],
    );
  }
}
