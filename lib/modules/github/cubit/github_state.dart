part of 'github_cubit.dart';

@immutable
abstract class GithubState {}

class GithubInitialState extends GithubState {}

class GithubLoadingState extends GithubState {}

class GithubSuccesState extends GithubState {
  final GithubContainer? githubContainer;

  GithubSuccesState(this.githubContainer);
}

class GithubErrorState extends GithubState {
  final FailureGithubInterface? error;

  GithubErrorState(this.error);
}
