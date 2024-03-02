import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toku/screens/darkmode/theme_cubit.dart';

import 'home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeModeEnum>(
      builder: (context, themeMode) {
        return MaterialApp(
          theme: ThemeData(
            brightness: themeMode == ThemeModeEnum.light ? Brightness.light : Brightness.dark,
            // Define your light mode theme colors here
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            // Define your dark mode theme colors here
          ),
          home: HomeScreen(),
        );
      },
    );
  }
}