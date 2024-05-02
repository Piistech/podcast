import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast/features/analysis/presentation/widgets/analysis.dart';
import 'package:podcast/features/prediction/presentation/widgets/prediction.dart';

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
                    AnalysisWidget(fixtureGuid: fixture.guid),
                    const SizedBox(height: 16),
                    PredictionWidget(fixtureGuid: fixture.guid),
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
