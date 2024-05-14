import '../shared.dart';

class ShimmerLabel extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsets? margin;
  final double radius;
  final bool delete;

  const ShimmerLabel({
    super.key,
    required this.width,
    required this.height,
    this.margin,
    this.radius = 8,
    this.delete = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Container(
          margin: margin ?? EdgeInsets.zero,
          child: PhysicalModel(
            color: delete ? theme.negative : theme.shimmerColor,
            borderRadius: BorderRadius.circular(radius),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: SizedBox(
              width: width,
              height: height,
            ),
          )
              .animate(
                onComplete: (controller) => controller.repeat(),
              )
              .shimmer(
                color: Colors.transparent,
                colors: [
                  Colors.grey.shade300,
                  Colors.grey.shade200,
                  Colors.grey.shade100,
                  Colors.grey.shade50,
                  Colors.grey.shade100,
                  Colors.grey.shade200,
                ],
                duration: const Duration(seconds: 1),
              ),
        );
      },
    );
  }
}