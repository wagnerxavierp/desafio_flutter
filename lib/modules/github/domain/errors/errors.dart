abstract class FailureGithubInterface implements Exception {
  late String message;
}

class InvalidArgs implements FailureGithubInterface {
  @override
  late String message;

  InvalidArgs({required this.message});
}

class DatasourceError implements FailureGithubInterface {
  @override
  late String message;

  DatasourceError({required this.message});
}
