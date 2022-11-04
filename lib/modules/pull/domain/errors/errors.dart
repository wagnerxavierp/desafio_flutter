abstract class FailurePullInterface implements Exception {
  late String message;
}

class InvalidArgs implements FailurePullInterface {
  @override
  late String message;

  InvalidArgs({required this.message});
}

class DatasourceError implements FailurePullInterface {
  @override
  late String message;

  DatasourceError({required this.message});
}
