import '../../data/models/product_model.dart';
import '../../data/repositories/product_repository.dart';

class FetchProducts {
  final ProductRepository repository;

  FetchProducts(this.repository);

  Future<Map<String, List<Product>>> execute() async {
    return await repository.fetchData();
  }
}
