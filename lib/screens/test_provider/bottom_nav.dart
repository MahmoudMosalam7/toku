/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstructorCourses extends StatefulWidget {
  final Function(Card) onToggleFavorite;

  const InstructorCourses({Key? key, required this.onToggleFavorite})
      : super(key: key);

  @override
  _InstructorCoursesState createState() => _InstructorCoursesState();
}

class _InstructorCoursesState extends State<InstructorCourses> {
  List<bool> isFavoriteList = [false, false, false, false, false, false];

  void toggleFavorite(int index, IconData icon, String text, int color) {
    setState(() {
      isFavoriteList[index] = !isFavoriteList[index];
      widget.onToggleFavorite(buildCard(index, icon, text, color));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                buildCard(0, Icons.add, 'Add New Course', 0xff9F70FD),
                Spacer(),
                buildCard(1, Icons.book, 'Courses', 0xff64CCC5),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                buildCard(2, Icons.content_paste_rounded, '199,234,1', 0xFFFFB0B0),
                Spacer(),
                buildCard(3, Icons.star, '4.7', 0xff86B6F6),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                buildCard(4, Icons.leaderboard, 'Profits', Colors.blueGrey.value),
                Spacer(),
                buildCard(5, Icons.star, '4.8', 0xffADA2FF),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card buildCard(int index, IconData icon, String text, int color) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: GestureDetector(
        onTap: () => toggleFavorite(index, icon, text, color),
        child: Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: isFavoriteList[index] ? Color(color) : Colors.grey[200],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isFavoriteList[index] ? Icons.star : Icons.star_border,
                size: 50,
                color: isFavoriteList[index] ? Colors.white : Colors.black,
              ),
              SizedBox(height: 10),
              Text(
                text,
                style: TextStyle(
                  color: isFavoriteList[index] ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
