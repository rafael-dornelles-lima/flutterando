import 'package:app_acougue/model/product.dart';

class ProductController {
  final List<Product> _products = <Product>[
    Product(id: 1, name: 'Filé', description: 'description'),
    Product(id: 2, name: 'Alcatra', description: 'description')
  ];

  List<Product> getAllProducts() {
    return _products;
  }

  Product getProductById(int id) {
    return _products.firstWhere(
      (element) => element.id == id,
    );
  }
}
