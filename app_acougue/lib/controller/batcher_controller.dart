import 'package:app_acougue/model/batcher.dart';

class BatcherController {
  final List<Batcher> _batchers = <Batcher>[
    Batcher(id: 1, name: 'Açougue São José', document: '12345685236512'),
    Batcher(id: 2, name: 'Açougue Avenida', document: '32569854125793')
  ];

  List<Batcher> getAllBatchers() {
    return _batchers;
  }

  Batcher getBatcherById(int id) {
    return _batchers.firstWhere(
      (element) => element.id == id,
    );
  }
}
