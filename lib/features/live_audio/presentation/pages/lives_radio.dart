import '../../../../core/config/config.dart';
import '../../../../core/shared/shared.dart';
import '../../../commentary/commentary.dart';
import '../../../fixture/fixture.dart';
import '../../live_audio.dart';

class LiveRadioPage extends StatelessWidget {
  static const String path = '/live-radio';
  static const String name = 'LiveRadioPage';
  const LiveRadioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return RefreshIndicator(
          onRefresh: () async {
            context.read<FixturesBloc>().add(const FetchFixtures());
          },
          child: BlocBuilder<FixturesBloc, FixturesState>(
            builder: (_, state) {
              if (state is FixturesLoading) {
                return ListView.builder(
                  itemCount: 4,
                  itemBuilder: (_, __) => const ShimmerItem(),
                );
              } else if (state is FixturesDone) {
                return state.fixtures.isEmpty
                    ? Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: context.horizontalMargin15,
                          vertical: context.verticalMargin15,
                        ),
                        child: Text(
                          "No live match found",
                          style: TextStyles.body(context: context, color: theme.textPrimary),
                        ),
                      )
                    : ListView.separated(
                        itemCount: state.fixtures.length,
                        padding: EdgeInsets.symmetric(
                          horizontal: context.horizontalMargin15,
                          vertical: context.verticalMargin15,
                        ),
                        separatorBuilder: (_, __) => SizedBox(height: context.verticalMargin8),
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          final fixture = state.fixtures[index];
                          if (fixture.isLive) {
                            return BlocProvider(
                              create: (context) => sl<CommentaryBloc>()
                                ..add(
                                  FetchCommentary(fixtureGuid: fixture.guid),
                                ),
                              child: FixtureItemWidget(fixture: fixture),
                            );
                          } else {
                            return Container();
                          }
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
