import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toku/screens/learn_provider/second.dart';

class NameNotifier extends StateNotifier<int> {
  NameNotifier() : super(0);

  void increment() {
   state = state + 1;
  }

}

final nameProvider = StateNotifierProvider<NameNotifier, int>((ref) {
  return NameNotifier();
});

class MyHomeP extends StatelessWidget {
  const MyHomeP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('mmmmmmmm'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return SecondView();
          }));
        },
      ),
    );
  }
}
