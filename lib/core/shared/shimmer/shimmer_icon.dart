import '../shared.dart';

class ShimmerIcon extends StatelessWidget {
  final double radius;
  final bool delete;

  const ShimmerIcon({
    super.key,
    required this.radius,
    this.delete = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Container(
          width: radius,
          height: radius,
          decoration: BoxDecoration(
            color: delete ? theme.negative : theme.shimmerColor,
            shape: BoxShape.circle,
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
            );
      },
    );
  }
}