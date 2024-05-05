import '../../../../../core/shared/shared.dart';
import '../../../fixture.dart';

class MatchTitleWidget extends StatelessWidget {
  const MatchTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, state) {
        final theme = state.scheme;
        return BlocBuilder<FindFixtureByIdBloc, FindFixtureByIdState>(
          builder: (context, state) {
            if (state is FindFixtureByIdDone) {
              final fixture = state.fixture;
              return Text(
                fixture.title,
                style: context.textStyle17Medium(color: theme.textPrimary),
              );
            }
            return Container();
          },
        );
      },
    );
  }
}
