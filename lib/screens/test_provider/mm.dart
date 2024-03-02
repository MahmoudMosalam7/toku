import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  // List to store favorite cards
  List<Card> _favoriteCards = [];

  // List of cards with empty and full heart icons
  List<Card> _allCards = [
    Card(icon: Icons.favorite_border, isFavorite: false),
    Card(icon: Icons.favorite_border, isFavorite: false),
    Card(icon: Icons.favorite_border, isFavorite: false),
    // Add more cards as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: _currentIndex == 0
          ? FirstPage(cards: _allCards, onToggleFavorite: _toggleFavorite)
          : SecondPage(favoriteCards: _favoriteCards, onRemoveFavorite: _removeFavorite),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }

  // Toggle the favorite status of a card
  void _toggleFavorite(Card card) {
    setState(() {
      if (_favoriteCards.contains(card)) {
        _favoriteCards.remove(card);
      } else {
        _favoriteCards.add(card);
      }
    });
  }

  // Remove the card from the favorite list
  void _removeFavorite(Card card) {
    setState(() {
      _favoriteCards.remove(card);
    });
  }
}

class FirstPage extends StatelessWidget {
  final List<Card> cards;
  final Function(Card) onToggleFavorite;

  FirstPage({required this.cards, required this.onToggleFavorite});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cards.length,
      itemBuilder: (context, index) {
        return CardWidget(
          card: cards[index],
          onToggleFavorite: onToggleFavorite,
        );
      },
    );
  }
}

class SecondPage extends StatelessWidget {
  final List<Card> favoriteCards;
  final Function(Card) onRemoveFavorite;

  SecondPage({required this.favoriteCards, required this.onRemoveFavorite});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favoriteCards.length,
      itemBuilder: (context, index) {
        return CardWidget(
          card: favoriteCards[index],
          onToggleFavorite: (card) {
            // Remove the card from the list and notify the parent
            onRemoveFavorite(card);
          },
        );
      },
    );
  }
}

class CardWidget extends StatelessWidget {
  final Card card;
  final Function(Card) onToggleFavorite;

  CardWidget({required this.card, required this.onToggleFavorite});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: Icon(
          card.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: card.isFavorite ? Colors.red : null,
        ),
        onPressed: () {
          // Toggle the favorite status and notify the parent
          onToggleFavorite(card.copyWith(isFavorite: !card.isFavorite));
        },
      ),
      title: Text('Card ${card.hashCode}'),
    );
  }
}

class Card {
  final IconData icon;
  final bool isFavorite;

  Card({required this.icon, required this.isFavorite});

  // CopyWith method to create a new instance with updated values
  Card copyWith({IconData? icon, bool? isFavorite}) {
    return Card(
      icon: icon ?? this.icon,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
