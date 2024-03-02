import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstructorHomeScreen extends StatefulWidget {
  const InstructorHomeScreen({Key? key}) : super(key: key);

  @override
  State<InstructorHomeScreen> createState() => _InstructorHomeScreenState();
}

class _InstructorHomeScreenState extends State<InstructorHomeScreen> {
  int _currentIndex = 0;
  final List<CardData> _favoritCard = [];

  late List<Widget> _instructorScreens;

  void _toggelFavoritCardStatus(CardData cardData) {
    final isExisting = _favoritCard.contains(cardData);
    if (isExisting) {
      setState(() {
        _favoritCard.remove(cardData);
      });
    } else {
      setState(() {
        _favoritCard.add(cardData);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _instructorScreens = [
      InstructorCourses(onToggleFavorite: _toggelFavoritCardStatus),
      InstructorChats(favoritCardList: _favoritCard),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _instructorScreens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_customize_rounded),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class CardData {
  final int index;
  final IconData icon;
  final String text;
  final int color;

  CardData(this.index, this.icon, this.text, this.color);
}

class InstructorCourses extends StatefulWidget {
  final Function(CardData) onToggleFavorite;

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
      widget.onToggleFavorite(CardData(index, icon, text, color));
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

class InstructorChats extends StatefulWidget {
  final List<CardData> favoritCardList;

  const InstructorChats({Key? key, required this.favoritCardList})
      : super(key: key);

  @override
  State<InstructorChats> createState() => _InstructorChatsState();
}

class _InstructorChatsState extends State<InstructorChats> {
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
                print('widget.favoritCardList = ${widget.favoritCardList}');
                return buildCard(
                  widget.favoritCardList[index].index,
                  widget.favoritCardList[index].icon,
                  widget.favoritCardList[index].text,
                  widget.favoritCardList[index].color,
                );
              },
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
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Color(color),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: 50,
              color: Colors.white,
            ),
            SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
