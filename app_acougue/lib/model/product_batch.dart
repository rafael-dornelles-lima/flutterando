import 'package:app_acougue/model/batch.dart';
import 'package:app_acougue/model/product.dart';
import 'package:app_acougue/model/stock_location.dart';

class ProductBatch {
  final Product product;
  final Batch batch;
  final StockLocation stockLocation;

  ProductBatch(
      {required this.product,
      required this.batch,
      required this.stockLocation});
}
