import '../../../../core/shared/shared.dart';
import '../../../team/team.dart';

class AfterTossPrediction extends StatefulWidget {
  final String teamGuid;
  const AfterTossPrediction({
    super.key,
    required this.teamGuid,
  });

  @override
  State<AfterTossPrediction> createState() => _AfterTossPredictionState();
}

class _AfterTossPredictionState extends State<AfterTossPrediction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          stops: [0.1, .9],
          colors: [
            Color(0xFF1F3344),
            Color(0xFF00448C),
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
                'Match Prediction (After)',
                style: TextStyles.title(
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
