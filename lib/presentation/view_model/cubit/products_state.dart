part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final Map<String, List<Product>> products;

  ProductsLoaded(this.products);
}

class ProductsError extends ProductsState {
  final String error;

  ProductsError(this.error);
}
