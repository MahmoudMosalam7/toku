import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/CustomGeneral.dart';
import '../models/GeneralModels.dart';

class FamilyScreen extends StatelessWidget {
  const FamilyScreen({super.key});
  final List<General> family = const[
    General(image: 'assets/images/family_members/family_father.png'
        , jpName: 'Chicioya', enName: 'Father'
        ,sound: 'assets/sounds/family_members/father.wav'
    ),
    General(image: 'assets/images/family_members/family_daughter.png'
        , jpName: 'Musume', enName: 'Daughter'
        ,sound: 'assets/sounds/family_members/daughter.wav'
    ),
    General(image: 'assets/images/family_members/family_grandfather.png'
        , jpName: 'Ojisan', enName: 'Grand Father'
        ,sound: 'assets/sounds/family_members/grand father.wav'
    ),
    General(image: 'assets/images/family_members/family_mother.png'
        , jpName: 'Hahaoya', enName: 'Mother',
        sound: 'assets/sounds/family_members/mother.wav'
    ),
    General(image: 'assets/images/family_members/family_grandmother.png'
        , jpName: 'Sobo', enName: 'Grand Mother'
        , sound: 'assets/sounds/family_members/grand mother.wav'
    ),
    General(image: 'assets/images/family_members/family_older_brother.png'
        , jpName: 'Nisan', enName: 'Older Brother'
        , sound: 'assets/sounds/family_members/older bother.wav'
    ),
    General(image: 'assets/images/family_members/family_older_sister.png'
        , jpName: 'Ane', enName: 'Older Sister'
        ,
        sound: 'assets/sounds/family_members/older sister.wav'
    ),
    General(image: 'assets/images/family_members/family_son.png'
        , jpName: 'Musuko', enName: 'Son'
        ,
        sound: 'assets/sounds/family_members/son.wav'
    ),
    General(image: 'assets/images/family_members/family_younger_brother.png'
        , jpName: 'Ototo', enName: 'Younger Brother',

        sound: 'assets/sounds/family_members/younger brohter.wav'
    ),
    General(image: 'assets/images/family_members/family_younger_sister.png'
        , jpName: 'Imoto', enName: 'Older Sister'
        ,
        sound: 'assets/sounds/family_members/younger sister.wav'
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:const Color(0xff46322B),
        title: const Text("Family",
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
      body: ListView.builder(
          itemBuilder: (context ,index){
            return CGeneral(general: family[index]
            ,color:Color(0xff558B37) ,
            );
          }
          ,itemCount: family.length,
      ),
    );
  }
}
