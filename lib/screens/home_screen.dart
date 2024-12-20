import 'package:flutter/material.dart';
import '../widget/side_bar.dart';

class HomeScreen extends StatelessWidget {

  final List<Map<String, String>> Categories = [
    {'name': 'Fruits & Vegetables', 'image': 'assets/images/fruits.png'},
    {'name': 'Meat & Seafood', 'image': 'assets/images/meat.png'},
    {'name': 'Dairy & Eggs', 'image': 'assets/images/dairy.png'},
    {'name': 'Beverages', 'image': 'assets/images/beverages.png'},
    {'name': 'Snacks & Sweets', 'image': 'assets/images/snacks.png'},
    {'name': 'Household Essentials', 'image': 'assets/images/household.png'},
  ];

  final List<Map<String, String>> juiceCategories = [
    {'name': 'Apple juice', 'image': 'assets/images/apple_juice.png'},
    {'name': 'Orange juice', 'image': 'assets/images/orange_juice.jpg'},
    {'name': 'God Morgon Orange Juice', 'image': 'assets/images/God-Morgon-Orange-Juice_Iconic.jpg'},
    {'name': 'Tropicana Juice Smooth', 'image': 'assets/images/Tropicana-Juice-Smooth_Iconic.jpg'},
    {'name': 'God Morgon Red Grapefruit Juice', 'image': 'assets/images/God-Morgon-Red-Grapefruit-Juice_Iconic.jpg'},
    {'name': 'God Morgon Apple Juice', 'image': 'assets/images/apple_juice_iconic.png'},
  ];

  final List<Map<String, String>> milkCategories = [
    {'name': 'Fat Milk', 'image': 'assets/images/fat_milk.jpg'},
    {'name': 'Lactose Rich Milk', 'image': 'assets/images/lactose_milk.jpg'},
    {'name': 'Garant Milk', 'image': 'assets/images/Garant_milk.jpg'},
    {'name': 'Standard Milk', 'image': 'assets/images/standard_milk.jpg'},
    {'name': 'Arla Milk', 'image': 'assets/images/Arla_milk.jpg'},
    {'name': 'Medium Fat Rich Milk', 'image': 'assets/images/medium_fat_milk.jpg'},
  ];

  final List<Map<String, String>> vegetableCategories = [
    {'name': 'Cabbage', 'image': 'assets/images/Cabbage_Iconic.jpg'},
    {'name': 'Carrot', 'image': 'assets/images/Carrots_Iconic.jpg'},
    {'name': 'Red Pepper', 'image': 'assets/images/Red-Bell-Pepper_Iconic.jpg'},
    {'name': 'Cucumber', 'image': 'assets/images/Cucumber_Iconic.jpg'},
    {'name': 'Ginger', 'image': 'assets/images/Ginger_Iconic.jpg'},
    {'name': 'Vine Tomato', 'image': 'assets/images/Vine-Tomato_Iconic.jpg'},
  ];

  final List<Map<String, String>> fruitCategories = [
    {'name': 'Apple', 'image': 'assets/images/Red-Delicious_Iconic.jpg'},
    {'name': 'Passion Fruit', 'image': 'assets/images/Passion-Fruit_Iconic.jpg'},
    {'name': 'Pineapple', 'image': 'assets/images/Pineapple_Iconic.jpg'},
    {'name': 'Papaya', 'image': 'assets/images/Ginger_Iconic.jpg'},
    {'name': 'Plum', 'image': 'assets/images/Plum_Iconic.jpg'},
    {'name': 'Grape fruit', 'image': 'assets/images/Red-Grapefruit_Iconic.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easyshop'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person), // User icon
            onPressed: () {
              // Handle user icon tap (e.g., navigate to profile screen)
              print('User icon tapped');
            },
          ),
        ],
      ),
      drawer: Sidebar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 112,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 112,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            Categories[index]['image']!,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          Categories[index]['name']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, 
                            fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            //Juice section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Juice',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 112,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: juiceCategories.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 112,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            juiceCategories[index]['image']!,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          juiceCategories[index]['name']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, 
                            fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Meat Section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Milk',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 112,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: milkCategories.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 112,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            milkCategories[index]['image']!,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          milkCategories[index]['name']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, 
                            fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Vegetables Section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Vegetables',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 112,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: vegetableCategories.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 112,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            vegetableCategories[index]['image']!,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          vegetableCategories[index]['name']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, 
                            fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Fruits Section (similar structure)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Fruits',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 112,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: fruitCategories.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 112,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            fruitCategories[index]['image']!,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          fruitCategories[index]['name']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, 
                            fontWeight: FontWeight.bold),
                        ),
                      ],
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
