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
  void initState() {
    super.initState();
    context.read<TeamBloc>().add(
          FetchTeam(teamGuid: widget.teamGuid),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, state) {
        final theme = state.scheme;
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.horizontalMargin30,
            vertical: context.verticalMargin10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF1F3344),
                Color(0xFF00448C),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 4),
                spreadRadius: 0,
                blurRadius: 12,
                color: Color(0xFF273A4B),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: 'Match Prediction',
                    style: context.textStyle14Medium(color: theme.textPrimary).copyWith(height: 1.2),
                  ),
                  WidgetSpan(child: SizedBox(width: context.horizontalMargin8)),
                  TextSpan(
                    text: '(After Toss)',
                    style: context.textStyle12Medium(color: theme.textPrimary).copyWith(height: 1.2),
                  ),
                ])),
              ),
              SizedBox(height: context.verticalMargin25),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Match Winner',
                    style: context.textStyle14Medium(color: theme.textPrimary).copyWith(height: 1.2),
                  ),
                  const TeamFullNameWidget(),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
