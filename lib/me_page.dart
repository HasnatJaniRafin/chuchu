import 'package:flutter/material.dart';
import 'food_item.dart'; // Ensure this file exists and contains the FoodItem class
import 'food_detail_page.dart'; // Make sure you import FoodDetailPage

class MePage extends StatelessWidget {
  static const routeName = '/me';

  // Dummy list of favorite foods for ChuChu, replace with your actual favorites
  List<FoodItem> favoriteFoods = [
    FoodItem(
      id: '1',
      name: 'Sweet and Sour Pork',
      imageUrl: 'assets/1.png',
      price: 12.99,
      history: 'A classic Chinese dish with a delightful balance of sweet and sour flavors, combining crispy pork with pineapple, bell peppers, and onions in a tangy sauce.',
    ),
    FoodItem(
      id: '2',
      name: 'General Tso\'s Chicken',
      imageUrl: 'assets/2.png',
      price: 13.50,
      history: 'A popular dish in North American Chinese restaurants, this dish features deep-fried chicken in a slightly spicy sauce, named after the Qing dynasty statesman and military leader, General Tso.',
    ),
    FoodItem(
      id: '3',
      name: 'Kung Pao Chicken',
      imageUrl: 'assets/3.png',
      price: 14.25,
      history: 'A spicy, stir-fry dish made with chicken, peanuts, vegetables, and chili peppers. This Sichuan cuisine staple is known for its bold flavors, including the piquancy and spiciness from the Sichuan peppercorns.',
    ),
    FoodItem(
      id: '4',
      name: 'Peking Duck',
      imageUrl: 'assets/4.png',
      price: 25.99,
      history: 'A famous duck dish from Beijing that has been prepared since the imperial era, known for its thin, crispy skin. It is traditionally served with scallions, cucumber, sweet bean sauce, and pancakes.',
    ),
    FoodItem(
      id: '5',
      name: 'Dim Sum',
      imageUrl: 'assets/5.png',
      price: 18.50,
      history: 'A style of Chinese cuisine prepared as small bite-sized portions of food served in small steamer baskets or on small plates. It is also well known for the unique way it is served in restaurants, where fully cooked and ready-to-serve dim sum dishes are carted around for diners to choose their orders while seated at their tables.',
    ),
    // ... Add 10 more FoodItem instances here
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Me'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/chuchu_avatar.png'), // Replace with actual image path for ChuChu
                  ),
                  SizedBox(height: 8),
                  Text(
                    'ChuChu',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(height: 8),
                  Text('Age: 5'), // Replace with actual age
                  Text('Nationality: Chinese'), // Replace with actual nationality
                  SizedBox(height: 16),
                  Text(
                    'ChuChu loves to explore the world of Chinese cuisine. From the savory dumplings to the sweet tang of a good char siu, ChuChu enjoys every bit of the culinary adventure.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Favorite Foods', style: Theme.of(context).textTheme.headline6),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // to disable ListView's scrolling
              itemCount: favoriteFoods.length,
              itemBuilder: (ctx, i) => ListTile(
                leading: Image.asset(favoriteFoods[i].imageUrl, width: 50, height: 50), // Display the food image
                title: Text(favoriteFoods[i].name), // Display the food name
                subtitle: Text("\$${favoriteFoods[i].price.toStringAsFixed(2)}"), // Display the food price
                onTap: () {
                  // Navigate to the FoodDetailPage with the tapped food item
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FoodDetailPage(foodItem: favoriteFoods[i]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
