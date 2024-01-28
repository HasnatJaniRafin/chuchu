import 'package:flutter/material.dart';
import 'food_item.dart'; // Import the FoodItem model

class FoodDetailPage extends StatelessWidget {
  final FoodItem foodItem;

  const FoodDetailPage({Key? key, required this.foodItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodItem.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(foodItem.imageUrl), // Display the food image
            Text(foodItem.name), // Display the food name
            Text("\$${foodItem.price}"), // Display the food price
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(foodItem.history), // Display the food history
            ),
            // Implement the favorite button here
          ],
        ),
      ),
    );
  }
}
