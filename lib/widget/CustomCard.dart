import 'package:flutter/material.dart';
import 'package:store_app/Screens/UpdateproductScreen.dart';
import 'package:store_app/model/productsModel.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key, required this.productsModel,});
  final ProductsModel productsModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context,UpdateProductScreen.id,arguments: productsModel);
      },
      child: Stack(clipBehavior: Clip.none, children: [
        SizedBox(
          height: 120,
          width: 190,
          child: Card(
            clipBehavior: Clip.none,
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    productsModel.title,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${productsModel.price}'),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.favorite))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 32,
          bottom: 80,
          child: Image.network(
            height: 100,
            width: 100,
            productsModel.image,
          ),
        ),
      ]),
    );
  }
}
