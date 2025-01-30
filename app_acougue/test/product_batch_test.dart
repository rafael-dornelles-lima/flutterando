import 'package:app_acougue/controller/product_batch_controller.dart';
import 'package:app_acougue/model/product_batch.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('deve obter apenas um product batch', () {
    const String batchNumber = '18DEZ2024C';

    ProductBatchController controller = ProductBatchController();
    ProductBatch productBatch =
        controller.getProductBathByBatchNumber(batchNumber);

    expect(productBatch.batch.batchNumber, batchNumber);
  });
}
