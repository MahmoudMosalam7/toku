import 'package:flutter/material.dart';
import 'package:toku/models/GeneralModels.dart';

import '../components/CustomGeneral.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({super.key});
 final List<General> numbers = const[
   General(image: 'assets/images/numbers/number_one.png'
       , jpName: 'ichi', enName: 'one'
     ,sound: 'assets/sounds/numbers/number_one_sound.mp3'
   ),
   General(image: 'assets/images/numbers/number_two.png'
       , jpName: 'Ni', enName: 'two'
   ,sound: 'assets/sounds/numbers/number_two_sound.mp3'
   ),
   General(image: 'assets/images/numbers/number_three.png'
       , jpName: 'San', enName: 'three'
   ,sound: 'assets/sounds/numbers/number_three_sound.mp3'
   ),
   General(image: 'assets/images/numbers/number_four.png'
       , jpName: 'Shi', enName: 'four',
       sound: 'assets/sounds/numbers/number_four_sound.mp3'
   ),
   General(image: 'assets/images/numbers/number_five.png'
       , jpName: 'Go', enName: 'five'
   , sound: 'assets/sounds/numbers/number_five_sound.mp3'
   ),
   General(image: 'assets/images/numbers/number_six.png'
       , jpName: 'Roku', enName: 'six'
   , sound: 'assets/sounds/numbers/number_six_sound.mp3'
   ),
   General(image: 'assets/images/numbers/number_seven.png'
       , jpName: 'Sebun', enName: 'seven'
   ,
       sound: 'assets/sounds/numbers/number_seven_sound.mp3'
   ),
   General(image: 'assets/images/numbers/number_eight.png'
       , jpName: 'hachi', enName: 'eight'
   ,
       sound: 'assets/sounds/numbers/number_eight_sound.mp3'
   ),
   General(image: 'assets/images/numbers/number_nine.png'
       , jpName: 'Kyu', enName: 'nine',

       sound: 'assets/sounds/numbers/number_nine_sound.mp3'
   ),
   General(image: 'assets/images/numbers/number_ten.png'
       , jpName: 'JU', enName: 'ten'
   ,
       sound: 'assets/sounds/numbers/number_ten_sound.mp3'
   ),
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:const Color(0xff46322B),
        title: const Text("Numbers",
        style: TextStyle(
          color: Colors.white
        ),
        ),
      ),
      body : ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return CGeneral(general: numbers[index],color:  Color(0xffEF9235),);
        },
        itemCount: numbers.length,
      )
    );
  }
  List<Widget> getList(List<General> numbers){
    List<CGeneral> cNumberList =[];
    for(int i =0 ;i<numbers.length ;i++){
      cNumberList.add(CGeneral(general: numbers[i]
      ,color:  Color(0xffEF9235),
      ));
    }
    return cNumberList;
  }
}
