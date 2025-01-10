import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../common_widgets/app_button.dart';
import 'account/order_details.dart';


class OrderAcceptedScreen extends StatelessWidget {
  const OrderAcceptedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 10,
            ),
            SvgPicture.asset('assets/icons/order_accepted_icon.svg'),
            const Spacer(
              flex: 8,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Your Purchase Has Been Completed',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                '''Your purchase has been placed and completed''',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff7C7C7C),
                    fontWeight: FontWeight.w600),
              ),
            ),
            const Spacer(
              flex: 8,
            ),
            AppButton(
              label: 'Back To Home',
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context)
                    .pushReplacement<void, void>(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const OrderScreen();
                  },
                ));
              },
            ),
            const Spacer(
              flex: 2,
            ),
            const Spacer(
              flex: 10,
            ),
          ],
        ),
      ),
    );
  }
}
