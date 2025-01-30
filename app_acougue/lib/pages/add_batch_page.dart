import 'package:app_acougue/controller/batcher_controller.dart';
import 'package:app_acougue/controller/product_batch_controller.dart';
import 'package:app_acougue/controller/product_controller.dart';
import 'package:app_acougue/controller/stock_location_controller.dart';
import 'package:app_acougue/model/batch.dart';
import 'package:app_acougue/model/batcher.dart';
import 'package:app_acougue/model/product.dart';
import 'package:app_acougue/model/product_batch.dart';
import 'package:app_acougue/model/stock_location.dart';
import 'package:app_acougue/pages/home_page.dart';
import 'package:flutter/material.dart';

class AddBatchPage extends StatefulWidget {
  const AddBatchPage({super.key});

  @override
  State<AddBatchPage> createState() => _AddBatchPageState();
}

class _AddBatchPageState extends State<AddBatchPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final StockLocationController _stockLocationController =
      StockLocationController();
  final ProductController _productController = ProductController();
  final BatcherController _batcherController = BatcherController();
  final ProductBatchController _productBatchController =
      ProductBatchController();

  StockLocation? dropdownStockLocation;
  List<StockLocation> _stockLocation = [];

  Product? dropdownProduct;
  List<Product> _products = [];
  Batcher? _batcher;
  ProductBatch? _productBatch;
  final TextEditingController _controllerBatcher = TextEditingController();
  final TextEditingController _controllerBatchNumber = TextEditingController();
  final TextEditingController _controllerExpirationDate =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _stockLocation = _stockLocationController.getAllStockLokation();
    _products = _productController.getAllProducts();
    _batcher = _batcherController.getBatcherById(1);
    _controllerBatcher.text = _batcher!.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Incluir Novo Lote'),
          actions: [
            IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  save();
                }),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _controllerBatcher,
                    enabled: false,
                  ),
                  DropdownButtonFormField<Product>(
                    isExpanded: true,
                    autofocus: true,
                    hint: const Text('Selecione o Produto'),
                    value: dropdownProduct,
                    elevation: 16,
                    onChanged: (Product? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownProduct = value!;
                      });
                    },
                    items: _products
                        .map<DropdownMenuItem<Product>>((Product value) {
                      return DropdownMenuItem<Product>(
                        value: value,
                        child: Text(value.name),
                      );
                    }).toList(),
                  ),
                  DropdownButtonFormField<StockLocation>(
                    isExpanded: true,
                    hint: const Text('Selecione o Local do estoque'),
                    value: dropdownStockLocation,
                    elevation: 16,
                    onChanged: (StockLocation? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownStockLocation = value!;
                      });
                    },
                    items: _stockLocation.map<DropdownMenuItem<StockLocation>>(
                        (StockLocation value) {
                      return DropdownMenuItem<StockLocation>(
                        value: value,
                        child: Text(value.location),
                      );
                    }).toList(),
                  ),
                  TextFormField(
                    controller: _controllerBatchNumber,
                    decoration: const InputDecoration(
                        hintText: 'Informe o número do lote'),
                  ),
                  TextFormField(
                    controller: _controllerExpirationDate,
                    decoration: const InputDecoration(
                        hintText: 'Informe a data de validade'),
                  ),
                ],
              )),
        ));
  }

  void save() {
    _productBatch = ProductBatch(
        product: dropdownProduct!,
        batch: Batch(
            batchNumber: _controllerBatchNumber.text,
            expirationDate: DateTime.parse(
                "${_controllerExpirationDate.text.substring(6, 10)}-${_controllerExpirationDate.text.substring(3, 5)}-${_controllerExpirationDate.text.substring(0, 2)}")),
        stockLocation: dropdownStockLocation!);
    _productBatchController.save(_productBatch!);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
