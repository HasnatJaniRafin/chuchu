import 'package:flutter/material.dart';
import 'food_item.dart'; // Import the FoodItem model
import 'food_detail_page.dart'; // Ensure you create this file
import 'dart:math';
class HomePage extends StatelessWidget {
  // Generating a mock list of 50 food items

  List<FoodItem> generateFoodItemsWithImages() {
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

    final historyTemplate = 'This dish has a rich history dating back centuries. It is beloved in many cultures and has evolved through the ages. Its unique blend of flavors and ingredients make it a timeless classic. Not only is it a culinary treat, but it also offers a glimpse into the heritage and traditions from which it originates. Every bite tells a story of discovery, innovation, and passion. It represents a fusion of culinary excellence and historical significance.'; // A template history about 100 words

    return List.generate(foodNames.length, (i) {
      // Random price between 10.00 and 99.99
      double price = (Random().nextInt(9000) / 100 + 10);

      // Create the food item
      return FoodItem(
        id: '${i + 1}',
        name: foodNames[i],
        imageUrl: 'assets/${i + 1}.png',
        price: price,
        history: historyTemplate,
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    // Corrected method name here
    List<FoodItem> foodItems = generateFoodItemsWithImages();

    return Scaffold(
      appBar: AppBar(
        title: Text('All Food'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: foodItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Adjust based on screen size and orientation
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) => GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodDetailPage(foodItem: foodItems[i]),
                ),
              );
            },
            child: Image.asset(foodItems[i].imageUrl, fit: BoxFit.cover),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(foodItems[i].name),
            subtitle: Text("\$${foodItems[i].price.toString()}"),
          ),
        ),
      ),
    );
  }
}
