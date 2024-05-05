import '../config/config.dart';
import 'shared.dart';

import '../../features/analysis/analysis.dart';
import '../../features/commentary/commentary.dart';
import '../../features/fixture/fixture.dart';
import '../../features/prediction/prediction.dart';

final router = GoRouter(
  initialLocation: FixturesPage.path,
  routes: [
    GoRoute(
      path: FixturesPage.path,
      name: FixturesPage.name,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<FixturesBloc>()..add(const FetchFixtures()),
        child: const FixturesPage(),
      ),
    ),
    GoRoute(
      path: FixtureDetailsPage.path,
      name: FixtureDetailsPage.name,
      builder: (context, state) {
        final String guid = state.pathParameters['id']!;
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  sl<FindFixtureByIdBloc>()..add(FindFixtureById(guid: guid)),
            ),
            BlocProvider(
              create: (context) =>
                  sl<AnalysisBloc>()..add(FetchAnalysis(fixtureGuid: guid)),
            ),
            BlocProvider(
              create: (context) =>
                  sl<PredictionBloc>()..add(FetchPrediction(fixtureGuid: guid)),
            ),
          ],
          child: FixtureDetailsPage(
            guid: guid,
          ),
        );
      },
    ),
    GoRoute(
        path: LivePage.path,
        name: LivePage.name,
        builder: (context, state) {
          final String fixtureGuid = state.pathParameters['fixtureGuid']!;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<CommentaryBloc>()
                  ..add(
                    FetchCommentary(fixtureGuid: fixtureGuid),
                  ),
              ),
              BlocProvider(
                create: (context) => sl<FindFixtureByIdBloc>()
                  ..add(
                    FindFixtureById(guid: fixtureGuid),
                  ),
              ),
            ],
            child: const LivePage(),
          );
        }),
  ],
);
