import 'package:flutter/material.dart';
import 'package:online_shop_flutter/models/cart_model.dart';
import 'package:online_shop_flutter/screens/home_screen.dart';
import 'package:online_shop_flutter/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen()),
    );
  }
}
