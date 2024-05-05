import 'package:podcast/core/config/config.dart';
import 'package:podcast/features/analysis/analysis.dart';
import 'package:podcast/features/analysis/presentation/widgets/analysis.dart';
import 'package:podcast/features/prediction/presentation/widgets/prediction.dart';
import 'package:podcast/features/team/team.dart';

import '../../../../core/shared/shared.dart';
import '../../fixture.dart';

class FixtureDetailsPage extends StatelessWidget {
  final String guid;
  static const String path = '/fixtures/:id';
  static const String name = 'FixtureDetailsPage';

  const FixtureDetailsPage({
    super.key,
    required this.guid,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundPrimary,
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: theme.backgroundSecondary,
            iconTheme: IconThemeData(color: theme.textPrimary),
            title: BlocBuilder<FindFixtureByIdBloc, FindFixtureByIdState>(
              builder: (context, state) {
                if (state is FindFixtureByIdDone) {
                  final fixture = state.fixture;
                  return Text(
                    fixture.matchTitle,
                    style: context.textStyle12Medium(color: theme.textPrimary),
                  );
                } else {
                  return Text(
                    "Match Details",
                    style: context.textStyle17Medium(color: theme.textPrimary),
                  );
                }
              },
            ),
          ),
          body: BlocBuilder<FindFixtureByIdBloc, FindFixtureByIdState>(
            builder: (_, state) {
              if (state is FindFixtureByIdLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FindFixtureByIdDone) {
                final fixture = state.fixture;
                return ListView(
                  padding: const EdgeInsets.all(8.0),
                  children: [
                    AnalysisWidget(fixtureGuid: fixture.guid),
                    const SizedBox(height: 16),
                    MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (context) => sl<TeamBloc>(),
                        ),
                      ],
                      child: PredictionWidget(fixtureGuid: fixture.guid),
                    ),
                  ],
                );
              } else if (state is FindFixtureByIdError) {
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
