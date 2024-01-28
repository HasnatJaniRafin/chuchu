import 'package:flutter/material.dart';
import 'food_item.dart'; // Import the FoodItem model
import 'food_detail_page.dart'; // Ensure you create this file

class HomePage extends StatelessWidget {
  // Generating a mock list of 50 food items
  List<FoodItem> generateFoodItemsWithImages() {
    List<FoodItem> items = [];
    for (int i = 1; i <= 50; i++) {
      items.add(
        FoodItem(
          id: '$i',
          name: 'Food Item $i',
          imageUrl: 'assets/$i.png', // Dynamically generate the image URL
          price: i * 5.0, // Example price, adjust as needed
          history: 'Description for Food Item $i.',
        ),
      );
    }
    return items;
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
