import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          backgroundColor: theme.background,
          body: BlocBuilder<FindFixtureByIdBloc, FindFixtureByIdState>(
            builder: (_, state) {
              if (state is FindFixtureByIdLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FindFixtureByIdDone) {
                final fixture = state.fixture;
                return ListView(
                  children: [
                    Text(fixture.title),
                    if (fixture.isLive) const Text('Live'),
                    if (fixture.isUpcoming) Text(fixture.startTime),
                    if (fixture.isFinished) Text(fixture.result!),
                    Text(fixture.homeTeamId),
                    Text(fixture.awayTeamId),
                    Text(fixture.startDate),
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
