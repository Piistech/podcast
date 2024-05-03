import 'package:flutter/material.dart';
import 'package:podcast/core/shared/shared.dart';

class AnalysisWidget extends StatelessWidget {
  final String fixtureGuid;
  const AnalysisWidget({
    super.key,
    required this.fixtureGuid,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Team Alanysis",
          style: TextStyles.title(context: context, color: context.textColor),
        ),
      ],
    );
  }
}
