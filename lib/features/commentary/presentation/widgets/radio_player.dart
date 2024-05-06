import '../../../../core/shared/shared.dart';
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
        return BlocBuilder<CommentaryBloc, CommentaryState>(
          builder: (context, state) {
            if (state is CommentaryLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CommentaryDone) {
              final String channelId = state.commentary.channelId;
              final String token = state.commentary.token;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: context.horizontalMargin12),
                    child: BlocBuilder<CurrentlyPlayingCommentaryBloc, CurrentlyPlayingCommentaryState>(
                      builder: (context, state) {
                        final bool isPlaying = state is CurrentlyPlayingCommentaryChannel && state.channelId == channelId;
                        return Slider(
                          value: isPlaying ? 1 : 0,
                          min: 0,
                          max: 1,
                          allowedInteraction: SliderInteraction.slideOnly,
                          onChanged: (value) {},
                          activeColor: isPlaying ? theme.live : theme.textPrimary,
                          inactiveColor: isPlaying ? theme.live : theme.textPrimary,
                          thumbColor: isPlaying ? theme.live : theme.textPrimary,
                          secondaryActiveColor: isPlaying ? theme.live : theme.textPrimary,
                          overlayColor: MaterialStateProperty.all<Color>(isPlaying ? theme.live : theme.textPrimary),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.skip_previous_rounded,
                          color: theme.textPrimary,
                          size: 30.w,
                        ),
                      ),
                      BlocBuilder<PlayCommentaryBloc, PlayCommentaryState>(
                        builder: (context, state) {
                          if (state is PlayCommentaryLoading) {
                            return IconButton(
                              onPressed: () {},
                              icon: SizedBox(
                                width: 40.w,
                                height: 40.w,
                                child: const CircularProgressIndicator(),
                              ),
                            );
                          } else {
                            return BlocBuilder<CurrentlyPlayingCommentaryBloc, CurrentlyPlayingCommentaryState>(
                              builder: (context, state) {
                                final bool isPlaying =
                                    state is CurrentlyPlayingCommentaryChannel && state.channelId == channelId;
                                return IconButton(
                                  onPressed: () {
                                    if (isPlaying) {
                                      context.read<StopCommentaryBloc>().add(const StopCommentary());
                                    } else {
                                      context.read<PlayCommentaryBloc>().add(
                                            PlayCommentary(
                                              channelId: channelId,
                                              token: token,
                                            ),
                                          );
                                    }
                                  },
                                  icon: Icon(
                                    isPlaying ? Icons.stop_circle_rounded : Icons.play_circle_fill_rounded,
                                    size: 40.w,
                                    color: isPlaying ? theme.live : theme.playButton,
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.skip_next_rounded,
                          color: theme.textPrimary,
                          size: 30.w,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        );
      },
    );
  }
}
