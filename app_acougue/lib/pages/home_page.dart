import 'package:app_acougue/controller/product_batch_controller.dart';
import 'package:app_acougue/globals/product_globals.dart';
import 'package:app_acougue/model/product_batch.dart';

import 'package:app_acougue/pages/add_batch_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductBatchController _productBatchController =
      ProductBatchController();
  List<ProductBatch> _productsBatch = [];
  ProductGlobal globals = ProductGlobal.instance;

  @override
  void initState() {
    super.initState();
    _refreshList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Controle de Validade'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Column(children: [
            const Text(
              textAlign: TextAlign.center,
              'Lista de Lotes',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              textAlign: TextAlign.center,
              'Hoje: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
              style: const TextStyle(fontSize: 14),
            ),
          ])),
          Expanded(
            flex: 10,
            child: ListView.builder(
                itemCount: _productsBatch.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomTileWithAction(
                      batchNumber: _productsBatch[index].batch.batchNumber,
                      expirationDate:
                          _productsBatch[index].batch.expirationDate,
                      productName: _productsBatch[index].product.name,
                      dischargeDate: _productsBatch[index].batch.dischargeDate,
                      numberDaysAlert: 5,
                      statusProductBatch: getStatusProductBatch(
                          _productsBatch[index].batch.expirationDate,
                          _productsBatch[index].batch.dischargeDate),
                      localization:
                          _productsBatch[index].stockLocation.location,
                      remove: () {
                        _productBatchController.remove(_productsBatch[index]);

                        _refreshList();
                      });
                }),
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.blue[100]),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddBatchPage()),
                );
              },
              child: const Text(
                'Incluir Novo Lote',
                style: TextStyle(fontSize: 18),
              ),
            ),
          )),
        ],
      ),
    );
  }

  void _refreshList() {
    if (globals.productsBatch.isEmpty) {
      globals.productsBatch =
          _productBatchController.getAllProductBatchOrderedInStock();
    }
    setState(() {
      _productsBatch = globals.productsBatch;
    });
  }

  String getStatusProductBatch(
      DateTime expirationDate, DateTime? dischargeDate) {
    int daysToExpiration = expirationDate.difference(DateTime.now()).inDays;
    if (dischargeDate != null) {
      return 'Retired';
    } else {
      if (daysToExpiration <= 5 && daysToExpiration >= 0) {
        return 'Expiring';
      } else if (daysToExpiration < 0) {
        return 'Expired';
      } else {
        return 'Normal';
      }
    }
  }
}

class CustomTileWithAction extends StatelessWidget {
  final String batchNumber;
  final DateTime expirationDate;
  final String productName;
  final DateTime? dischargeDate;
  final int numberDaysAlert;
  final String statusProductBatch;
  final String localization;
  final Function() remove;

  const CustomTileWithAction(
      {super.key,
      required this.batchNumber,
      required this.expirationDate,
      required this.productName,
      this.dischargeDate,
      required this.numberDaysAlert,
      required this.statusProductBatch,
      required this.localization,
      required this.remove});

  @override
  Widget build(BuildContext context) {
    DateFormat formatDate = DateFormat('dd/MM/yyyy');
    DateFormat formatDateTime = DateFormat('dd/MM/yyyy HH:mm');
    return Card(
      shape: Border.all(color: getColorBorder(statusProductBatch), width: 3),
      color: getColorBackground(statusProductBatch),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Validade: ${formatDate.format(expirationDate)}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  'Lote: $batchNumber - Local: $localization',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Produto: $productName',
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
                if (dischargeDate != null)
                  Text(
                    'Data Baixa: ${(dischargeDate != null) ? formatDateTime.format(dischargeDate!) : ''}',
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  )
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                onPressed: remove,
                icon: const Icon(
                  Icons.delete,
                  size: 30,
                )),
          ),
        ],
      ),
    );
  }

  Color getColorBorder(String statusProductBatch) {
    switch (statusProductBatch) {
      case 'Retired':
        return Colors.blue;
      case 'Expiring':
        return Colors.orange;
      case 'Expired':
        return Colors.red;
      default:
        return Colors.green;
    }
  }

  Color getColorBackground(String statusProductBatch) {
    switch (statusProductBatch) {
      case 'Retired':
        return Colors.blue[100]!;
      case 'Expiring':
        return Colors.orange[100]!;
      case 'Expired':
        return Colors.red[100]!;
      default:
        return Colors.green[100]!;
    }
  }
}
