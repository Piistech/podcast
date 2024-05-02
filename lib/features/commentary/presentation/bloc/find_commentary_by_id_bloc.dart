import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/shared/shared.dart';
import '../../commentary.dart';

part 'find_commentary_by_id_event.dart';
part 'find_commentary_by_id_state.dart';

class FindCommentaryByIdBloc extends Bloc<FindCommentaryByIdEvent, FindCommentaryByIdState> {
  final FindCommentaryByIdUseCase useCase;
  FindCommentaryByIdBloc({
    required this.useCase,
  }) : super(FindCommentaryByIdInitial()) {
    on<FindCommentaryById>((event, emit) {
      emit(const FindCommentaryByIdLoading());
      final result = useCase(
        fixtureGuid: event.fixtureGuid,
      );
      result.fold(
        (failure) => emit(FindCommentaryByIdError(failure: failure)),
        (fixture) => emit(FindCommentaryByIdDone(fixture: fixture)),
      );
    });
  }
}
