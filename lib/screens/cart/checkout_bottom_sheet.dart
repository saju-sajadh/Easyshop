import 'package:flutter/material.dart';
import '../../apis/auth_api.dart';
import '../../common_widgets/app_button.dart';
import '../../common_widgets/app_text.dart';
import '../../model_schema/user_model.dart';
import '../order_accepted_screen.dart';
import '../order_failed_dialog.dart';
import 'payment_option.dart';

class CheckoutBottomSheet extends StatefulWidget {
  final double totalValue;
  final List<Product>? cartItems;
  const CheckoutBottomSheet(
      {super.key, required this.totalValue, required this.cartItems});

  @override
  CheckoutBottomSheetState createState() => CheckoutBottomSheetState();
}

class CheckoutBottomSheetState extends State<CheckoutBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 30,
      ),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Wrap(
        children: <Widget>[
          Row(
            children: [
              const AppText(
                text: 'Checkout',
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    size: 25,
                  ))
            ],
          ),
          const SizedBox(
            height: 45,
          ),
          getDivider(),
          checkoutRowWithChoices(
            'Payment',
            trailingWidget: const Icon(
              Icons.payment,
            ),
          ),
          getDivider(),
          checkoutRowWithChoices('Total Cost',
              trailingText: '\$${widget.totalValue.toStringAsFixed(2)}'),
          getDivider(),
          const SizedBox(
            height: 30,
          ),
          termsAndConditionsAgreement(context),
          Container(
            margin: const EdgeInsets.only(
              top: 25,
            ),
            child: AppButton(
              label: 'Place Order',
              padding: const EdgeInsets.symmetric(
                vertical: 25,
              ),
              onPressed: () {
                onPlaceOrderClicked();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget getDivider() {
    return const Divider(
      thickness: 1,
      color: Color(0xFFE2E2E2),
    );
  }

  Widget termsAndConditionsAgreement(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'By placing an order you agree to our',
          style: TextStyle(
            color: const Color(0xFF7C7C7C),
            fontSize: 14,
            fontFamily: Theme.of(context).textTheme.bodyMedium?.fontFamily,
            fontWeight: FontWeight.w600,
          ),
          children: const [
            TextSpan(
              text: ' Terms',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            TextSpan(text: ' And'),
            TextSpan(
              text: ' Conditions',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
    );
  }

  Widget checkoutRowWithChoices(String label,
      {String? trailingText, Widget? trailingWidget}) {
    if (label == 'Payment') {
      return PaymentOptionsRow(
          trailingText: trailingText, trailingWidget: trailingWidget);
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Row(
          children: [
            AppText(
              text: label,
              fontSize: 18,
              color: const Color(0xFF7C7C7C),
              fontWeight: FontWeight.w600,
            ),
            const Spacer(),
            trailingText == null
                ? (trailingWidget ?? Container())
                : AppText(
                    text: trailingText,
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      );
    }
  }

  void onPlaceOrderClicked() async {
    try {
      final authAPI = AuthAPI();
      final orderId = 'order_${DateTime.now().millisecondsSinceEpoch}';
      final orderDetails = OrderModel(
        orderId: orderId,
        items: widget.cartItems!,
        totalAmount: widget.totalValue,
        orderDate: DateTime.now(),
      );
      final result = await authAPI.placeOrder(orderDetails);
      if (result == 'Order placed successfully') {
        Navigator.pop(context);
        showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return const OrderAcceptedScreen();
            });
      } else {
        Navigator.pop(context);
        showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return const OrderFailedDialogue();
            });
      }
    } catch (e) {
      Navigator.pop(context);
      showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return const OrderFailedDialogue();
          });
    }
  }

}
