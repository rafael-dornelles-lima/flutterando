import 'package:app_acougue/model/product_batch.dart';

class ProductGlobal {
  static ProductGlobal? _instance;
  ProductGlobal._();

  List<ProductBatch> productsBatch = [];

  static ProductGlobal get instance {
    return _instance ??= ProductGlobal._();
  }
}
