
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Product {
  Product({required this.name, required this.price});

  final String name;
  final double price;
}

final _products = [
  Product(name: 'iPhone', price: 999),
  Product(name: 'cookie', price: 2),
  Product(name: 'ps5', price: 500),
];

final productsProvider = Provider<List<Product>>((ref) {
  final sortType = ref.watch(productSortTypeProvider);

  List<Product> sortedProducts = List.from(_products);

  switch (sortType) {
    case ProductSortType.name:
      sortedProducts = sortedProducts.toList()..sort((a, b) => a.name.compareTo(b.name));
      break;
    case ProductSortType.price:
      sortedProducts = sortedProducts.toList()..sort((a, b) => a.price.compareTo(b.price));
      break;
  }

  return sortedProducts;
});

enum ProductSortType {
  name,
  price,
}
class Products extends ConsumerWidget {
  const Products({super.key});


  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          DropdownButton<ProductSortType>(
            value:  ref.watch(productSortTypeProvider),
            onChanged:(value) =>
            ref.read(productSortTypeProvider.notifier).state = value!,
            items: const [
              DropdownMenuItem(
                value: ProductSortType.name,
                child: Icon(Icons.sort_by_alpha),
              ),
              DropdownMenuItem(
                value: ProductSortType.price,
                child: Icon(Icons.sort),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('${product.price} \$'),
          );
        },
      ),
    );
  }
}

final productSortTypeProvider = StateProvider<ProductSortType>(
  // We return the default sort type, here name.
      (ref) => ProductSortType.name,
);
