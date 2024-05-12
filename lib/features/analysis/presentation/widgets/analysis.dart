import '../../../../core/shared/shared.dart';

import '../../../../core/config/config.dart';
import '../../../team/team.dart';
import '../../analysis.dart';

class AnalysisWidget extends StatefulWidget {
  final String fixtureGuid;
  const AnalysisWidget({
    super.key,
    required this.fixtureGuid,
  });

  @override
  State<AnalysisWidget> createState() => _AnalysisWidgetState();
}

class _AnalysisWidgetState extends State<AnalysisWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AnalysisBloc>(context).add(
      FetchAnalysis(fixtureGuid: widget.fixtureGuid),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, state) {
        final theme = state.scheme;
        return BlocBuilder<AnalysisBloc, AnalysisState>(
          builder: (context, state) {
            if (state is AnalysisLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AnalysisDone) {
              return ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Team Analysis",
                          style: context.textStyle20Medium(color: theme.textPrimary),
                        ),
                        WidgetSpan(child: SizedBox(width: context.horizontalMargin4)),
                        TextSpan(
                          text: "(Last ${state.analysis.matchCount} matches)",
                          style: context.textStyle12Medium(color: theme.textPrimary),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: context.verticalMargin16),
                  Container(
                    decoration: BoxDecoration(
                      color: theme.backgroundSecondary,
                      borderRadius: BorderRadius.circular(context.radius10),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: context.horizontalMargin19,
                      vertical: context.verticalMargin14,
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Bat/Bowl Fronts",
                                style: context.textStyle10Medium(color: theme.textPrimary).copyWith(height: 1.2),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: BlocProvider(
                                create: (_) => sl<TeamBloc>()
                                  ..add(
                                    FetchTeam(
                                      teamGuid: state.analysis.homeTeamId,
                                    ),
                                  ),
                                child: const TeamShortNameAndFlagWidget(),
                              ),
                            ),
                            BlocProvider(
                              create: (_) => sl<TeamBloc>()
                                ..add(
                                  FetchTeam(
                                    teamGuid: state.analysis.awayTeamId,
                                  ),
                                ),
                              child: const TeamShortNameAndFlagWidget(),
                            ),
                          ],
                        ),
                        SizedBox(height: context.verticalMargin12),
                        ListView.separated(
                          padding: EdgeInsets.zero,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: context.verticalMargin20);
                          },
                          itemCount: state.analysis.factors.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (context, index) {
                            final factor = state.analysis.factors[index];
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      factor.label,
                                      style: context.textStyle10Medium(color: theme.textPrimary).copyWith(height: 1.2),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: AnalysisIndicator(
                                      score: factor.homeTeamScore,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: AnalysisIndicator(
                                      score: factor.awayTeamScore,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        );
      },
    );
  }
}
