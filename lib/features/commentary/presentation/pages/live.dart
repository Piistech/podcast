import '../../../../core/shared/shared.dart';
import '../../../fixture/fixture.dart';
import '../../commentary.dart';

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
          backgroundColor: theme.backgroundPrimary,
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: theme.backgroundSecondary,
            iconTheme: IconThemeData(color: theme.textPrimary),
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
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(),
                  children: [
                    SizedBox(
                      height: context.liveContainerHeight,
                      child: Stack(
                        clipBehavior: Clip.antiAlias,
                        children: [
                          Positioned(
                            bottom: 8,
                            left: 0,
                            right: 0,
                            child: RadioPlayer(
                              fixtureGuid: fixture.guid,
                            ),
                          ),
                          Positioned(
                            child: Stack(
                              children: [
                                CachedNetworkImage(
                                  height: context.liveImageHeight,
                                  imageUrl: fixture.logo,
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                  placeholder: (context, url) => const CircularProgressIndicator(),
                                ),
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: theme.gradient,
                                    ),
                                  ),
                                ),
                                Positioned.directional(
                                  bottom: 0,
                                  start: 0,
                                  end: 0,
                                  textDirection: TextDirection.ltr,
                                  child: Container(
                                    width: context.width,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: context.horizontalMargin16,
                                      vertical: context.verticalMargin8,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                fixture.matchTitle,
                                                style:
                                                    context.textStyle17Medium(color: theme.textPrimary).copyWith(height: 1.2),
                                              ),
                                              SizedBox(height: context.verticalMargin8),
                                              Text(
                                                "T Score",
                                                style:
                                                    context.textStyle14Medium(color: theme.textSecondary).copyWith(height: 1.2),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: context.horizontalMargin4),
                                        BlocBuilder<CommentaryBloc, CommentaryState>(
                                          builder: (context, state) {
                                            if (state is CommentaryDone) {
                                              final String channelId = state.commentary.channelId;
                                              return BlocBuilder<CurrentlyPlayingCommentaryBloc,
                                                  CurrentlyPlayingCommentaryState>(
                                                builder: (context, state) {
                                                  final bool isPlaying = state is CurrentlyPlayingCommentaryChannel &&
                                                      state.channelId == channelId;
                                                  if (isPlaying) {
                                                    return Container(
                                                      padding: EdgeInsets.symmetric(
                                                        horizontal: context.horizontalMargin12,
                                                        vertical: context.verticalMargin5,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: theme.live,
                                                        borderRadius: BorderRadius.circular(context.radius4),
                                                      ),
                                                      child: Text(
                                                        "Live",
                                                        style: context
                                                            .textStyle12Medium(color: theme.textPrimary)
                                                            .copyWith(height: 1.2),
                                                      ),
                                                    );
                                                  }
                                                  return const SizedBox();
                                                },
                                              );
                                            }
                                            return const SizedBox();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.horizontalMargin16),
                      child: Text(
                        fixture.matchDescription,
                        style: context.textStyle12Medium(color: theme.textSecondary),
                      ),
                    )
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
