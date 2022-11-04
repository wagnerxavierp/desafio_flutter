import 'package:desafio_flutter/modules/github/domain/entities/item.dart';

class GithubContainer {
  int? totalCount;
  bool? incompleteResults;
  List<Item>? items;

  GithubContainer({this.totalCount, this.incompleteResults, this.items});
}
