import 'package:flutter/material.dart';
import 'package:store_app/Screens/HomeScreen.dart';
import 'package:store_app/Screens/UpdateproductScreen.dart';

void main() async {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.id: (context) =>  const HomeScreen(),
        UpdateProductScreen.id : (context) =>  UpdateProductScreen()
      },
      initialRoute: HomeScreen.id,
    );
  }
}
