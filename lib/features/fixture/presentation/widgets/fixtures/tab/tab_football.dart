import '../../../../../../core/shared/shared.dart';

class TabFootball extends StatelessWidget {
  const TabFootball({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Center(
          child: Container(
            alignment: Alignment.center,
            width: 329.w,
            height: 299.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.radius10),
              color: theme.textPrimary,
            ),
            child: Text(
              "Coming soon",
              style: context.textStyle20Medium(color: theme.backgroundPrimary).copyWith(height: 1.2),
            )
                .animate(
                  onPlay: (controller) => controller.repeat(),
                  onComplete: (controller) => controller.repeat(),
                )
                .scale(
                  duration: const Duration(milliseconds: 2000),
                ),
          ),
        );
      },
    );
  }
}
