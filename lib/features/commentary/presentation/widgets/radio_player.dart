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
              //final commentary = state.commentary;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: context.horizontalMargin12),
                    child: LinearProgressIndicator(
                      backgroundColor: theme.backgroundSecondary,
                      valueColor: AlwaysStoppedAnimation(theme.textPrimary),
                      value: 0.8,
                      minHeight: 5,
                      color: theme.textSecondary,
                      borderRadius: BorderRadius.circular(context.radius12),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.skip_previous_rounded, color: theme.textPrimary),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.play_circle_fill_rounded, size: 48, color: theme.textPrimary),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.skip_next_rounded, color: theme.textPrimary),
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
