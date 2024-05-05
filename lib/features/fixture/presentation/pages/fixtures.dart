import '../../../../core/shared/shared.dart';
import '../../fixture.dart';

class FixturesPage extends StatelessWidget {
  static const String path = '/fixtures';
  static const String name = 'FixturesPage';

  const FixturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundPrimary,
          appBar: AppBar(
            backgroundColor: theme.backgroundSecondary,
          ),
          body: BlocBuilder<FixturesBloc, FixturesState>(
            builder: (_, state) {
              if (state is FixturesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FixturesDone) {
                return ListView.separated(
                  itemCount: state.fixtures.length,
                  padding: const EdgeInsets.all(15.0),
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, index) {
                    final fixture = state.fixtures[index];
                    return FixtureItemWidget(fixture: fixture);
                  },
                );
              } else if (state is FixturesError) {
                return Center(child: Text(state.failure.message));
              } else {
                return Container();
              }
            },
          ),
        );
      },
    );
  }
}
