

class UserModel {
  final String uid;
  final String email;
  final String name;
  final List<Product> cart;
  final List<OrderModel> orders;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.cart,
    required this.orders,
  });

  // Factory method to create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      cart: (json['cart'] as List<dynamic>?)
              ?.map((item) => Product.fromJson(item))
              .toList() ??
          [],
      orders: (json['orders'] as List<dynamic>?)
              ?.map((item) => OrderModel.fromJson(item))
              .toList() ??
          [],
    );
  }

  // Method to convert a UserModel object to JSON
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'cart': cart.map((item) => item.toJson()).toList(),
      'orders': orders.map((order) => order.toJson()).toList(),
    };
  }

  // CopyWith method for immutability
  UserModel copyWith({
    String? uid,
    String? email,
    String? name,
    List<Product>? cart,
    List<OrderModel>? orders,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      cart: cart ?? this.cart,
      orders: orders ?? this.orders,
    );
  }
}

class Product {
  final String name;
  final double price;
  final String description;
  final String photo;
  final double quandity;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.photo,
    required this.quandity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      photo: json['photo'] as String,
      quandity: (json['quandity'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'photo': photo,
      'quandity': quandity,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'photo': photo,
      'quandity': quandity,
    };
  }
}

class OrderModel {
  final String orderId;
  final List<Product> items;
  final double totalAmount;
  final DateTime orderDate;

  OrderModel({
    required this.orderId,
    required this.items,
    required this.totalAmount,
    required this.orderDate,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['orderId'] as String,
      items: (json['items'] as List<dynamic>)
          .map((item) => Product.fromJson(item))
          .toList(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      orderDate: DateTime.parse(json['orderDate'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'items': items.map((item) => item.toJson()).toList(),
      'totalAmount': totalAmount,
      'orderDate': orderDate.toIso8601String(),
    };
  }
}
