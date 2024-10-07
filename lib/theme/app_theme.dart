import 'package:dynamic_color/dynamic_color.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:ink_relay/theme/page_transitions.dart';
import 'package:ink_relay/theme/theme_extensions.dart';

class ColorTokens {
  ColorTokens._();

  // static const Color primaryColor = Color(0xFFFDC761);
  // static const Color accentColor = Color(0xFF63C5FF);
  // static const Color darkSurfaceColor = Color(0xFF181B24);
}

class AppTheme {
  AppTheme._();

  static final ThemeData _lightFlexThemeData = FlexThemeData.light(
    scheme: FlexScheme.hippieBlue,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    keyColors: const FlexKeyColors(),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
  );

  static final ThemeData _darkFlexThemeData = FlexThemeData.dark(
    scheme: FlexScheme.hippieBlue,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    keyColors: const FlexKeyColors(),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
  );

  static final ThemeData lightThemeData = _lightFlexThemeData.copyWith(
    extensions: <ThemeExtension<dynamic>>[
      const SpacingTheme(),
      const ModalTheme(),
      const DurationTheme(),
      const RadiusTheme(),
      SemanticColorsTheme(
        error: Colors.red.harmonizeWith(_lightFlexThemeData.colorScheme.error),
        warning: Colors.orange
            .harmonizeWith(_lightFlexThemeData.colorScheme.primary),
        success:
            Colors.green.harmonizeWith(_lightFlexThemeData.colorScheme.primary),
        info:
            Colors.blue.harmonizeWith(_lightFlexThemeData.colorScheme.primary),
      ),
    ],
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.macOS: NoTransitionBuilder(),
      },
    ),
  );

  static final ThemeData darkThemeData = _darkFlexThemeData.copyWith(
    extensions: <ThemeExtension<dynamic>>[
      const SpacingTheme(),
      const ModalTheme(),
      const DurationTheme(),
      const RadiusTheme(),
      SemanticColorsTheme(
        error: Colors.red.harmonizeWith(_darkFlexThemeData.colorScheme.error),
        warning:
            Colors.orange.harmonizeWith(_darkFlexThemeData.colorScheme.primary),
        success:
            Colors.green.harmonizeWith(_darkFlexThemeData.colorScheme.primary),
        info: Colors.blue.harmonizeWith(_darkFlexThemeData.colorScheme.primary),
      ),
    ],
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.macOS: NoTransitionBuilder(),
      },
    ),
  );
}
