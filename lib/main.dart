import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toku/screens/darkmode/App.dart';
import 'package:toku/screens/darkmode/theme_cubit.dart';
import 'package:toku/screens/homepage.dart';
import 'package:toku/screens/learn_provider/my_app_learn.dart';
import 'package:toku/screens/multi_lang.dart';
import 'package:toku/screens/payment/thank_you.dart';
import 'package:toku/screens/provider_darkmode/Cach_helper.dart';
import 'package:toku/screens/provider_darkmode/my_app.dart';
import 'package:toku/screens/provider_darkmode/tt.dart';
import 'package:toku/screens/save.dart';
import 'package:toku/screens/test_final_add_section.dart';
import 'package:toku/screens/test_multi.dart';
import 'package:toku/screens/test_protocol/protocol.dart';
import 'package:toku/screens/test_provider/category.dart';
import 'package:toku/screens/test_provider/mm.dart';
import 'package:toku/screens/test_your_self.dart';
import 'package:toku/screens/video_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init(); // Initialize CacheHelper before runApp
  runApp(ProviderScope(child: MyLearnProvider()));
}
class Lang extends StatelessWidget {
  const Lang({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHome(),
    );
  }
}


class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return App2();
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ThemeCubit(),
        child: App(),
  );

  }
}
class TokuApp extends StatelessWidget {
  const TokuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MyHomePage(),

    );
  }
}
