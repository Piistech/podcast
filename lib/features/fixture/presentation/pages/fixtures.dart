import '../../../../core/shared/shared.dart';
import '../widgets/fixtures/tab/tab_cricket.dart';
import '../widgets/fixtures/tab/tab_football.dart';

class FixturesPage extends StatefulWidget {
  static const String path = '/fixtures';
  static const String name = 'FixturesPage';

  const FixturesPage({super.key});

  @override
  State<FixturesPage> createState() => _FixturesPageState();
}

class _FixturesPageState extends State<FixturesPage> with SingleTickerProviderStateMixin {
  late final TabController tabController;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Scaffold(
            backgroundColor: theme.backgroundPrimary,
            appBar: TabBar(
              labelStyle: TextStyles.body(context: context, color: theme.textPrimary).copyWith(fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyles.body(context: context, color: theme.textSecondary),
              indicatorWeight: 3,
              tabAlignment: TabAlignment.center,
              dividerColor: Colors.transparent,
              indicatorColor: theme.warning,
              physics: const ScrollPhysics(),
              isScrollable: true,
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Cricket",
                      style: context.textStyle17Medium(color: theme.textPrimary).copyWith(height: 1.2),
                    ),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Football",
                      style: context.textStyle17Medium(color: theme.textPrimary).copyWith(height: 1.2),
                    ),
                  ),
                ),
              ],
            ),
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const [
                TabCricket(),
                TabFootball(),
              ],
            ),
          ),
        );
      },
    );
  }
}
