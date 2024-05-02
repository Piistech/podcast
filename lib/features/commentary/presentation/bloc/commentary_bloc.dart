import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'commentary_event.dart';
part 'commentary_state.dart';

class CommentaryBloc extends Bloc<CommentaryEvent, CommentaryState> {
  CommentaryBloc() : super(CommentaryInitial()) {
    on<CommentaryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
