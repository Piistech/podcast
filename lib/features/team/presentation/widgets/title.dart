import '../../../../core/shared/shared.dart';
import '../../../fixture/fixture.dart';
import 'name.dart';

class TeamTitle extends StatelessWidget {
  final FixtureEntity fixture;
  const TeamTitle({
    super.key,
    required this.fixture,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TeamNameWidget(
            teamGuid: fixture.homeTeamId,
          ),
          Text(
            " VS ",
            style: TextStyles.body(
              context: context,
              color: context.textColor,
            ),
          ),
          TeamNameWidget(
            teamGuid: fixture.awayTeamId,
          ),
          const SizedBox(width: 8),
          Text(
            fixture.matchTitle,
            style: TextStyles.caption(
              context: context,
              color: context.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
