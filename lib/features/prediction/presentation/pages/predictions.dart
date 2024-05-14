import 'package:podcast/core/config/config.dart';
import 'package:podcast/features/team/presentation/bloc/team_bloc.dart';
import 'package:podcast/features/team/team.dart';

import '../../../../core/shared/shared.dart';
import '../../../commentary/commentary.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
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
              return ListView.separated(
                itemCount: state.fixtures.length,
                padding: EdgeInsets.symmetric(
                  horizontal: context.horizontalMargin15,
                  vertical: context.verticalMargin15,
                ),
                separatorBuilder: (_, __) => SizedBox(height: context.verticalMargin8),
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  final fixture = state.fixtures[index];
                  return PredictionItemWidget(fixture: fixture);
                },
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
