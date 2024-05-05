import '../../../../../core/config/config.dart';
import '../../../../../core/shared/shared.dart';
import '../../../../team/team.dart';
import '../../../fixture.dart';

class FixtureItemWidget extends StatelessWidget {
  final FixtureEntity fixture;
  const FixtureItemWidget({
    super.key,
    required this.fixture,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, state) {
        final theme = state.scheme;
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: theme.backgroundSecondary,
          ),
          child: InkWell(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: fixture.logo,
                          fit: BoxFit.cover,
                          width: 64,
                          height: 64,
                          placeholder: (context, url) => const SizedBox(
                            width: 64,
                            height: 64,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) => const SizedBox(
                            width: 64,
                            height: 64,
                            child: Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: BlocProvider(
                        create: (context) => sl<TeamBloc>(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TeamTitle(
                              fixture: fixture,
                            ),
                            BlocProvider(
                              create: (context) => sl<TeamBloc>(),
                              child: FixtureItemWidget(
                                fixture: fixture,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: theme.textPrimary.withAlpha(400),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_circle_outline_rounded,
                            size: 18,
                            color: theme.backgroundPrimary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "Play Now",
                            style: TextStyles.caption(context: context, color: theme.backgroundPrimary)
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                          .animate(
                            onPlay: (controller) => controller.repeat(),
                          )
                          .shimmer(
                            duration: 2000.ms,
                            color: theme.textPrimary,
                          ),
                    ),
                    Text(
                      fixture.startDate,
                      style: TextStyles.caption(
                        context: context,
                        color: theme.textPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: theme.textPrimary.withAlpha(400),
                    ),
                    child: Text(
                      "Prediction",
                      style: TextStyles.caption(
                        context: context,
                        color: theme.backgroundPrimary,
                      ).copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
