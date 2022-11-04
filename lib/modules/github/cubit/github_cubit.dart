// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:desafio_flutter/modules/github/domain/entities/github_container.dart';
import 'package:desafio_flutter/modules/github/domain/errors/errors.dart';
import 'package:desafio_flutter/modules/github/domain/usecases/fetch_github_repositories.dart';
part 'github_state.dart';

class GithubCubit extends Cubit<GithubState> {
  final FetchGithubRepositoriesInterface usecase;
  GithubCubit(this.usecase) : super(GithubInitialState());

  Future<void> fetchRepositories(String language, int page) async {
    emit(GithubLoadingState());
    final result = await usecase(language, page);
    result.fold(
      (l) => emit(GithubErrorState(l)),
      (r) => emit(GithubSuccesState(r)),
    );
  }
}
