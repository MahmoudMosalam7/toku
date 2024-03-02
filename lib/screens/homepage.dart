import 'package:flutter/material.dart';
import 'package:toku/screens/number_page.dart';

import '../components/category.dart';
import 'family_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF6DB),
      appBar: AppBar(
        backgroundColor: const Color(0xff46322B),
        title: const Text("Toku",
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
      body: Column(
        children: [
          Category(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:( BuildContext contxt){
                return const NumberScreen();
              }));//FamilyScreen
            },
            text: "Numbers",
            color: const Color(0xffEF9235),),
          Category(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:( BuildContext contxt){
              return const FamilyScreen();
            }));
          },text: "FamilyMembers",color: const Color(0xff558B37),),
          Category(text: "Colors",color: const Color(0xff79359F),),
          Category(text: "Phares",color: const Color(0xff50ADC7),),
        ],
      ),
    );
  }
}
