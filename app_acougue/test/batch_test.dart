import 'package:app_acougue/controller/batch_controller.dart';
import 'package:app_acougue/model/batch.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('deve obter apenas um batch', () {
    const String batchNumber = '18DEZ2024C';

    BatchController controller = BatchController();
    Batch batch = controller.getBatchById(batchNumber);

    expect(batch.batchNumber, batchNumber);
  });
}
