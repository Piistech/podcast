import 'package:podcast/features/fixture/presentation/pages/fixtures.dart';

import '../../../../core/shared/shared.dart';
import '../../../live_audio/presentation/pages/lives_radio.dart';
import '../../../more/presentation/pages/more.dart';

class HomePage extends StatefulWidget {
  static const String path = '/home';
  static const String name = 'HomePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  late final List<Widget> fragments;
  @override
  void initState() {
    fragments = [
      const FixturesPage(),
      const LiveRadioPage(),
      const MorePage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          appBar: AppBar(),
          body: fragments.elementAt(currentIndex),
          bottomNavigationBar: PhysicalModel(
            color: theme.backgroundTertiary,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.horizontalMargin15,
                vertical: context.verticalMargin11,
              ).copyWith(bottom: (context.bottomInset / 2) + context.verticalMargin11),
              width: double.maxFinite,
              height: 54.h + (context.bottomInset / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  currentIndex == 0
                      ? SelectedNavItem(
                          icon: "images/icons/home.svg",
                          title: "Home",
                          index: 0,
                          previous: currentIndex,
                        )
                      : UnselectedNavItem(
                          icon: "images/icons/home.svg",
                          onTap: () {
                            setState(() => currentIndex = 0);
                          },
                        ),
                  currentIndex == 1
                      ? SelectedNavItem(
                          icon: "images/icons/live.svg",
                          title: "Live Radio",
                          index: 1,
                          previous: currentIndex,
                        )
                      : UnselectedNavItem(
                          icon: "images/icons/live.svg",
                          onTap: () {
                            setState(() => currentIndex = 1);
                          },
                        ),
                  currentIndex == 2
                      ? SelectedNavItem(
                          icon: "images/icons/more.svg",
                          title: "More",
                          index: 3,
                          previous: currentIndex,
                        )
                      : UnselectedNavItem(
                          icon: "images/icons/more.svg",
                          onTap: () {
                            setState(() => currentIndex = 2);
                          },
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SelectedNavItem extends StatelessWidget {
  final String icon;
  final String title;
  final int index;
  final int previous;

  const SelectedNavItem({
    super.key,
    required this.icon,
    required this.title,
    required this.index,
    required this.previous,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.horizontalMargin6,
            vertical: context.verticalMargin6,
          ),
          decoration: BoxDecoration(
            color: theme.textPrimary,
            borderRadius: BorderRadius.circular(context.radius4),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                  theme.backgroundPrimary,
                  BlendMode.srcIn,
                ),
                width: 20.w,
                height: 20.h,
              ),
              SizedBox(width: context.horizontalMargin2),
              Text(
                title,
                style: context.textStyle17Regular(color: theme.backgroundPrimary).copyWith(height: 1.2),
              ),
            ],
          ),
        ).animate()
          ..fade(
            duration: const Duration(milliseconds: 300),
          );
      },
    );
  }
}

class UnselectedNavItem extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;

  const UnselectedNavItem({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return InkWell(
          onTap: onTap,
          child: SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(
              theme.textPrimary,
              BlendMode.srcIn,
            ),
            width: 24.w,
            height: 24.h,
          ).animate()
            ..moveX(
              duration: const Duration(milliseconds: 300),
            ),
        );
      },
    );
  }
}
