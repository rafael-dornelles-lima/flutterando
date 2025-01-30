import 'package:app_acougue/controller/batch_controller.dart';
import 'package:app_acougue/controller/product_controller.dart';
import 'package:app_acougue/controller/stock_location_controller.dart';
import 'package:app_acougue/globals/product_globals.dart';
import 'package:app_acougue/model/product_batch.dart';

class ProductBatchController {
  final ProductController _productController = ProductController();
  final BatchController _batchController = BatchController();
  final StockLocationController _stockLocationController =
      StockLocationController();
  List<ProductBatch> _productsBatch = [];
  ProductGlobal productGlobal = ProductGlobal.instance;

  List<ProductBatch> getAllProductBatchOrderedByExpirationDate() {
    _productsBatch = <ProductBatch>[
      ProductBatch(
          product: _productController.getProductById(1),
          batch: _batchController.getBatchById('18DEZ2024C'),
          stockLocation: _stockLocationController.getStockLocationById(1)),
      ProductBatch(
          product: _productController.getProductById(2),
          batch: _batchController.getBatchById('20JAN2025C'),
          stockLocation: _stockLocationController.getStockLocationById(1)),
      ProductBatch(
          product: _productController.getProductById(2),
          batch: _batchController.getBatchById('21NOV2025A'),
          stockLocation: _stockLocationController.getStockLocationById(1)),
      ProductBatch(
          product: _productController.getProductById(2),
          batch: _batchController.getBatchById('31JAN2025F'),
          stockLocation: _stockLocationController.getStockLocationById(1))
    ];

    _productsBatch.sort(
        (a, b) => a.batch.expirationDate.compareTo(b.batch.expirationDate));
    return _productsBatch;
  }

  List<ProductBatch> getAllProductBatchOrderedInStock() {
    List<ProductBatch> productsBatchOrdered =
        getAllProductBatchOrderedByExpirationDate();
    _productsBatch = productsBatchOrdered
        .where((element) => element.batch.dischargeDate == null)
        .toList();
    return _productsBatch;
  }

  ProductBatch getProductBathByBatchNumber(String batchNumber) {
    return getAllProductBatchOrderedInStock().firstWhere(
      (element) => element.batch.batchNumber == batchNumber,
    );
  }

  void remove(ProductBatch productBatch) {
    List<ProductBatch> t = productGlobal.productsBatch;

    int index = t.indexWhere((element) =>
        element.batch.batchNumber == productBatch.batch.batchNumber);
    ProductBatch p = t.elementAt(index);
    p.batch.dischargeDate = DateTime.now();

    productGlobal.productsBatch =
        t.where((element) => element.batch.dischargeDate == null).toList();
  }

  void save(ProductBatch productBatch) {
    productGlobal.productsBatch.add(productBatch);
    productGlobal.productsBatch.sort(
        (a, b) => a.batch.expirationDate.compareTo(b.batch.expirationDate));
  }
}
