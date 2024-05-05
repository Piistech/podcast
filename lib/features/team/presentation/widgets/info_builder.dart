import '../../../../core/shared/shared.dart';
import '../../team.dart';

typedef TeamNameBuilder = Widget Function(TeamEntity);

class TeamInfoWidget extends StatelessWidget {
  final TeamNameBuilder builder;
  const TeamInfoWidget({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamBloc, TeamState>(
      builder: (context, state) {
        if (state is TeamLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TeamDone) {
          return builder(state.team);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
