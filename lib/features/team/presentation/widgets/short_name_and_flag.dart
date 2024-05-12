import '../../../../core/shared/shared.dart';
import '../../team.dart';

class TeamShortNameAndFlagWidget extends StatelessWidget {
  const TeamShortNameAndFlagWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;

        return TeamInfoWidget(
          builder: (team) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                team.shortName,
                style: context.textStyle20Medium(color: theme.textPrimary).copyWith(height: 1.2),
              ),
              SizedBox(width: context.horizontalMargin1),
              ClipRRect(
                borderRadius: BorderRadius.circular(context.radius52),
                child: CachedNetworkImage(
                  imageUrl: team.flag,
                  height: context.flagHeight20,
                  placeholder: (context, url) => SizedBox(
                          width: context.flagHeight20,
                          height: context.flagHeight20,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) => SizedBox(
                          width: context.flagHeight20,
                          height: context.flagHeight20,
                          child: Image.asset('images/splash.png'),
                        ),
                  
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
