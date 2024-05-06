import 'core/config/config.dart';
import 'core/shared/shared.dart';
import 'features/commentary/commentary.dart';

void main() async {
  await AppConfig.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ThemeBloc>()),
        BlocProvider(create: (_) => sl<LiveCommentaryStatusBloc>()),
        BlocProvider(create: (_) => sl<CurrentlyPlayingCommentaryBloc>()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, state) {
            final theme = state.scheme;
            return MaterialApp.router(
              routerConfig: router,
              theme: AppConfig.theme(
                context: context,
                theme: theme,
              ),
            );
          },
        );
      },
    );
  }
}
