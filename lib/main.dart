import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toku/screens/darkmode/App.dart';
import 'package:toku/screens/darkmode/theme_cubit.dart';
import 'package:toku/screens/language/localization.dart';
import 'package:toku/screens/provider_darkmode/Cach_helper.dart';
import 'package:toku/screens/provider_darkmode/my_app.dart';
import 'package:toku/screens/test_provider/mm.dart';
import 'package:toku/translations/codegen_loader.g.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init(); // Initialize CacheHelper before runApp
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      path:'assets/translations' ,
      supportedLocales: [
        Locale('ar'),
        Locale('en'),
      ],
      fallbackLocale:Locale('en') ,
      assetLoader: CodegenLoader(),
      child: LangHome()));
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
