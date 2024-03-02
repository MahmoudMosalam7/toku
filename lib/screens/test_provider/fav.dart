/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class InstructorChats extends StatefulWidget {
  final List<Card> favoritCardList;

  const InstructorChats({Key? key, required this.favoritCardList})
      : super(key: key);

  @override
  State<InstructorChats> createState() => _InstructorChatsState();
}

class _InstructorChatsState extends State<InstructorChats> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print('favoritCardList = ${widget.favoritCardList}');

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Chats'),
            SizedBox(height: 20),
            // Display the favoritCardList in a ListView
            ListView.builder(
              itemCount: widget.favoritCardList.length,
              itemBuilder: (context, index) {
                return widget.favoritCardList[index];
              },
            ),
          ],
        ),
      ),
    );
  }
}*/
