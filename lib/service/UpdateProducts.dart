import 'package:dio/dio.dart';
import 'package:store_app/model/productsModel.dart';

class UpdateProducts {
  Future <ProductsModel>updateproduct({
    required dynamic id,
    required String title,
    required double price,
    required String description,
    required String image,
   String? category,
  })async {
    Map<String ,dynamic> data ={
      'title':title,
       'price':price,
       'description':description,
       'image':image,
       'category':category
    };
    final response =await Dio().put('https://fakestoreapi.com/products/$id',data:data,);
    if (response.statusCode==200){
      return ProductsModel.fromjson( response.data);
    }else {
      throw Exception( 'there was a problem : ${response.statusCode} with ${response.data}');
    }
  }
}