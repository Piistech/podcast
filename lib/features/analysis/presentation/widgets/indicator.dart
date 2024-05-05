import '../../../../core/shared/shared.dart';

class AnalysisIndicator extends StatelessWidget {
  final int score;
  const AnalysisIndicator({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return SizedBox(
          height: 8.h,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(width: context.horizontalMargin1),
            itemBuilder: (_, index) {
              return Container(
                color: index + 1 > score
                    ? theme.textSecondary
                    : score <= 2
                        ? theme.negative
                        : score <= 5
                            ? theme.warning
                            : theme.positive,
                child: SizedBox(
                  width: 6.w,
                  height: 8.h,
                ),
              );
            },
            itemCount: 10,
          ),
        );
      },
    );
  }
}
