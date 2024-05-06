import '../shared.dart';

class ThemeScheme {
  final Color backgroundPrimary;
  final Color backgroundSecondary;
  final Color backgroundTertiary;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTossPrimary;
  final Color positive;
  final Color negative;
  final Color live;
  final Color warning;
  final Color scoreCardBottom;
  final Color pink;
  final Color white;
  final Color playButton;
  final Gradient gradient;

  ThemeScheme({
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.backgroundTertiary,
    required this.textPrimary,
    required this.textSecondary,
    required this.positive,
    required this.negative,
    required this.live,
    required this.warning,
    required this.textTossPrimary,
    required this.scoreCardBottom,
    required this.pink,
    required this.white,
    required this.gradient,
    required this.playButton,
  });

  factory ThemeScheme.find({
    required ThemeType type,
  }) {
    final theme = ThemeScheme(
      backgroundPrimary: const Color(0xFF0C131D),
      backgroundSecondary: const Color(0xFF15212D),
      backgroundTertiary: const Color(0xFF2C5370),
      textPrimary: const Color(0xFFCCD0D3),
      textSecondary: const Color(0xFF919496),
      textTossPrimary: const Color(0xFFFFAF40),
      positive: const Color(0xFF00FB64),
      negative: const Color(0xFFFF2C2C),
      live: const Color(0xFFFF2C2C),
      warning: const Color(0xFFFDDD00),
      scoreCardBottom: const Color(0xFF00BAFF),
      pink: const Color(0xFFC521FF),
      playButton: const Color(0xFFD9D9D9),
      white: const Color(0xFFFFFFFF),
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.04, 0.26, 0.68, 1.0],
        colors: [
          Color(0xFF0C131D),
          Colors.transparent,
          Colors.transparent,
          Color(0xFF0C131D),
        ],
      ),
    );

    return theme;
  }
}
