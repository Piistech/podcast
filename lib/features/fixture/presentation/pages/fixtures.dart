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
        return Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<FixturesBloc, FixturesState>(
            builder: (_, state) {
              if (state is FixturesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FixturesDone) {
                return ListView.separated(
                  itemCount: state.fixtures.length,
                  padding: EdgeInsets.symmetric(
                    horizontal: context.horizontalMargin15,
                    vertical: context.verticalMargin15,
                  ),
                  separatorBuilder: (_, __) => SizedBox(height: context.verticalMargin8),
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
