import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  Color get primaryColor => theme.primaryColor;

  Color get hintColor => theme.hintColor;

  Color get textColor => Colors.black;

  Color get secondaryColor => theme.cardColor;

  Color get backgroundColor => Colors.white;

  double get topInset => MediaQuery.of(this).padding.top;

  double get bottomInset => MediaQuery.of(this).padding.bottom;

  double get smallestSide => MediaQuery.of(this).size.shortestSide;
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  ScaffoldMessengerState successNotification({
    required String message,
  }) {
    final theme = themeBloc.state.scheme;
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyles.body(context: this, color: theme.textPrimary),
      ),
      backgroundColor: theme.positive,
    );
    return ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  ScaffoldMessengerState errorNotification({
    required String message,
  }) {
    final theme = themeBloc.state.scheme;
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyles.body(context: this, color: theme.textPrimary),
      ),
      backgroundColor: theme.negative,
    );
    return ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  ScaffoldMessengerState warningNotification({
    required String message,
  }) {
    final theme = themeBloc.state.scheme;
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyles.body(context: this, color: theme.backgroundPrimary),
      ),
      backgroundColor: theme.warning,
    );
    return ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  ThemeBloc get themeBloc => read<ThemeBloc>();

  bool get isMobile {
    final size = MediaQuery.of(this).size;
    return size.width < 600;
  }
}
