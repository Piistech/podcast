import '../../../../core/shared/shared.dart';
import '../../../team/team.dart';

class BeforeTossPrediction extends StatefulWidget {
  final String teamGuid;
  const BeforeTossPrediction({
    super.key,
    required this.teamGuid,
  });

  @override
  State<BeforeTossPrediction> createState() => _BeforeTossPredictionState();
}

class _BeforeTossPredictionState extends State<BeforeTossPrediction> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TeamBloc>(context).add(
      FetchTeam(teamGuid: widget.teamGuid),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          stops: [
            0.1,
            .9,
          ],
          colors: [
            Color(0xFF9C5B00),
            Color(0xFF482A00),
          ],
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
