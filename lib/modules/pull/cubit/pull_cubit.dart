// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:desafio_flutter/modules/pull/domain/entities/pull_request.dart';
import 'package:desafio_flutter/modules/pull/domain/errors/errors.dart';
import 'package:desafio_flutter/modules/pull/domain/usecases/fetch_pull_repositorie.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
part 'pull_state.dart';

class PullCubit extends Cubit<PullState> {
  final FetchPullRepositorieInterface usecase;
  PullCubit(this.usecase) : super(PullInitial());

  Future<void> fetchPulls(String? url) async {
    emit(PullLoadingState());
    final result = await usecase(url);
    result.fold(
      (l) => emit(PullErrorState(l)),
      (r) => emit(PullSuccessState(r)),
    );
  }
}
