import 'package:podcast/core/shared/task_notifier.dart';

import '../../../../core/shared/shared.dart';
import '../../../fixture/fixture.dart';
import '../../commentary.dart';

class RadioPlayer extends StatelessWidget {
  final String fixtureGuid;
  const RadioPlayer({
    super.key,
    required this.fixtureGuid,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return BlocBuilder<FindFixtureByIdBloc, FindFixtureByIdState>(
          builder: (context, state) {
            if (state is FindFixtureByIdDone) {
              final fixture = state.fixture;
              return BlocBuilder<CommentaryBloc, CommentaryState>(
                builder: (context, state) {
                  if (state is CommentaryLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CommentaryDone) {
                    final String channelId = state.commentary.channelId;
                    final String token = state.commentary.token;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.horizontalMargin15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BlocConsumer<CurrentlyPlayingCommentaryBloc, CurrentlyPlayingCommentaryState>(
                            builder: (context, state) {
                              final bool isPlaying = state is CurrentlyPlayingCommentaryChannel && state.channelId == channelId;
                              return Row(
                                children: [
                                  if (!isPlaying) Icon(Icons.circle, color: theme.white, size: context.radius16),
                                  Expanded(
                                    child: Container(
                                      width: double.maxFinite,
                                      height: context.verticalMargin4,
                                      decoration: BoxDecoration(
                                        color: isPlaying ? theme.live : theme.textSecondary,
                                        borderRadius: BorderRadius.circular(context.radius52),
                                      ),
                                    ),
                                  ),
                                  if (isPlaying) Icon(Icons.circle, color: theme.live, size: context.radius16),
                                ],
                              );
                            },
                            listener: (BuildContext context, CurrentlyPlayingCommentaryState state) {
                              if (state is CurrentlyPlayingCommentaryTokenExpired) {
                                TaskNotifier.instance.error(context, message: "Token expired");
                              }
                            },
                          ),
                          SizedBox(height: context.verticalMargin16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.skip_previous_rounded,
                                color: theme.textPrimary,
                                size: 28.h,
                              ),
                              BlocBuilder<PlayCommentaryBloc, PlayCommentaryState>(
                                builder: (context, state) {
                                  if (state is PlayCommentaryLoading) {
                                    return SizedBox(
                                      width: 40.w,
                                      height: 40.w,
                                      child: const CircularProgressIndicator(),
                                    );
                                  } else {
                                    return BlocBuilder<CurrentlyPlayingCommentaryBloc, CurrentlyPlayingCommentaryState>(
                                      builder: (context, state) {
                                        final bool isPlaying =
                                            state is CurrentlyPlayingCommentaryChannel && state.channelId == channelId;
                                        return InkWell(
                                          borderRadius: BorderRadius.circular(context.radius52),
                                          onTap: () {
                                            if (isPlaying) {
                                              context.read<StopCommentaryBloc>().add(const StopCommentary());
                                            } else {
                                              context.read<PlayCommentaryBloc>().add(
                                                    PlayCommentary(
                                                      channelId: channelId,
                                                      token: token,
                                                      fixtureGuid: fixtureGuid,
                                                      fixtureIcon: fixture.logo,
                                                      matchName: fixture.matchTitle,
                                                    ),
                                                  );
                                            }
                                          },
                                          child: Icon(
                                            isPlaying ? Icons.stop_circle_rounded : Icons.play_circle_fill_rounded,
                                            size: 40.h,
                                            color: isPlaying ? theme.live : theme.playButton,
                                          ),
                                        );
                                      },
                                    );
                                  }
                                },
                              ),
                              Icon(
                                Icons.skip_next_rounded,
                                color: theme.textPrimary,
                                size: 28.h,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              );
            }
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
