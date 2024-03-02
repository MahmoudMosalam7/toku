import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../translations/locale_keys.g.dart';

class TranslateLang extends StatelessWidget {
  const TranslateLang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LocaleKeys.hello.tr()),
            Text(LocaleKeys.RBCs.tr()),
            Text(LocaleKeys.Test.tr()),
            ElevatedButton(onPressed: ()async{
              await context.setLocale(Locale('ar'));
            }, child: Text('Ar')),
            ElevatedButton(onPressed: ()async{
             await context.setLocale(Locale('en'));
            }, child: Text('En')),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Second();
              }));
            }, child: Text('go to')),
          ],
        ),
      ),
    );
  }
}
class LangHome extends StatelessWidget {
  const LangHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: TranslateLang(),
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale:context.locale ,
    );
  }
}
class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(LocaleKeys.Test.tr()),
      ),
    );
  }
}
