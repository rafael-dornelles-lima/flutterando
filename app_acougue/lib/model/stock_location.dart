import 'package:app_acougue/model/batcher.dart';

class StockLocation {
  final int id;
  final String description;
  final String location;
  final Batcher batcher;

  StockLocation(
      {required this.id,
      required this.description,
      required this.location,
      required this.batcher});
}
