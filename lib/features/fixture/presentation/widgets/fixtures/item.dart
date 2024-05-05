import '../../../../../core/shared/shared.dart';
import '../../../fixture.dart';

class FixtureItemWidget extends StatelessWidget {
  final FixtureEntity fixture;
  const FixtureItemWidget({
    super.key,
    required this.fixture,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, state) {
        final theme = state.scheme;
        return InkWell(
          borderRadius: BorderRadius.circular(context.radius12),
          onTap: () {
            context.pushNamed(
              FixtureDetailsPage.name,
              pathParameters: {
                'id': fixture.guid,
              },
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.horizontalMargin12,
              vertical: context.verticalMargin12,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.radius12),
              color: theme.backgroundSecondary,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(context.radius8),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: CachedNetworkImage(
                        imageUrl: fixture.logo,
                        fit: BoxFit.cover,
                        width: 50.w,
                        height: 50.h,
                        placeholder: (context, url) => SizedBox(
                          width: 50.w,
                          height: 50.h,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) => SizedBox(
                          width: 50.w,
                          height: 50.h,
                          child: const Icon(Icons.error),
                        ),
                      ),
                    ),
                    SizedBox(width: context.horizontalMargin8),
                    Expanded(
                      child: Text(
                        fixture.matchTitle,
                        style: context.textStyle17Medium(color: theme.textPrimary).copyWith(height: 1.2),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.verticalMargin12),
                Text(
                  fixture.matchDescription,
                  style: context.textStyle10Regular(color: theme.textPrimary).copyWith(height: 1.2),
                ),
                SizedBox(height: context.verticalMargin16),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 12.r,
                          backgroundColor: theme.white,
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: theme.backgroundPrimary,
                          ),
                        ),
                        SizedBox(width: context.horizontalMargin4),
                        Text(
                          "Play Now",
                          style: context.textStyle12Medium(color: theme.textPrimary).copyWith(letterSpacing: -0.04),
                        ),
                      ],
                    ),
                    Text(
                      fixture.startDate,
                      style: context.textStyle10Regular(color: theme.textPrimary).copyWith(height: 1.2),
                    ),
                  ],
                ),
                SizedBox(height: context.verticalMargin16),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: context.horizontalMargin8, vertical: context.verticalMargin4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: theme.backgroundTertiary,
                    ),
                    child: Text(
                      "Prediction",
                      style: context.textStyle10Medium(color: theme.textPrimary).copyWith(height: 1.2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
