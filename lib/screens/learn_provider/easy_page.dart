import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toku/screens/darkmode/App.dart';
import 'package:toku/screens/learn_provider/riverpod.dart';

class EasyPage extends ConsumerWidget {
  const EasyPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return  Scaffold(
      appBar:AppBar(
        title: const Text('Easy Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ref.watch(riverpodHardLevel).counter.toString(),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
            ),
            ElevatedButton(onPressed: (){
              ref.read(riverpodHardLevel).addCounter();
            },
                child: Text('+ Add'),

            ),
            ElevatedButton(onPressed: (){

              ref.read(riverpodHardLevel).removeCounter();
            },
              child: Text('- Remove'),

            )
          ],
        ),
      ),
    );
  }
}
