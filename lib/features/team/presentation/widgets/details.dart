import '../../../../core/shared/shared.dart';
import '../../team.dart';

class TeamDetailsWidget extends StatelessWidget {
  const TeamDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return BlocBuilder<TeamBloc, TeamState>(
          builder: (context, state) {
            if (state is TeamLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TeamDone) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    state.team.name.substring(0, 3),
                    style: context.textStyle17Medium(color: theme.textPrimary),
                  ),
                  const SizedBox(width: 4),
                  CachedNetworkImage(
                    imageUrl: state.team.flag,
                    width: 24,
                    height: 24,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        );
      },
    );
  }
}
