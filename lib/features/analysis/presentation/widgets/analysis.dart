import 'package:podcast/core/shared/shared.dart';

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<AnalysisBloc, AnalysisState>(
        builder: (context, state) {
          if (state is AnalysisLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AnalysisDone) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Team Analysis (Last ${state.analysis.matchCount}% matches)",
                  style: TextStyles.title(context: context, color: context.textColor),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: context.textColor.withOpacity(0.03),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Bat/Bowl\nPoints",
                              style: TextStyles.caption(context: context, color: context.textColor)
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            BlocProvider(
                              create: (context) => sl<TeamBloc>()
                                ..add(
                                  FetchTeam(
                                    teamGuid: state.analysis.homeTeamId,
                                  ),
                                ),
                              child: const TeamDetailsWidget(),
                            ),
                            BlocProvider(
                              create: (context) => sl<TeamBloc>()
                                ..add(
                                  FetchTeam(
                                    teamGuid: state.analysis.awayTeamId,
                                  ),
                                ),
                              child: const TeamDetailsWidget(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ListView.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 16,
                            );
                          },
                          itemCount: state.analysis.factors.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (context, index) {
                            final factor = state.analysis.factors[index];
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  factor.label,
                                  style: TextStyles.caption(context: context, color: context.textColor)
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 48,
                                  height: 8,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) => const SizedBox(
                                      width: 1,
                                    ),
                                    shrinkWrap: true,
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        height: 4,
                                        width: 6,
                                        decoration: BoxDecoration(
                                          color: factor.homeTeamScore > index ? Colors.green : Colors.grey,
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 48,
                                  height: 8,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) => const SizedBox(
                                      width: 1,
                                    ),
                                    shrinkWrap: true,
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        height: 4,
                                        width: 6,
                                        decoration: BoxDecoration(
                                          color: factor.awayTeamScore > index ? Colors.green : Colors.grey,
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
