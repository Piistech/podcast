import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:podcast/features/commentary/commentary.dart';

import '../../../../core/config/config.dart';
import '../../../../core/shared/shared.dart';
import '../../../team/team.dart';
import '../../fixture.dart';
import '../widgets/match_description.dart';

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
          appBar: AppBar(),
          body: BlocBuilder<FixturesBloc, FixturesState>(
            builder: (_, state) {
              if (state is FixturesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FixturesDone) {
                return ListView.separated(
                  itemCount: state.fixtures.length,
                  padding: const EdgeInsets.all(8.0),
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (_, index) {
                    final fixture = state.fixtures[index];
                    return Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: theme.card,
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
                                          child: MatchDescriptionWidget(
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
                                InkWell(
                                  onTap: () {
                                    context.pushNamed(
                                      LivePage.name,
                                      pathParameters: {
                                        'fixtureGuid': fixture.guid,
                                      },
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: theme.text.withAlpha(400),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.play_circle_outline_rounded,
                                          size: 18,
                                          color: theme.background,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          "Play Now",
                                          style: TextStyles.caption(context: context, color: theme.background)
                                              .copyWith(fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                        .animate(
                                          onPlay: (controller) => controller.repeat(),
                                        )
                                        .shimmer(
                                          duration: 2000.ms,
                                          color: theme.text,
                                        ),
                                  ),
                                ),
                                Text(
                                  fixture.startDate,
                                  style: TextStyles.caption(
                                    context: context,
                                    color: theme.text,
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
                                  color: theme.text.withAlpha(400),
                                ),
                                child: Text(
                                  "Prediction",
                                  style: TextStyles.caption(
                                    context: context,
                                    color: theme.background,
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
