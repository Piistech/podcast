import 'package:podcast/core/shared/shimmer/shimmer_lable.dart';

import '../../../../../core/shared/shared.dart';

class ShimmerItem extends StatelessWidget {
  const ShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Container(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(context.radius8),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: ShimmerIcon(radius: context.radius10).animate(
                      onComplete: (controller) => controller.repeat(),
                    )..shimmer(
                        color: theme.shimmerColor,
                        duration: const Duration(seconds: 1),
                      ),
                  ),
                  SizedBox(width: context.horizontalMargin8),
                  Expanded(
                    child: ShimmerLabel(width: 200.w, height: 13.h).animate(
                      onComplete: (controller) => controller.repeat(),
                    )..shimmer(
                        color: theme.shimmerColor,
                        duration: const Duration(seconds: 1),
                      ),
                  ),
                ],
              ),
              SizedBox(height: context.verticalMargin12),
              ShimmerLabel(width: 200.w, height: 13.h).animate(
                onComplete: (controller) => controller.repeat(),
              )..shimmer(
                  color: theme.shimmerColor,
                  duration: const Duration(seconds: 1),
                ),
              SizedBox(height: context.verticalMargin16),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ShimmerIcon(radius: context.radius16).animate(
                        onComplete: (controller) => controller.repeat(),
                      )..shimmer(
                          color: theme.shimmerColor,
                          duration: const Duration(seconds: 1),
                        ),
                      SizedBox(width: context.horizontalMargin4),
                      ShimmerLabel(width: 72.w, height: 13.h).animate(
                        onComplete: (controller) => controller.repeat(),
                      )..shimmer(
                          color: theme.shimmerColor,
                          duration: const Duration(seconds: 1),
                        ),
                    ],
                  ),
                  ShimmerLabel(width: 72.w, height: 13.h).animate(
                    onComplete: (controller) => controller.repeat(),
                  )..shimmer(
                      color: theme.shimmerColor,
                      duration: const Duration(seconds: 1),
                    ),
                ],
              ),
              SizedBox(height: context.verticalMargin16),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: context.horizontalMargin8, vertical: context.verticalMargin4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(context.radius5),
                    color: theme.backgroundTertiary,
                  ),
                  child: ShimmerLabel(width: 72.w, height: 13.h).animate(
                    onComplete: (controller) => controller.repeat(),
                  )..shimmer(
                      color: theme.shimmerColor,
                      duration: const Duration(seconds: 1),
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
