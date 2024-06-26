import '../../../../core/shared/shared.dart';
import '../../team.dart';

class TeamNameWidget extends StatelessWidget {
  const TeamNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;

        return TeamInfoWidget(
          builder: (team) => Text(
            team.name,
            style: context.textStyle17Medium(color: theme.textPrimary).copyWith(height: 1.2),
          ),
        );
      },
    );
  }
}
