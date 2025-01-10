import 'package:flutter/material.dart';
import '../../common_widgets/app_button.dart';
import '../../helpers/column_with_seprator.dart';
import '../../widgets/chart_item_widget.dart';
import '../../apis/auth_api.dart';
import '../../model_schema/user_model.dart';
import 'checkout_bottom_sheet.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  List<Product>? cartItems;
  bool isLoading = true;
  double cartValue = 0.0;

  @override
  void initState() {
    super.initState();
    _getCartItems();
  }

  void _getCartItems() async {
    final authAPI = AuthAPI();
    final currentUserData = await authAPI.readCurrentUser();
    cartItems = await authAPI.getCart(currentUserData!);
    setState(() {
      isLoading = false;
      _recalculateCartValue();
    });
  }

  void _recalculateCartValue() {
    setState(() {
      cartValue = 0.0;
      for (final item in cartItems!) {
        cartValue += item.price * item.quandity;
      }
    });
  }

  void _removeItemFromCart(Product productToRemove) {
    setState(() {
      cartItems?.removeWhere((item) => item.name == productToRemove.name);
      _recalculateCartValue();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'My Cart',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: getChildrenWithSeperator(
                        addToLastChild: false,
                        widgets: cartItems!.map((e) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                            ),
                            width: double.maxFinite,
                            child: ChartItemWidget(
                              item: e,
                              removeCallback: _removeItemFromCart,
                            ),
                          );
                        }).toList(),
                        seperator: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 25,
                          ),
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    cartValue > 0
                        ? getCheckoutButton(context)
                        : Container(
                            padding: const EdgeInsets.only(
                                top: 50), // Add padding at the top
                            child: const Text(
                              'Cart is Empty',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24, // Increase the font size
                                fontWeight:
                                    FontWeight.bold, // Optionally add boldness
                              ),
                            ),
                          ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget getCheckoutButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: AppButton(
        label: 'Go To Check Out',
        fontWeight: FontWeight.w600,
        padding: const EdgeInsets.symmetric(vertical: 30),
        trailingWidget: getButtonPriceWidget(),
        onPressed: () {
          showBottomSheet(context);
        },
      ),
    );
  }

  Widget getButtonPriceWidget() {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: const Color(0xff489E67),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        '\$${cartValue.toStringAsFixed(2)}',
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return CheckoutBottomSheet(totalValue: cartValue, cartItems: cartItems);
      },
    );
  }
}
