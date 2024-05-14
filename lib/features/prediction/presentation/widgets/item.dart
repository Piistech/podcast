import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/config/config.dart';
import '../../../../core/shared/shared.dart';
import '../../../commentary/commentary.dart';
import '../../../fixture/fixture.dart';
import '../../../team/team.dart';
import 'team.dart';

class PredictionItemWidget extends StatelessWidget {
  final FixtureEntity fixture;
  const PredictionItemWidget({
    super.key,
    required this.fixture,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, state) {
        final theme = state.scheme;
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.horizontalMargin12,
            vertical: context.verticalMargin12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.radius12),
            color: theme.backgroundSecondary,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      "${fixture.matchTitle},${fixture.stadiumName}",
                      style: context.textStyle10Medium(color: theme.textPrimary).copyWith(height: 1.2),
                    ),
                  ),
                  Text(
                    fixture.startTime,
                    style: context.textStyle10Medium(color: theme.textPrimary).copyWith(height: 1.2),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              BlocProvider(
                create: (context) => sl<TeamBloc>(),
                child: TeamNameAndFlagWidget(
                  teamGuid: fixture.homeTeamId,
                ),
              ),
              SizedBox(height: context.verticalMargin12),
              Text(
                fixture.matchDescription,
                style: context.textStyle10Regular(color: theme.textPrimary).copyWith(height: 1.2),
              ),
              SizedBox(height: context.verticalMargin16),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  borderRadius: BorderRadius.circular(context.radius5),
                  onTap: () {
                    context.pushNamed(
                      FixtureDetailsPage.name,
                      pathParameters: {
                        'id': fixture.guid,
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: context.horizontalMargin8, vertical: context.verticalMargin4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(context.radius5),
                      color: theme.backgroundTertiary,
                    ),
                    child: Text(
                      "Prediction",
                      style: context.textStyle10Medium(color: theme.textPrimary).copyWith(height: 1.2),
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.verticalMargin16),
            ],
          ),
        );
      },
    );
  }
}
