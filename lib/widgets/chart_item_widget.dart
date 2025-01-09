import 'package:flutter/material.dart';
import '../apis/auth_api.dart';
import '../common_widgets/app_text.dart';
import '../styles/colors.dart';
import '../model_schema/user_model.dart';

class ChartItemWidget extends StatefulWidget {
  const ChartItemWidget(
      {Key? key, required this.item, required this.removeCallback})
      : super(key: key);
  final Product item;
  final Function(Product) removeCallback;

  @override
  ChartItemWidgetState createState() => ChartItemWidgetState();
}

class ChartItemWidgetState extends State<ChartItemWidget> {
  final double height = 110;

  final Color borderColor = const Color(0xffE2E2E2);

  final double borderRadius = 18;

  late double amount;

  @override
  void initState() {
    super.initState();
    amount = widget.item.quandity;
  }

  void removeItemFromCart(Product productToRemove) async {
    try {
      final authAPI = AuthAPI();
      final currentUserData = await authAPI.readCurrentUser();
      final updatedCart = await authAPI.getCart(currentUserData!);
      await authAPI.removeItemFromCart(updatedCart, productToRemove);
      widget.removeCallback(productToRemove);
    } catch (e) {
      debugPrint('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            imageWidget(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: widget.item.name,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 5,
                ),
                AppText(
                    text: widget.item.description,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkGrey),
                const SizedBox(
                  height: 15,
                ),
                AppText(
                    text: 'Quantity: ${widget.item.quandity}',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkGrey),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    removeItemFromCart(widget.item);
                  },
                  child: const Icon(
                    Icons.close,
                    color: AppColors.darkGrey,
                    size: 25,
                  ),
                ),
                const Spacer(
                  flex: 5,
                ),
                Container(
                  width: 70,
                  child: AppText(
                    text: '\$${getPrice().toStringAsFixed(2)}',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.right,
                  ),
                ),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget imageWidget() {
    return Container(
      width: 100,
      child: Image.asset(widget.item.photo),
    );
  }

  double getPrice() {
    return widget.item.price * amount;
  }
}
