import '../../../../core/config/config.dart';
import '../../../../core/shared/shared.dart';
import '../../../team/team.dart';
import '../../prediction.dart';

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
          return ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              BlocProvider(
                create: (context) => sl<TeamBloc>(),
                child: BeforeTossPrediction(teamGuid: state.prediction.winnerTeamId),
              ),
              SizedBox(height: context.verticalMargin15),
              BlocProvider(
                create: (context) => sl<TeamBloc>(),
                child: AfterTossPrediction(
                  teamGuid: state.prediction.winnerTeamIdAfterToss,
                ),
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
