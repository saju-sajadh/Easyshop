import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import '../model_schema/user_model.dart';

class AuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;
  CollectionReference get users => _store.collection('users');
  final GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();

  Future<UserCredential?> googleSignin() async {
    try {
      final userCredential =
          await _auth.signInWithProvider(_googleAuthProvider);
      return userCredential;
    } catch (e) {
      debugPrint('$e');
      return null;
    }
  }

  void googleSignout() {
    try {
      _auth.signOut();
      debugPrint('Signed out');
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<User?> getCurrentUserInstance() async {
    try {
      final user = _auth.currentUser;
      return user;
    } catch (e) {
      return null;
    }
  }

  Future<UserModel?> readCurrentUser() async {
    final user = _auth.currentUser;
    final uid = user?.uid;
    if (uid == null) {
      debugPrint('no uid');
      return null;
    }
    try {
      final querySnapshot = await users.where('uid', isEqualTo: uid).get();
      if (querySnapshot.docs.isNotEmpty) {
        final userData = UserModel.fromJson(
            querySnapshot.docs.first.data() as Map<String, dynamic>);
        return userData;
      } else {
        debugPrint('else case');
        return null;
      }
    } catch (e) {
      debugPrint('e $e');
      return null;
    }
  }

  Future createUser(UserModel user) async {
    final docRef = users.doc();
    try {
      await docRef.set(user.toJson());
    } catch (e) {
      debugPrint('An error occurred while creating the user: $e');
    }
  }

  Future<void> updateUser(UserModel userData) async {
    try {
      final user = _auth.currentUser;
      final uid = user?.uid;
      final querySnapshot = await users.where('uid', isEqualTo: uid).get();
      if (querySnapshot.docs.isNotEmpty) {
        final docRef = querySnapshot.docs.first.reference;
        final updateData = <String, dynamic>{};
        if (userData.uid != null) {
          updateData['uid'] = userData.uid;
        }
        if (userData.email != null) {
          updateData['email'] = userData.email;
        }
        if (userData.name != null) {
          updateData['name'] = userData.name;
        }
        if (updateData.isNotEmpty) {
          await docRef.update(updateData);
        }
      } else {
        debugPrint('No user found with uid: $uid');
      }
    } catch (e) {
      debugPrint('An error occurred while updating the user: $e');
    }
  }

  Future<void> addItemToCart(List<Product> cart) async {
    try {
      final user = _auth.currentUser;
      final uid = user?.uid;
      final querySnapshot = await users.where('uid', isEqualTo: uid).get();
      if (querySnapshot.docs.isNotEmpty) {
        final docRef = querySnapshot.docs.first.reference;
        await docRef.update({
          'cart': cart.map((product) => product.toJson()).toList(),
        });
        debugPrint('Cart updated successfully');
      }
    } catch (e) {
      debugPrint('Error updating cart: $e');
    }
  }

  Future<List<Product>> getCart(UserModel currentUser) async {
    try {
      final updatedCart = List<Product>.from(currentUser.cart);
      debugPrint('Fetching cart...');
      return updatedCart;
    } catch (e) {
      debugPrint('Error updating cart: $e');
      return [];
    }
  }

  Future<List<Product>> removeItemFromCart(
      List<Product> updatedCart, Product productToRemove) async {
    try {
      final user = _auth.currentUser;
      final uid = user?.uid;
      final querySnapshot = await users.where('uid', isEqualTo: uid).get();
      if (querySnapshot.docs.isNotEmpty) {
        final docRef = querySnapshot.docs.first.reference;
        updatedCart.removeWhere((item) => item.name == productToRemove.name);
        final updatedCartMaps = updatedCart.map((e) => e.toMap()).toList();
        await docRef.update({
          'cart': updatedCartMaps,
        });
        debugPrint('Cart updated successfully');
        return newCart;
      } else {
        debugPrint('User not found');
        return updatedCart;
      }
    } catch (e) {
      debugPrint('Error updating cart: $e');
      return updatedCart;
    }
  }
}
