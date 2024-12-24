import 'package:flutter/material.dart';
import '../widget/side_bar.dart';
import '../widget/top_navbar.dart';
import '../constants/data_store.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      drawer: Sidebar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Categories Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle view all press for categories
                      Navigator.pushNamed(context, '/viewall',
                          arguments: 'Categories');
                    },
                    child: const Text('View All',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF7643))),
                  ),
                ],
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
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Juice Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Juice',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle view all press for juice
                      Navigator.pushNamed(context, '/viewall',
                          arguments: 'juice Categories');
                    },
                    child: const Text('View All',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF7643))),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 112,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: juiceCategories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    // Wrap each item in a GestureDetector
                    onTap: () {
                      // Navigate to the correct product page
                      Navigator.pushNamed(
                        context,
                        '/product', // Replace with your actual route name
                        arguments: {
                          'item': juiceCategories[index],
                          'category': 'juice Categories',
                        },
                      );
                    },
                    child: Container(
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
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Milk Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Milk',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle view all press for milk
                      Navigator.pushNamed(context, '/viewall',
                          arguments: 'milk Categories');
                    },
                    child: const Text('View All',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF7643))),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 112,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: milkCategories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    // Wrap each item in a GestureDetector
                    onTap: () {
                      // Navigate to the correct product page
                      Navigator.pushNamed(
                        context,
                        '/product', // Replace with your actual route name
                        arguments: {
                          'item': milkCategories[index],
                          'category': 'milk Categories',
                        },
                      );
                    },
                    child: Container(
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
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Vegetables Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Vegetables',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle view all press for vegetables
                      Navigator.pushNamed(context, '/viewall',
                          arguments: 'vegetable Categories');
                    },
                    child: const Text('View All',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF7643))),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 112,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: fruitCategories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    // Wrap each item in a GestureDetector
                    onTap: () {
                      // Navigate to the correct product page
                      Navigator.pushNamed(
                        context,
                        '/product', // Replace with your actual route name
                        arguments: {
                          'item': vegetableCategories[index],
                          'category': 'vegetable Categories',
                        },
                      );
                    },
                    child: Container(
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
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Fruits Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Fruits',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle view all press for fruits
                      Navigator.pushNamed(context, '/viewall',
                          arguments: 'fruit Categories');
                    },
                    child: const Text('View All',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF7643))),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 112,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: fruitCategories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    // Wrap each item in a GestureDetector
                    onTap: () {
                      // Navigate to the correct product page
                      Navigator.pushNamed(
                        context,
                        '/product', // Replace with your actual route name
                        arguments: {
                          'item': fruitCategories[index],
                          'category': 'fruit Categories',
                        },
                      );
                    },
                    child: Container(
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
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
