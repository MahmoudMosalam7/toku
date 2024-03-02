import 'package:flutter/material.dart';

import 'easy_page.dart';
import 'from_flutter.dart';
import 'home_p.dart';

class MyLearnProvider extends StatelessWidget {
  const MyLearnProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EasyPage(),
    );
  }
}
