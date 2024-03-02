// app.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme_notifier.dart';
import 'home_screen.dart';

class App2 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _themeDarkMode = ref.watch(themeDarkMode);
    return MaterialApp(
      theme: ThemeData(
        brightness: _themeDarkMode == ThemeModeEnum.light
            ? Brightness.light
            : Brightness.dark,
        // Define your light mode theme colors here
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        // Define your dark mode theme colors here
      ),
      home: HomeScreenPro(),
    );
  }
}