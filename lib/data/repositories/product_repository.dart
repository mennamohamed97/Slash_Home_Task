import '../datasource/dummyData.dart';
import '../models/product_model.dart';

class ProductRepository {
  Future<Map<String, List<Product>>> fetchData() async {
    List<Product> bestSellingProducts =
        bestSelling.map((item) => Product.fromJson(item)).toList();
    List<Product> newArrivalProducts =
        newArrival.map((item) => Product.fromJson(item)).toList();
    List<Product> recommendedForYouProducts =
        recommendedForYou.map((item) => Product.fromJson(item)).toList();

    return {
      'bestSelling': bestSellingProducts,
      'newArrival': newArrivalProducts,
      'recommendedForYou': recommendedForYouProducts,
    };
  }
}
