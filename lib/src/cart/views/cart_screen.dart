import 'package:e_commerce/common/services/storage.dart';
import 'package:e_commerce/src/auth/views/login_screen.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String? accessToken = Storage().getString('accessToken');
    if (accessToken == null) {
      return const LoginScreen();
    }
    return const Scaffold(
      body: Center(
        child: Text('cart page screen'),
      ),
    );
  }
}
