import 'package:flutter/material.dart';
import 'package:store_app/model/productsModel.dart';
import 'package:store_app/service/UpdateProducts.dart';
import 'package:store_app/widget/CustomButton.dart';
import 'package:store_app/widget/CustomTextField.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({super.key});
  static String id = 'UpdateProductScreen';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? title, description, image;
  double? price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductsModel product =
        ModalRoute.of(context)!.settings.arguments as ProductsModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                    label: 'title',
                    hintText: 'enter text',
                    onChanged: (p0) {
                      title = p0;
                    },
                  ),
                  CustomTextField(
                    label: 'description',
                    hintText: 'enter text',
                    onChanged: (p0) {
                      description = p0;
                    },
                  ),
                  CustomTextField(
                    label: 'image',
                    hintText: 'enter text',
                    onChanged: (p0) {
                      image = p0;
                    },
                  ),
                  CustomTextField(
                    label: 'price',
                    hintText: 'enter text',
                    onChanged: (p0) {
                      price = double.tryParse(p0);
                    },
                  ),
                  const SizedBox(
                    height:50 ,
                  ),
                  CustomButton(
                    text: 'Update',
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        var test=await UpdateProducts().updateproduct(
                          id: product.id,
                          title: title ?? product.title,
                          price: price ?? product.price,
                          description: description ?? product.description,
                          image: image ?? product.image,
                        );
                        print(test.title);
                      } catch (e) {
                        print('Failed: ${e.toString()}');
                      }
                      setState(() {
                        isLoading = false;
                      });
                    },
                  ),
                ],
              ),
            ),
            if (isLoading)
              Container(
                color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
