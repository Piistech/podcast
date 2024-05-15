import 'package:podcast/features/commentary/commentary.dart';

import '../../../../../core/shared/shared.dart';
import '../../../fixture.dart';

class OnAirWidget extends StatelessWidget {
  const OnAirWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return BlocBuilder<FixturesBloc, FixturesState>(
          builder: (context, state) {
            if (state is FixturesDone) {
              final FixtureEntity fixture = state.fixtures.firstWhere((element) => element.isLive);
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Live now",
                    style: context.textStyle14Medium(color: theme.textPrimary).copyWith(height: 1.2),
                  ),
                  SizedBox(height: context.verticalMargin10),
                  Container(
                    width: 329.w,
                    height: 299.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(context.radius10),
                      color: theme.textPrimary,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "on air now!".toUpperCase(),
                          style: context.textStyle20Medium(color: theme.backgroundPrimary).copyWith(height: 1.2),
                        ),
                        SizedBox(height: context.verticalMargin4),
                        Text(
                          "Listen to our radio",
                          style: context.textStyle17Regular(color: theme.backgroundPrimary).copyWith(height: 1.2),
                        ),
                        SizedBox(height: context.verticalMargin10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(96.w, 30.h),
                            padding: EdgeInsets.zero,
                            backgroundColor: theme.backgroundPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(context.radius10),
                            ),
                          ),
                          onPressed: () {
                            context.pushNamed(
                              LivePage.name,
                              pathParameters: {'fixtureGuid': fixture.guid},
                            );
                          },
                          child: Text(
                            "Listen now",
                            style: context.textStyle10Medium(color: theme.textPrimary),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            } else {
              return Container();
            }
          },
        );
      },
    );
  }
}
