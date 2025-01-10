import 'package:flutter/material.dart';
import 'package:EasyShop/common_widgets/app_button.dart';
import 'package:EasyShop/common_widgets/app_text.dart';
import 'package:EasyShop/screens/order_accepted_screen.dart';

import 'cart/cart_screen.dart';
import 'home/home_screen.dart';

class OrderFailedDialogue extends StatelessWidget {
  const OrderFailedDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        height: 600.0,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 45,
              ),
              child: Image(
                  image: AssetImage('assets/images/order_failed_image.png')),
            ),
            const Spacer(
              flex: 5,
            ),
            const AppText(
              text: 'Oops! Order Failed',
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(
              flex: 2,
            ),
            const AppText(
              text: 'Something went temply wrong',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff7C7C7C),
            ),
            const Spacer(
              flex: 8,
            ),
            AppButton(
              label: 'Please Try Again',
              fontWeight: FontWeight.w600,
              onPressed: () {
                Navigator.of(context)
                    .pushReplacement<void, void>(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const CartScreen();
                  },
                ));
              },
            ),
            const Spacer(
              flex: 4,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context)
                    .pushReplacement<void, void>(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return HomeScreen();
                  },
                ));
              },
              child: const AppText(
                text: 'Back To Home',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}
