class GroceryItem {
  final int? id;
  final String name;
  final String description;
  final double price;
  final String imagePath;

  GroceryItem({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}

var demoItems = [
  GroceryItem(
      id: 1,
      name: 'Organic Bananas',
      description: '7pcs, Priceg',
      price: 2.99,
      imagePath: 'assets/images/grocery_images/banana.png'),
  GroceryItem(
      id: 2,
      name: 'Red Apple',
      description: '1kg, Priceg',
      price: 4.99,
      imagePath: 'assets/images/grocery_images/apple.png'),
  GroceryItem(
      id: 3,
      name: 'Bell Pepper Red',
      description: '1kg, Priceg',
      price: 1.99,
      imagePath: 'assets/images/grocery_images/pepper.png'),
  GroceryItem(
      id: 4,
      name: 'Ginger',
      description: '250gm, Priceg',
      price: 0.99,
      imagePath: 'assets/images/grocery_images/ginger.png'),
  GroceryItem(
      id: 5,
      name: 'Meat',
      description: '250gm, Priceg',
      price: 14.99,
      imagePath: 'assets/images/grocery_images/beef.png'),
  GroceryItem(
      id: 6,
      name: 'Chicken',
      description: '250gm, Priceg',
      price: 10.99,
      imagePath: 'assets/images/grocery_images/chicken.png'),
  GroceryItem(
      id: 7,
      name: 'Carrot',
      description: '500gm, Priceg',
      price: 1.49,
      imagePath: 'assets/images/grocery_images/carrot.png'),
  GroceryItem(
      id: 8,
      name: 'Tomato',
      description: '1kg, Priceg',
      price: 3.99,
      imagePath: 'assets/images/grocery_images/tomato.png'),
  GroceryItem(
      id: 9,
      name: 'Cucumber',
      description: '500gm, Priceg',
      price: 0.79,
      imagePath: 'assets/images/grocery_images/cucumber.png'),
  GroceryItem(
      id: 10,
      name: 'PassionFruit',
      description: '1kg, Priceg',
      price: 4.49,
      imagePath: 'assets/images/grocery_images/PassionFruit.png'),
  GroceryItem(
      id: 11,
      name: 'Plum',
      description: '1 Head, Priceg',
      price: 1.69,
      imagePath: 'assets/images/grocery_images/plum.png'),
  GroceryItem(
      id: 12,
      name: 'Pineapple',
      description: '500gm, Priceg',
      price: 2.49,
      imagePath: 'assets/images/grocery_images/pineapple.png'),
  GroceryItem(
      id: 13,
      name: 'Papaya',
      description: '2kg, Priceg',
      price: 3.49,
      imagePath: 'assets/images/grocery_images/papaya.png'),
  GroceryItem(
      id: 14,
      name: 'Grape Juice',
      description: '1kg, Priceg',
      price: 2.29,
      imagePath: 'assets/images/grocery_images/grape.png'),
  GroceryItem(
      id: 15,
      name: 'Cabbage',
      description: '100gm, Priceg',
      price: 1.19,
      imagePath: 'assets/images/grocery_images/Cabbage.png'),
  GroceryItem(
      id: 16,
      name: 'Orange Juice',
      description: '1kg, Priceg',
      price: 3.59,
      imagePath: 'assets/images/grocery_images/orange.png'),
  GroceryItem(
      id: 17,
      name: 'Tropicana',
      description: '1kg, Priceg',
      price: 2.99,
      imagePath: 'assets/images/grocery_images/Tropicana.png'),
  GroceryItem(
      id: 18,
      name: 'Avocado',
      description: '1pcs, Priceg',
      price: 5.49,
      imagePath: 'assets/images/grocery_images/avocado.png'),
];

var exclusiveOffers = [
  demoItems[0],
  demoItems[1],
  demoItems[2],
  demoItems[3],
  demoItems[4],
  demoItems[5],
];

var bestSelling = [
  demoItems[6],
  demoItems[7],
  demoItems[8],
  demoItems[9],
  demoItems[10],
  demoItems[11],
];

var groceries = [
  demoItems[16],
  demoItems[17],
  demoItems[12],
  demoItems[13],
  demoItems[14],
  demoItems[15],
];

var beverages = [
  GroceryItem(
      id: 7,
      name: 'Dite Coke',
      description: '355ml, Price',
      price: 1.99,
      imagePath: 'assets/images/beverages_images/diet_coke.png'),
  GroceryItem(
      id: 8,
      name: 'Sprite Can',
      description: '325ml, Price',
      price: 1.50,
      imagePath: 'assets/images/beverages_images/sprite.png'),
  GroceryItem(
      id: 8,
      name: 'Apple Juice',
      description: '2L, Price',
      price: 15.99,
      imagePath: 'assets/images/beverages_images/apple_and_grape_juice.png'),
  GroceryItem(
      id: 9,
      name: 'Orange Juice',
      description: '2L, Price',
      price: 1.50,
      imagePath: 'assets/images/beverages_images/orange_juice.png'),
  GroceryItem(
      id: 10,
      name: 'Coca Cola Can',
      description: '325ml, Price',
      price: 4.99,
      imagePath: 'assets/images/beverages_images/coca_cola.png'),
  GroceryItem(
      id: 11,
      name: 'Pepsi Can',
      description: '330ml, Price',
      price: 4.99,
      imagePath: 'assets/images/beverages_images/pepsi.png'),
];
