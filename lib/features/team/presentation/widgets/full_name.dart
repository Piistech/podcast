import '../../../../core/shared/shared.dart';
import '../../team.dart';

class TeamFullNameWidget extends StatelessWidget {
  const TeamFullNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return TeamInfoWidget(
          builder: (team) => Text(
            team.name.toUpperCase(),
            style: context.textStyle14Medium(color: theme.textPrimary).copyWith(height: 1.2),
          ),
        );
      },
    );
  }
}
