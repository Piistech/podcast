import '../../../../core/shared/shared.dart';
import '../../../fixture/fixture.dart';
import '../../../live_audio/presentation/widgets/shimmer/item.dart';
import '../widgets/item.dart';

class PredictionsPage extends StatelessWidget {
  static const String path = '/predictions';
  static const String name = 'PredictionsPage';
  const PredictionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
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
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.horizontalMargin16, vertical: context.verticalMargin8),
                    child: Text(
                      "Upcoming matches",
                      style: TextStyles.title(
                        context: context,
                        color: Colors.white,
                      ),
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
                        if (fixture.isUpcoming) {
                          return PredictionItemWidget(fixture: fixture);
                        } else {
                          return Container();
                        }
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
      ),
    );
  }
}
