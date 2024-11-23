import 'package:flutter/material.dart';
import 'package:store_app/service/allproductsservice.dart';
import 'package:store_app/widget/CustomCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Trend'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: FutureBuilder(
          future: AllProductsService().getallproducts(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
                );
            } else {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 90, bottom: 8, left: 8, right: 8),
                child: GridView.builder(
                  physics:const BouncingScrollPhysics() ,
                  itemCount: snapshot.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.9,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 100),
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) {
                    return CustomCard(
                      productsModel: snapshot.data![index],
                    );
                  },
                ),
              );
            }
          }),
    );
  }
}
