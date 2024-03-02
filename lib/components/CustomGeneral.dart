import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../models/GeneralModels.dart';

class CGeneral extends StatelessWidget {
   const CGeneral({super.key, required this.general,required this.color});
   final General general;
   final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color!,
      height: 100,
      child: Row(
        children: [

          Container(
              color: const Color(0xFFFFF6DC),
              child:Image.asset(general.image) ,
              ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(general.jpName,
                style: const TextStyle(color: Colors.white,
                fontSize: 18,
                ),
                ),
                Text(general.enName,style: const TextStyle(color: Colors.white,
                  fontSize: 18,
                )),
              ],
            ),
          ),
          const Spacer(flex: 1,),
          IconButton(
            onPressed: (){
              try {
                AssetsAudioPlayer.newPlayer().open(
                  Audio(general.sound),
                  autoStart: true,
                  showNotification: true,
                );
              }catch(e){
                print(e);
              }
            },
           icon :const Icon( Icons.play_arrow,
            size: 30,
            color: Colors.white,),
          )
        ],
      ),
    );
  }

}
