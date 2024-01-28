import 'package:flutter/material.dart';
import 'food_item.dart'; // Import the FoodItem model
import 'food_detail_page.dart'; // Ensure you create this file
import 'dart:math';
class HomePage extends StatelessWidget {
  // Generating a mock list of 50 food items

  List<FoodItem> generateFoodItemsWithImages() {
    final random = Random();
    final foodNames = ['Delight', 'Epicurean', 'Savory', 'Taste', 'Gourmet', 'Palate', 'Flavor', 'Essence', 'Aroma', 'Zest']; // A list of name parts for the random name
    final historyTemplate = 'This dish has a rich history dating back centuries. It is beloved in many cultures and has evolved through the ages. Its unique blend of flavors and ingredients make it a timeless classic. Not only is it a culinary treat, but it also offers a glimpse into the heritage and traditions from which it originates. Every bite tells a story of discovery, innovation, and passion. It represents a fusion of culinary excellence and historical significance.'; // A template history about 100 words

    return List.generate(52, (i) {
      // Create a random food name
      String name = '${foodNames[random.nextInt(foodNames.length)]} ${foodNames[random.nextInt(foodNames.length)]}';

      // Random price between 10.00 and 99.99
      double price = random.nextInt(9000) / 100 + 10;

      // Sequential image URLs from 1.png to 50.png
      String imageUrl = 'assets/${i + 1}.png';

      // Create the food item
      return FoodItem(
        id: '${i + 1}',
        name: name,
        imageUrl: imageUrl,
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
