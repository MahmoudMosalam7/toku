import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toku/screens/darkmode/home2.dart';
import 'package:toku/screens/darkmode/theme_cubit.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dark Mode Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<ThemeCubit>().toggleTheme();
            Navigator.push(context, MaterialPageRoute(builder: (contex){
              return ho2();
            }));
          },
          child: Text('Toggle Theme'),
        ),
      ),
    );
  }
}