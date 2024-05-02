import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/fixture/fixture.dart';
import '../config/config.dart';

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
        return BlocProvider(
          create: (context) => sl<FindFixtureByIdBloc>()..add(FindFixtureById(guid: guid)),
          child: FixtureDetailsPage(
            guid: guid,
          ),
        );
      },
    ),
  ],
);
