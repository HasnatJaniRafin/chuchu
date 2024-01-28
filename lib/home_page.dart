import 'package:flutter/material.dart';
import 'food_item.dart'; // Import the FoodItem model
import 'food_detail_page.dart'; // Ensure you create this file

class HomePage extends StatelessWidget {
  // Generating a mock list of 50 food items
  List<FoodItem> generateFoodItems() {
    return List.generate(
      50,
          (i) => FoodItem(
        id: '$i',
        name: 'Food Item $i',
        imageUrl: 'assets/1.png', // Placeholder image, replace with actual
        price: (i + 1) * 2.0,
        history: 'This is the history of food item $i.',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<FoodItem> foodItems = generateFoodItems();

    return Scaffold(
      appBar: AppBar(
        title: Text('All Food '),
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
            child: Image.asset(foodItems[i].imageUrl, fit: BoxFit.cover), // Placeholder image
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
