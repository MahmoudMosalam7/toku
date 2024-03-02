import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class show extends StatefulWidget {
  const show({super.key});

  @override
  State<show> createState() => _showState();
}

class _showState extends State<show> {
  List<TextEditingController> tController = [];
  void initState(){
    super.initState();
    tController.add(TextEditingController());
  }
  void add(){
    setState(() {
      tController.add(TextEditingController());
    });
  }
  void remove(int index){
    setState(() {
      tController.removeAt(index);
    });
  }
  void depose(){
   for(var tcontroller in tController ){
     tcontroller.dispose();
   }
   super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: tController.length,
                    itemBuilder: (BuildContext context,index){
                      return Row(
                        children: [
                          Expanded(
                              child: Padding(padding: EdgeInsets.symmetric(vertical: 8),
                                child: TextFormField(
                                  controller: tController[index],
                                  decoration:InputDecoration(
                                    hintText: 'enter somthing'
                                  ) ,
                                ),
                              )
                          ),
                          IconButton(onPressed: ()=>remove(index),
                              icon:Icon(Icons.delete))
                        ],
                      );
                    }
                ),
                SizedBox(height: 10.0,),
                ElevatedButton(onPressed: add,
                    child: Text('add textField')),
              ],
            ),
          ),
        ),
    );
  }
}
