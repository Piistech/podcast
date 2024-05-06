import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/shared/shared.dart';
import '../../fixture.dart';

class FixturesPage extends StatefulWidget {
  static const String path = '/fixtures';
  static const String name = 'FixturesPage';

  const FixturesPage({super.key});

  @override
  State<FixturesPage> createState() => _FixturesPageState();
}

class _FixturesPageState extends State<FixturesPage> {
  int currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<FixturesBloc, FixturesState>(
            builder: (_, state) {
              if (state is FixturesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FixturesDone) {
                return ListView.separated(
                  itemCount: state.fixtures.length,
                  padding: EdgeInsets.symmetric(
                    horizontal: context.horizontalMargin15,
                    vertical: context.verticalMargin15,
                  ),
                  separatorBuilder: (_, __) => SizedBox(height: context.verticalMargin8),
                  itemBuilder: (_, index) {
                    final fixture = state.fixtures[index];
                    return FixtureItemWidget(fixture: fixture);
                  },
                );
              } else if (state is FixturesError) {
                return Center(child: Text(state.failure.message));
              } else {
                return Container();
              }
            },
          ),
          bottomNavigationBar: BlocBuilder<FixturesBloc, FixturesState>(
            builder: (context, state) {
              if (state is FixturesDone) {
                return BottomNavyBar(
                  selectedIndex: currentIndex,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  itemCornerRadius: 8,
                  backgroundColor: theme.backgroundTertiary,
                  showElevation: false,
                  onItemSelected: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                    if (index == 1) {
                      // context.pushNamed(
                      //   LivePage.name,
                      //   pathParameters: {
                      //     'fixtureGuid': state.fixtures[index].guid,
                      //   },
                      // );
                    }
                  },
                  items: [
                    BottomNavyBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(left: context.horizontalMargin8, bottom: context.verticalMargin4),
                        child: SvgPicture.asset(
                          matchTextDirection: true,
                          alignment: Alignment.center,
                          'images/icons/home.svg',
                        ),
                      ),
                      title: Text(
                        'Home',
                        style: context.textStyle14Medium(color: theme.textPrimary),
                      ),
                      activeColor: theme.textPrimary,
                      inactiveColor: theme.textSecondary,
                    ),
                    BottomNavyBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(left: context.horizontalMargin8),
                        child: SvgPicture.asset(
                          'images/icons/live.svg',
                        ),
                      ),
                      title: Text(
                        textAlign: TextAlign.center,
                        'Live Radio',
                        style: context.textStyle14Medium(color: theme.textPrimary),
                      ),
                      activeColor: theme.textPrimary,
                    ),
                    BottomNavyBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(left: context.horizontalMargin8),
                        child: SvgPicture.asset(
                          'images/icons/podcast.svg',
                        ),
                      ),
                      title: Text(
                        textAlign: TextAlign.center,
                        'Podcast',
                        style: context.textStyle14Medium(color: theme.textPrimary),
                      ),
                      activeColor: theme.textPrimary,
                      inactiveColor: theme.textSecondary,
                    ),
                    BottomNavyBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(left: context.horizontalMargin8),
                        child: SvgPicture.asset(
                          'images/icons/more.svg',
                        ),
                      ),
                      title: Text(
                        'More',
                        style: context.textStyle14Medium(color: theme.textPrimary),
                      ),
                      activeColor: theme.textPrimary,
                      inactiveColor: theme.textSecondary,
                    ),
                  ],
                );
              } else {
                return BottomNavyBar(
                  selectedIndex: currentIndex,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  itemCornerRadius: 8,
                  backgroundColor: theme.backgroundTertiary,
                  showElevation: false,
                  // use this to remove appBar's elevation
                  onItemSelected: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  items: [
                    BottomNavyBarItem(
                      icon: const Icon(Icons.apps),
                      title: const Text('Home'),
                      activeColor: theme.textPrimary,
                    ),
                    BottomNavyBarItem(
                      icon: const Icon(Icons.cast_connected_outlined),
                      title: const Text('Live Radio'),
                      activeColor: theme.textPrimary,
                    ),
                    BottomNavyBarItem(
                      icon: const Icon(Icons.podcasts_rounded),
                      title: const Text('Podcast'),
                      activeColor: theme.textPrimary,
                    ),
                    BottomNavyBarItem(
                      icon: const Icon(Icons.list_alt_rounded),
                      title: const Text('More'),
                      activeColor: theme.textPrimary,
                    ),
                  ],
                );
              }
            },
          ),
        );
      },
    );
  }
}
