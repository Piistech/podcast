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
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_outline),
              ),
            ],
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
                      height: context.height * .78,
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
                                  height: context.height * .65,
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
                                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                fixture.matchTitle,
                                                style: context.textStyle17Medium(color: theme.textPrimary),
                                              ),
                                              Text(
                                                "T Score",
                                                style: context.textStyle14Medium(color: theme.textSecondary),
                                              ),
                                            ],
                                          ),
                                        ),
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
                                                          style: context.textStyle12Medium(color: theme.textPrimary),
                                                        ));
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
                        "Welcome to the highly anticipated Bangladesh vs Sri Lanka cricket match! It's a beautiful day for cricket and the stadium is packed with enthusiastic fans from both",
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
