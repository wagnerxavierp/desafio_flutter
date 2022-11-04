import 'package:desafio_flutter/modules/pull/domain/entities/user.dart';

class ResultUserModel extends User {
  ResultUserModel({
    String? login,
    String? avatarUrl,
  }) : super(
          login: login,
          avatarUrl: avatarUrl,
        );

  factory ResultUserModel.fromJson(Map<String, dynamic> json) {
    return ResultUserModel(
      login: json['login'],
      avatarUrl: json['avatar_url'],
    );
  }
}
