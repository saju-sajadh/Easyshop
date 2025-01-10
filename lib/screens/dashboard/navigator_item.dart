import 'package:flutter/material.dart';
import '../account/account_screen.dart';
import '../cart/cart_screen.dart';
import '../explore_screen.dart';
import '../home/home_screen.dart';
import '../classification_screen.dart';


class NavigatorItem {
  final String label;
  final String iconPath;
  final int index;
  final Widget screen;

  NavigatorItem(this.label, this.iconPath, this.index, this.screen);
}

List<NavigatorItem> navigatorItems = [
  NavigatorItem('Shop', 'assets/icons/shop_icon.svg', 0, HomeScreen()),
  NavigatorItem('Explore', 'assets/icons/explore_icon.svg', 1, const ExploreScreen()),
  NavigatorItem('Add', 'assets/icons/add_quantity.svg', 2, const ClassificationScreen()),
  NavigatorItem('Cart', 'assets/icons/cart_icon.svg', 3, const CartScreen()),
  NavigatorItem('Account', 'assets/icons/account_icon.svg', 4, const AccountScreen()),
];
