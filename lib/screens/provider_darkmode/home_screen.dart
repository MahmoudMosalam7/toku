// home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toku/screens/provider_darkmode/home2_pro.dart';
import 'theme_notifier.dart';

class HomeScreenPro extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dark Mode Example2'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ref.read(themeDarkMode.notifier).selectMode();
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
              return Ho2();
            }));
          },
          child: Text('Toggle Theme'),
        ),
      ),
    );
  }
}
