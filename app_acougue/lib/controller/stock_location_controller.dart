import 'package:app_acougue/model/batcher.dart';
import 'package:app_acougue/model/stock_location.dart';

class StockLocationController {
  final List<StockLocation> _stocksLocation = <StockLocation>[
    StockLocation(
        id: 1,
        description: 'description',
        location: 'G1P1',
        batcher: Batcher(
            id: 1, name: 'Açougue São José', document: '12345685236512')),
    StockLocation(
        id: 2,
        description: 'description',
        location: 'G1P2',
        batcher: Batcher(
            id: 1, name: 'Açougue São José', document: '12345685236512')),
    StockLocation(
        id: 3,
        description: 'description',
        location: 'G2P1',
        batcher: Batcher(
            id: 1, name: 'Açougue São José', document: '12345685236512'))
  ];

  List<StockLocation> getAllStockLokation() {
    return _stocksLocation;
  }

  StockLocation getStockLocationById(int id) {
    return _stocksLocation.firstWhere(
      (element) => element.id == id,
    );
  }
}
