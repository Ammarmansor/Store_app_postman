import 'package:store_app/model/productsModel.dart';
import 'package:store_app/service/api.dart';

class GetCategory {
  Future<List<ProductsModel>> getcategory(
      {required String categoryname}) async {
     
      List<Map<String, dynamic>> jsondata = await Api().get(Url: 'https://fakestoreapi.com/products/category/$categoryname');
      List<ProductsModel> productsModelList = [];
      for (var item in jsondata) {
        productsModelList.add(ProductsModel.fromjson(item));
      }
      return productsModelList;
    
  }
}
