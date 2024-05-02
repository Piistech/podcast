library config;

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:podcast/features/prediction/data/repositories/repo_impl.dart';
import 'package:podcast/features/prediction/domain/repositories/repo.dart';
import 'package:podcast/features/prediction/prediction.dart';
import 'package:podcast/features/prediction/presentation/bloc/prediction_bloc.dart';

import '../../features/fixture/fixture.dart';
import '../shared/shared.dart';

part 'dependencies.dart';
part 'network_certificates.dart';

class AppConfig {
  static FutureOr<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Bypass the SSL certificate verification
    HttpOverrides.global = MyHttpOverrides();

    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory:  await getApplicationCacheDirectory(),
    );

    // Initialize the configurations
    await _setupDependencies();
  }

  static ThemeData theme({
    required BuildContext context,
    required ThemeScheme theme,
  }) =>
      ThemeData(
        brightness: Brightness.light,
        canvasColor: theme.background,
        shadowColor: theme.shadow,
        indicatorColor: theme.accent,
        splashColor: theme.tag,
        highlightColor: theme.highlight,
        splashFactory: InkRipple.splashFactory,
        dividerColor: theme.shadow,
        dividerTheme: DividerThemeData(color: theme.shadow, space: 1, thickness: 1),
        primaryColor: theme.accent,
        progressIndicatorTheme: ProgressIndicatorThemeData(color: theme.accent),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          filled: true,
          fillColor: theme.card,
          labelStyle: TextStyles.body(context: context, color: theme.text),
          contentPadding: const EdgeInsets.all(16.0),
          hintStyle: TextStyles.body(context: context, color: theme.hint),
          errorStyle: TextStyles.caption(context: context, color: theme.error).copyWith(height: 0, fontSize: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black, width: .5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black, width: 4),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: theme.error, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: theme.error, width: 3),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 1,
            shadowColor: theme.shadow,
            padding: const EdgeInsets.all(16),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: theme.accent,
            elevation: 3,
            shadowColor: theme.shadow,
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(cursorColor: theme.text),
        iconTheme: IconThemeData(color: theme.text, size: 20),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: Colors.black),
          titleSpacing: 0,
          actionsIconTheme: IconThemeData(color: theme.accent),
          backgroundColor: theme.background,
          surfaceTintColor: theme.background,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: theme.accent,
        ).copyWith(background: theme.background),
      );
}
