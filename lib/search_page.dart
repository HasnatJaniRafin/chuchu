import 'dart:math';
import 'package:flutter/material.dart';
import 'food_item.dart'; // Ensure this model class is defined

class SearchPage extends StatefulWidget {
  static const routeName = '/search';

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<FoodItem> foodItems;

  @override
  void initState() {
    super.initState();
    foodItems = _generateFoodItemsWithImages();
  }

  List<FoodItem> _generateFoodItemsWithImages() {
    final List<String> foodNames = [
      'Delight Dumplings', 'Epicurean Eats', 'Savory Soup', 'Taste of China', 'Gourmet Buns',
      'Palate Pleaser', 'Flavor Fiesta', 'Essence of Asia', 'Aroma Noodles', 'Zesty Zucchini',
      'Spicy Spring Rolls', 'Heavenly Hot Pot', 'Chow Mein Charm', 'Dim Sum Delight', 'Wonton Wonder',
      'Peking Duck', 'Sweet and Sour Sensation', 'Kung Pao Kick', 'Mapo Tofu Magic', 'Jasmine Tea Aroma',
      'Fried Rice Fantasy', 'Bamboo Shoots Bliss', 'Szechuan Spice', 'Mongolian Beef Mood', 'Fortune Cookie Surprise',
      'Lotus Root Luxury', 'Sticky Rice Story', 'Tofu Treasure', 'Egg Tart Treat', 'Sesame Seed Symphony',
      'Bok Choy Bounty', 'Noodle Nirvana', 'Black Bean Burst', 'Crispy Duck Delicacy', 'Garlic Greens Glory',
      'Lychee Lusciousness', 'Mushroom Medley', 'Soy Sauce Symphony', 'Chili Oil Orchestra', 'Ginger Infusion',
      'Scallion Pancake', 'Cantonese Carnival', 'Bean Curd Bonanza', 'Fruitful Fried Tofu', 'Hoisin Harmony',
      'Five Spice Serenade', 'Oolong Odyssey', 'Rice Wine Rhapsody', 'Braised Pork Ballad', 'Tea Egg Tempo',
      'Nashi Pear Notes', 'Star Anise Accent' // Total 52 names
    ];

    final historyTemplate = 'This dish has a rich history dating back centuries...'; // A template history about 100 words

    return List.generate(52, (i) {
      double price = (Random().nextInt(9000) / 100 + 10);
      return FoodItem(
        id: '${i + 1}',
        name: foodNames[i % foodNames.length],
        imageUrl: 'assets/${i + 1}.png',
        price: price,
        history: historyTemplate,
      );
    });
  }

  void _shuffleFoodItems() {
    setState(() {
      foodItems.shuffle(Random());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Foods'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _shuffleFoodItems,
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: foodItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in grid
          childAspectRatio: 3 / 4, // Aspect ratio of each card
          crossAxisSpacing: 10, // Horizontal space between cards
          mainAxisSpacing: 10, // Vertical space between cards
        ),
        itemBuilder: (ctx, i) => Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(foodItems[i].name),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Image.asset(foodItems[i].imageUrl, fit: BoxFit.cover),
                          SizedBox(height: 8),
                          Text("Price: \$${foodItems[i].price.toStringAsFixed(2)}"),
                          SizedBox(height: 8),
                          Text(foodItems[i].history),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.asset(foodItems[i].imageUrl, fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    foodItems[i].name,
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
