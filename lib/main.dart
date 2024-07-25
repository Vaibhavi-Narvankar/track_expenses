import 'package:flutter/material.dart';
import 'package:track_expenses/primary_screen.dart';
// import 'package:flutter/services.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 121, 210, 204),
);

void main() {
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((fn) { code for runnig app in only potrait mode
    runApp(
      MaterialApp(
        theme: ThemeData().copyWith(
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryFixed,
            foregroundColor: kColorScheme.inversePrimary,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kColorScheme.inversePrimary,
            margin: const EdgeInsets.all(8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kColorScheme.inversePrimary),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kColorScheme.onInverseSurface,
                    fontSize: 16),
              ),
        ),
        home: const PrimaryScreen(),
      ),
    );
  // });
}
