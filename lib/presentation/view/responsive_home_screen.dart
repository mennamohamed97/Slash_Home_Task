import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/product_model.dart';
import '../view_model/cubit/products_cubit.dart';
import '../widgets/appBar.dart';
import '../widgets/categories_section.dart';
import '../widgets/navBar.dart';
import '../widgets/offer_section.dart';
import '../widgets/products_section.dart';
import '../widgets/searchBar.dart';

class ResponsiveHomeScreen extends StatefulWidget {
  const ResponsiveHomeScreen({Key? key}) : super(key: key);

  @override
  _ResponsiveHomeScreenState createState() => _ResponsiveHomeScreenState();
}

class _ResponsiveHomeScreenState extends State<ResponsiveHomeScreen> {
  late ProductsCubit productsCubit;
  bool isSelected = false;
  @override
  void initState() {
    super.initState();
    productsCubit = BlocProvider.of<ProductsCubit>(context);
    productsCubit.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: navBar(),
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return _MobileLayout(productsCubit: productsCubit);
          } else {
            return _WebLayout(productsCubit: productsCubit);
          }
        },
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  final ProductsCubit productsCubit;

  const _MobileLayout({required this.productsCubit});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: searchBar(),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, bottom: 10, top: 10),
            child: offer(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 10, top: 10),
            child: categories(),
          ),
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsInitial) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductsLoaded) {
                Map<String, List<Product>> data = state.products;
                List<Product> bestSelling = data['bestSelling']!;
                List<Product> newArrival = data['newArrival']!;
                List<Product> recommendedForYou = data['recommendedForYou']!;

                return Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    children: [
                      SectionWidget(
                          title: 'Best Selling', products: bestSelling),
                      SectionWidget(title: 'New Arrival', products: newArrival),
                      SectionWidget(
                          title: 'Recommended for You',
                          products: recommendedForYou),
                    ],
                  ),
                );
              } else if (state is ProductsError) {
                return Center(child: Text('Error: ${state.error}'));
              } else {
                return const Center(child: Text('No data found'));
              }
            },
          ),
        ],
      ),
    );
  }
}

class _WebLayout extends StatelessWidget {
  final ProductsCubit productsCubit;

  const _WebLayout({required this.productsCubit});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: searchBar(),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, bottom: 10, top: 10),
            child: offer(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 10, top: 10),
            child: categories(),
          ),
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsInitial) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductsLoaded) {
                Map<String, List<Product>> data = state.products;
                List<Product> bestSelling = data['bestSelling']!;
                List<Product> newArrival = data['newArrival']!;
                List<Product> recommendedForYou = data['recommendedForYou']!;

                return Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    children: [
                      SectionWidget(
                          title: 'Best Selling', products: bestSelling),
                      SectionWidget(title: 'New Arrival', products: newArrival),
                      SectionWidget(
                          title: 'Recommended for You',
                          products: recommendedForYou),
                    ],
                  ),
                );
              } else if (state is ProductsError) {
                return Center(child: Text('Error: ${state.error}'));
              } else {
                return const Center(child: Text('No data found'));
              }
            },
          ),
        ],
      ),
    );
  }
}
