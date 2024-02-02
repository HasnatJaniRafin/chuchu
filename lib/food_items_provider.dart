// food_items_provider.dart
import 'dart:math';
import 'food_item.dart'; // Adjust the import path as necessary

class FoodItemsProvider {
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
