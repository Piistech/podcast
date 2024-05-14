import '../../../../core/shared/shared.dart';
import '../../../team/team.dart';

class TeamNameAndFlagWidget extends StatefulWidget {
  final String teamGuid;
  const TeamNameAndFlagWidget({super.key, required this.teamGuid});

  @override
  State<TeamNameAndFlagWidget> createState() => _TeamNameAndFlagWidgetState();
}

class _TeamNameAndFlagWidgetState extends State<TeamNameAndFlagWidget> {
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
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(context.radius8),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: CachedNetworkImage(
                      imageUrl: state.team.flag,
                      fit: BoxFit.cover,
                      width: 20.w,
                      height: 20.h,
                      placeholder: (context, url) => SizedBox(
                        width: 20.w,
                        height: 20.h,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) => SizedBox(
                        width: 20.w,
                        height: 20.h,
                        child: Image.asset('images/splash.png'),
                      ),
                    ),
                  ),
                  SizedBox(width: context.horizontalMargin8),
                  Expanded(
                      child: Text(
                    state.team.name,
                    style: context.textStyle10Medium(color: theme.textPrimary).copyWith(height: 1.2),
                  )),
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
