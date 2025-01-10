import 'package:flutter/material.dart';
import 'order_details.dart';
import 'payment_method.dart';
import 'user_details.dart';

class AccountItem {
  final String label;
  final String iconPath;
  final Widget screen;

  AccountItem(this.label, this.iconPath, this.screen);
}

List<AccountItem> accountItems = [
  AccountItem('Orders', 'assets/icons/account_icons/orders_icon.svg', const OrderScreen()),
  AccountItem('My Details', 'assets/icons/account_icons/details_icon.svg', const UserDetailsScreen()),
  AccountItem('Payment Methods', 'assets/icons/account_icons/payment_icon.svg', const PaymentMethodScreen()),
];



