import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/shared.dart';
import '../../../team/team.dart';

class BeforePrediction extends StatefulWidget {
  final String fixtureGuid;
  const BeforePrediction({
    super.key,
    required this.fixtureGuid,
  });

  @override
  State<BeforePrediction> createState() => _BeforePredictionState();
}

class _BeforePredictionState extends State<BeforePrediction> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TeamBloc>(context).add(
      FetchTeam(fixtureGuid: widget.fixtureGuid),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Colors.orange.shade900,
            Colors.orange.shade900,
            Colors.orange.shade900,
            Colors.black,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Match Prediction',
                style: TextStyles.body(
                  context: context,
                  color: context.backgroundColor,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Match Winner',
                  style: TextStyles.body(
                    context: context,
                    color: context.backgroundColor,
                  ).copyWith(fontWeight: FontWeight.bold),
                ),
                BlocBuilder<TeamBloc, TeamState>(
                  builder: (context, state) {
                    if (state is TeamLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is TeamDone) {
                      return Text(
                        state.team.name,
                        style: TextStyles.body(
                          context: context,
                          color: context.backgroundColor,
                        ).copyWith(fontWeight: FontWeight.bold),
                      );
                    } else if (state is TeamError) {
                      return Text(
                        state.failure.message,
                        style: TextStyles.body(
                          context: context,
                          color: context.backgroundColor,
                        ).copyWith(fontWeight: FontWeight.bold),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
