import 'package:desafio_flutter/modules/pull/domain/entities/user.dart';

class PullRequest {
  String? htmlUrl;
  String? title;
  String? body;
  String? createdAt;
  User? user;

  PullRequest({
    this.htmlUrl,
    this.title,
    this.body,
    this.createdAt,
    this.user,
  });
}
