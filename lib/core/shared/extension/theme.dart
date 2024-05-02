import '../shared.dart';

extension ThemeExtension on ThemeState {
  ThemeState copyWith({
    ThemeType? type,
  }) {
    return ThemeState(
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type.index,
    };
  }

  ThemeScheme get scheme {
    return ThemeScheme.find(type: type);
  }
}
