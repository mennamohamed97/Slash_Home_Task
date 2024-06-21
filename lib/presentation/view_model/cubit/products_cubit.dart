import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:slash_app/data/models/product_model.dart';

import '../../../domain/usecases/fetch_products.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final FetchProducts fetchProducts;
  late Map<String, List<Product>> products;

  ProductsCubit(this.fetchProducts) : super(ProductsInitial());

  void getAllProducts() {
    fetchProducts.execute().then((products) {
      emit(ProductsLoaded(products));
      this.products = products;
    }).catchError((error) {
      emit(ProductsError(error.toString()));
    });
  }
}
