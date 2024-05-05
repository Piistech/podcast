import '../../../../core/shared/shared.dart';
import '../../../analysis/analysis.dart';
import '../../../prediction/prediction.dart';
import '../../fixture.dart';

class FixtureDetailsPage extends StatelessWidget {
  final String guid;
  static const String path = '/fixtures/:id';
  static const String name = 'FixtureDetailsPage';

  const FixtureDetailsPage({
    super.key,
    required this.guid,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const MatchTitleWidget()),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: context.horizontalMargin15,
          vertical: context.verticalMargin15,
        ),
        children: [
          AnalysisWidget(fixtureGuid: guid),
          SizedBox(height: context.verticalMargin16),
          PredictionWidget(fixtureGuid: guid),
        ],
      ),
    );
  }
}
