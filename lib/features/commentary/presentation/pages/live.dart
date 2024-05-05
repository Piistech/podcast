import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:podcast/core/shared/shared.dart';
import 'package:podcast/features/fixture/fixture.dart';

class LivePage extends StatelessWidget {
  static const String path = '/live/:fixtureGuid';
  static const String name = 'LivePage';
  const LivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.background,
          appBar: AppBar(
            automaticallyImplyLeading: true,
          ),
          body: BlocBuilder<FindFixtureByIdBloc, FindFixtureByIdState>(
            builder: (context, state) {
              if (state is FindFixtureByIdLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FindFixtureByIdDone) {
                final fixture = state.fixture;
                return ListView(
                  children: [
                    Container(
                      height: context.height * .8,
                      padding: const EdgeInsets.all(16.0),
                      child: Stack(
                        clipBehavior: Clip.antiAlias,
                        children: [
                          Positioned(
                            bottom: 48,
                            left: 0,
                            right: 0,
                            child: Column(
                              children: [
                                LinearPercentIndicator(
                                  percent: 0.8,
                                  animation: true,
                                  animationDuration: 1000,
                                  progressColor: theme.text,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.skip_previous_rounded),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.play_circle_fill_outlined,
                                        size: 48,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.skip_next_rounded),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      theme.text.withOpacity(0.6),
                                      theme.text.withOpacity(0.6),
                                    ],
                                  ).createShader(bounds);
                                },
                                blendMode: BlendMode.srcATop,
                                child: Stack(
                                  children: [
                                    CachedNetworkImage(
                                      height: context.height * .61,
                                      imageUrl: fixture.logo,
                                      fit: BoxFit.fill,
                                      errorWidget: (context, url, error) => const Icon(Icons.error),
                                      placeholder: (context, url) => const CircularProgressIndicator(),
                                    ),
                                    Positioned.directional(
                                      bottom: 0,
                                      start: 0,
                                      end: 0,
                                      textDirection: TextDirection.ltr,
                                      child: Container(
                                        width: context.width,
                                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              fixture.matchName,
                                              style: TextStyles.caption(context: context, color: context.backgroundColor),
                                            ),
                                            Text(
                                              "T Score",
                                              style: TextStyles.caption(context: context, color: context.backgroundColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
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
