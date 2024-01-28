// food_detail_page.dart
import 'package:flutter/material.dart';
import 'food_item.dart'; // Ensure this file exists and contains the FoodItem class

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
          children: [
            Image.asset(foodItem.imageUrl, fit: BoxFit.cover), // Display the food image
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                foodItem.history,
                style: TextStyle(fontSize: 16.0), // Display the food history
              ),
            ),
            // You can add more details here if needed
          ],
        ),
      ),
    );
  }
}
