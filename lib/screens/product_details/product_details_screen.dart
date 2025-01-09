import 'package:flutter/material.dart';
import '../../common_widgets/app_button.dart';
import '../../common_widgets/app_text.dart';
import '../../models/grocery_item.dart';
import '../../widgets/item_counter_widget.dart';
import '../../apis/auth_api.dart';
import '../../model_schema/user_model.dart';
import 'favourite_toggle_icon_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  final GroceryItem groceryItem;
  final String? heroSuffix;

  const ProductDetailsScreen(this.groceryItem, {this.heroSuffix});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  double amount = 1;

  Future<void> addToCart() async {
  try {
    final authApi = AuthAPI();
    final currentUser = await authApi.readCurrentUser(); 
    final newProduct = Product(
      name: widget.groceryItem.name,
      price: widget.groceryItem.price,
      description: widget.groceryItem.description,
      photo: widget.groceryItem.imagePath,
      quandity: amount
    );
    final updatedCart = await authApi.getCart(currentUser!);
    updatedCart.add(newProduct);
    await authApi.addItemToCart(updatedCart);
  } catch (e) {
    debugPrint('Error adding to cart: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            getImageHeaderWidget(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        widget.groceryItem.name,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      subtitle: AppText(
                        text: widget.groceryItem.description,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff7C7C7C),
                      ),
                      trailing: FavoriteToggleIcon(),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        ItemCounterWidget(
                          onAmountChanged: (double newAmount) {
                            setState(() {
                              amount = newAmount;
                            });
                          },
                        ),
                        const Spacer(),
                        Text(
                          '\$${getTotalPrice().toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    const Divider(thickness: 1),
                    getProductDataRowWidget('Product Details'),
                    const Divider(thickness: 1),
                    getProductDataRowWidget('Nutritions',
                        customWidget: nutritionWidget()),
                    const Divider(thickness: 1),
                    getProductDataRowWidget(
                      'Review',
                      customWidget: ratingWidget(),
                    ),
                    const Spacer(),
                    AppButton(
                      label: 'Add To Basket',
                      onPressed: () {
                        addToCart();
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getImageHeaderWidget() {
    return Container(
      height: 250,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        gradient: LinearGradient(
            colors: [
              const Color(0xFF3366FF).withOpacity(0.1),
              const Color(0xFF3366FF).withOpacity(0.09),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Hero(
        tag:
            'GroceryItem:${widget.groceryItem.name}-${widget.heroSuffix ?? ''}',
        child: Image(
          image: AssetImage(widget.groceryItem.imagePath),
        ),
      ),
    );
  }

  Widget getProductDataRowWidget(String label, {Widget? customWidget}) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Row(
        children: [
          AppText(text: label, fontWeight: FontWeight.w600, fontSize: 16),
          const Spacer(),
          if (customWidget != null) ...[
            customWidget,
            const SizedBox(
              width: 20,
            )
          ],
          const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          )
        ],
      ),
    );
  }

  Widget nutritionWidget() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xffEBEBEB),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const AppText(
        text: '100gm',
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Color(0xff7C7C7C),
      ),
    );
  }

  Widget ratingWidget() {
    Widget starIcon() {
      return const Icon(
        Icons.star,
        color: Color(0xffF3603F),
        size: 20,
      );
    }

    return Row(
      children: [
        starIcon(),
        starIcon(),
        starIcon(),
        starIcon(),
        starIcon(),
      ],
    );
  }

  double getTotalPrice() {
    return amount * widget.groceryItem.price;
  }
}
