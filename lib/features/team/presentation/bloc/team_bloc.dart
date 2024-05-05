import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/shared/shared.dart';
import '../../team.dart';

part 'team_event.dart';
part 'team_state.dart';

class TeamBloc extends Bloc<TeamEvent, TeamState> {
  final TeamUsecase useCase;
  TeamBloc({
    required this.useCase,
  }) : super(TeamInitial()) {
    on<FetchTeam>((event, emit) async {
      emit(const TeamLoading());
      final result = await useCase(teamGuid: event.teamGuid);
      result.fold(
        (failure) => emit(TeamError(failure: failure)),
        (team) => emit(TeamDone(team: team)),
      );
    });
  }
}
