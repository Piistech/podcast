import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
          backgroundColor: theme.background,
          body: BlocBuilder<FixturesBloc, FixturesState>(
            builder: (_, state) {
              if (state is FixturesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FixturesDone) {
                return ListView.separated(
                  itemCount: state.fixtures.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (_, index) {
                    final fixture = state.fixtures[index];
                    return InkWell(
                      onTap: () {
                        context.pushNamed(
                          FixtureDetailsPage.name,
                          pathParameters: {
                            'id': fixture.guid,
                          },
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(fixture.title),
                          if (fixture.isLive) const Text('Live'),
                          if (fixture.isUpcoming) Text(fixture.startTime),
                          if (fixture.isFinished) Text(fixture.result!),
                          Text(fixture.homeTeamId),
                          Text(fixture.awayTeamId),
                          Text(fixture.startDate),
                        ],
                      ),
                    );
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
