import 'package:flutter/material.dart';
import '../constants/data_store.dart';

class ViewAllScreen extends StatelessWidget {
  const ViewAllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as String;

    // Map of categories
    final Map<String, List<Object>> categoryMap = {
      'fruit': fruitCategories,
      'vegetable': vegetableCategories,
      'milk': milkCategories,
      'juice': juiceCategories,
      'Categories': Categories,
    };

    // Retrieve the corresponding data or default to an empty list
    final data = categoryMap.entries
        .firstWhere((entry) => args.startsWith(entry.key),
            orElse: () => MapEntry('', []))
        .value;
    
    print(args);

    return Scaffold(
      appBar: AppBar(
        title: Text(args.toUpperCase()),
        backgroundColor: Color(0xFFFF7643),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index] as Map<String, dynamic>;
                  return GestureDetector( // Add GestureDetector
                    onTap: () {
                      // Navigate to the product details screen
                     if(args != 'Categories'){
                       Navigator.pushNamed(
                        context,
                        '/product', // Replace with your route name
                        arguments: {
                          'item': item,
                          'category': args,
                        }, // Pass the product data
                      );
                     }else{
                      if(item['name'] == 'Fruits'){
                        Navigator.pushNamed(
                        context,
                        '/viewall',
                        arguments: 'fruit Categories'
                      );
                      }else if(item['name'] == 'Vegitables'){
                        Navigator.pushNamed(
                        context,
                        '/viewall',
                        arguments: 'fruit Categories'
                      );
                      }else if(item['name'] == 'Fruits & Vegitables'){
                        Navigator.pushNamed(
                        context,
                        '/viewall',
                        arguments: 'fruit Categories'
                      );
                      }else if(item['name'] == 'Fruits & Vegitables'){
                        Navigator.pushNamed(
                        context,
                        '/viewall',
                        arguments: 'fruit Categories'
                      );
                      }else if(item['name'] == 'Fruits & Vegitables'){
                        Navigator.pushNamed(
                        context,
                        '/viewall',
                        arguments: 'fruit Categories'
                      );
                      }else if(item['name'] == 'Fruits & Vegitables'){
                        Navigator.pushNamed(
                        context,
                        '/viewall',
                        arguments: 'fruit Categories'
                      );
                      }
                     }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Container(
                              width: 80.0,
                              height: 80.0,
                              child: Image.asset(
                                item['image'] ?? '',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            item['name'] ?? '',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
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