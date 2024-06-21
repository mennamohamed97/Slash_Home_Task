import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_app/data/repositories/product_repository.dart';
import 'package:slash_app/domain/usecases/fetch_products.dart';
import 'package:slash_app/presentation/view/responsive_home_screen.dart';
import 'package:slash_app/presentation/view_model/cubit/products_cubit.dart';

class AppRouter {
  late FetchProducts fetchProducts;
  late ProductsCubit productsCubit;

  AppRouter() {
    fetchProducts = FetchProducts(ProductRepository());
    productsCubit = ProductsCubit(fetchProducts);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => productsCubit,
                  child: const ResponsiveHomeScreen(),
                ));
    }
  }
}
