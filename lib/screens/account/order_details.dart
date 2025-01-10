import 'package:flutter/material.dart';
import '../../apis/auth_api.dart';
import '../../model_schema/user_model.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  OrderScreenState createState() => OrderScreenState();
}

class OrderScreenState extends State<OrderScreen> {
  List<OrderModel> currentOrders = [];

  @override
  void initState() {
    super.initState();
    _getOrders();
  }

  void _getOrders() async {
    try {
      final authAPI = AuthAPI();
      final currentUserData = await authAPI.readCurrentUser();
      final orders = await authAPI.getAllOrders(currentUserData!);
      setState(() {
        currentOrders = orders.reversed.toList();
      });
    } catch (e) {
      setState(() {
        currentOrders = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Orders',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: currentOrders.length,
        itemBuilder: (context, index) {
          final order = currentOrders[index];
          return GestureDetector(
            onTap: () {
              showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    title: Text(
                      'Order ID: ${order.orderId}',
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    content: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height *
                          0.6, // Set a fixed height
                      child: SingleChildScrollView(
                        // Wrap content in SingleChildScrollView
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '''Total Amount: \$${order.totalAmount.toStringAsFixed(2)}''',
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '''Order Date: ${order.orderDate.toString().substring(0, 10)}''',
                            ),
                            const SizedBox(height: 16),
                            ...order.items.map((item) {
                              return Column(
                                children: [
                                  // Custom layout for each item
                                  Row(
                                    children: [
                                      Image.asset(item.photo,
                                          width: 50, height: 50),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.name,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            item.description,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Text(
                                        '''\$${item.price.toStringAsFixed(2)} x ${item.quandity}''',
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                ],
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text(
                          'Go Back',
                          style: TextStyle(color: Colors.green, fontSize: 18),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Order ID: ${order.orderId}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          '\$${order.totalAmount.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          '''Date: ${order.orderDate.toLocal().toString().split(' ')[0]}''',
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
