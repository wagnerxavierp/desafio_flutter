import 'package:desafio_flutter/modules/github/domain/entities/owner.dart';

class Item {
  String? name;
  String? description;
  int? forksCount;
  int? stargazersCount;
  Owner? owner;
  String? pullsUrl;

  Item({
    this.name,
    this.owner,
    this.description,
    this.pullsUrl,
    this.stargazersCount,
    this.forksCount,
  });
}
