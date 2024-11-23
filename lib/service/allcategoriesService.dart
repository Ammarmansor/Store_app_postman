import 'package:store_app/service/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getallcategories() async {
      List<dynamic> jsondata = await Api().get(Url: 'https://fakestoreapi.com/products/categories');
      List<dynamic> categoriesList = [];
      for (int i = 0; i < jsondata.length; i++) {
        categoriesList.add(jsondata[i]);
      }
      return categoriesList;
  }
}
