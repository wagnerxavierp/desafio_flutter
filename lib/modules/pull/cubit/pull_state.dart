part of 'pull_cubit.dart';

@immutable
abstract class PullState {}

class PullInitial extends PullState {}

class PullLoadingState extends PullState {}

class PullSuccessState extends PullState {
  final List<PullRequest>? pullRequests;

  PullSuccessState(this.pullRequests);
}

class PullErrorState extends PullState {
  final FailurePullInterface? error;

  PullErrorState(this.error);
}
