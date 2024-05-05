import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../prediction.dart';
import 'after_prediction.dart';
import 'before_prediction.dart';

class PredictionWidget extends StatefulWidget {
  final String fixtureGuid;
  const PredictionWidget({
    super.key,
    required this.fixtureGuid,
  });

  @override
  State<PredictionWidget> createState() => _PredictionWidgetState();
}

class _PredictionWidgetState extends State<PredictionWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PredictionBloc>(context).add(
      FetchPrediction(fixtureGuid: widget.fixtureGuid),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PredictionBloc, PredictionState>(
      builder: (context, state) {
        if (state is PredictionLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PredictionDone) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BeforePrediction(teamGuid: state.prediction.winnerTeamId),
              const SizedBox(height: 16),
              AfterPrediction(
                teamGuid: state.prediction.winnerTeamIdAfterToss,
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
