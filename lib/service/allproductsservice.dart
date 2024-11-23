import 'package:store_app/model/productsModel.dart';
import 'package:store_app/service/api.dart';

class AllProductsService {
  Future<List<ProductsModel>> getallproducts() async {
     List<dynamic> jsondata = await Api().get(Url: 'https://fakestoreapi.com/products');
      print(jsondata[0]);
      List<ProductsModel> productsModelList = [];
      for (int i=0; i<jsondata.length; i++) {
        productsModelList.add(ProductsModel.fromjson(jsondata[i]));   
      }  
      return productsModelList;
  }
}
