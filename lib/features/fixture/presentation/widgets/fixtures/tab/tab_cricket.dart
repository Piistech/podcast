import '../../../../../../core/config/config.dart';
import '../../../../../../core/shared/shared.dart';
import '../../../../../commentary/commentary.dart';
import '../../../../../live_audio/live_audio.dart';
import '../../../../fixture.dart';
import '../on_air.dart';

class TabCricket extends StatelessWidget {
  const TabCricket({super.key});

  @override
  Widget build(BuildContext context) {
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
            final bool live = state.fixtures.where((element) => element.isLive).isNotEmpty;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: live,
                  child: SizedBox(
                    child: SizedBox(height: context.verticalMargin16),
                  ),
                ),
                Visibility(
                  visible: live,
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider.value(value: context.read<FixturesBloc>()),
                    ],
                    child: const OnAirWidget(),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: state.fixtures.length,
                    padding: EdgeInsets.symmetric(
                      horizontal: context.horizontalMargin15,
                      vertical: context.verticalMargin15,
                    ),
                    separatorBuilder: (_, __) => SizedBox(height: context.verticalMargin8),
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      final fixture = state.fixtures[index];
                      return BlocProvider(
                        create: (context) => sl<CommentaryBloc>()
                          ..add(
                            FetchCommentary(fixtureGuid: fixture.guid),
                          ),
                        child: FixtureItemWidget(fixture: fixture),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is FixturesError) {
            return Center(child: Text(state.failure.message));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
