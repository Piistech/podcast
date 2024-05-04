import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:podcast/features/fixture/fixture.dart';

import '../../../../core/shared/shared.dart';

class MatchDescriptionWidget extends StatelessWidget {
  final FixtureEntity fixture;
  const MatchDescriptionWidget({
    super.key,
    required this.fixture,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            size: 14,
          )
              .animate(
                onPlay: (controller) => controller.repeat(),
              )
              .shake(duration: 2000.ms),
          const SizedBox(width: 4),
          Text(
            "Live from - ${fixture.stadiumName}",
            overflow: TextOverflow.ellipsis,
            style: TextStyles.caption(
              context: context,
              color: context.textColor,
            ).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
