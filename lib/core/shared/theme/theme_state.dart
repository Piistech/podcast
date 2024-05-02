part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeType type;
  const ThemeState({
    this.type = ThemeType.light,
  });

  @override
  List<Object> get props => [type];

  factory ThemeState.parse({
    required Map<String, dynamic> map,
  }) {
    return ThemeState(
      type: ThemeType.values[map['type']],
    );
  }
}
