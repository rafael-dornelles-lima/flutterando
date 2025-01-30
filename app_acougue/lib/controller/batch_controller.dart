import 'package:app_acougue/model/batch.dart';

class BatchController {
  final List<Batch> _batchs = <Batch>[
    Batch(
        batchNumber: '18DEZ2024C',
        expirationDate: DateTime(2024, 12, 18),
        dischargeDate: DateTime(2025, 01, 10, 10, 45, 21)),
    Batch(batchNumber: '20JAN2025C', expirationDate: DateTime(2025, 1, 20)),
    Batch(batchNumber: '31JAN2025F', expirationDate: DateTime(2025, 1, 31)),
    Batch(batchNumber: '21NOV2025A', expirationDate: DateTime(2025, 11, 21))
  ];

  List<Batch> getAllBatch() {
    return _batchs;
  }

  Batch getBatchById(String batchNumber) {
    return _batchs.firstWhere(
      (element) => element.batchNumber == batchNumber,
    );
  }
}
