// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/shared/shared.dart';
import '../../../team/team.dart';

class TeamNameAndFlagWidget extends StatelessWidget {
  final bool isEnd;
  const TeamNameAndFlagWidget({
    super.key,
    required this.isEnd,
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
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: isEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(context.radius10),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: CachedNetworkImage(
                      imageUrl: state.team.flag,
                      fit: BoxFit.cover,
                      width: 40.w,
                      height: 20.h,
                      placeholder: (context, url) => SizedBox(
                        width: 40.w,
                        height: 20.h,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) => SizedBox(
                        width: 40.w,
                        height: 20.h,
                        child: Image.asset('images/splash.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: context.horizontalMargin12),
                  Text(
                    state.team.name,
                    style: context.textStyle17Medium(color: theme.textPrimary).copyWith(height: 1.2),
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
