import 'dart:convert';
import 'dart:io';

class ConfigurationFile {
  Future<Map> readConfigurationFile() async {
    final file = File('.env');
    List<String> listFileItems = <String>[];
    Map mapConfigurations = new Map();

    Stream<String> lines =
        file.openRead().transform(utf8.decoder).transform(LineSplitter());
    try {
      await for (var line in lines) {
        listFileItems = line.split("=");
        mapConfigurations.addAll(_clearListFileItems(listFileItems));
      }
      print('File is now closed.');
    } catch (e) {
      print('Error: $e');
    }
    return mapConfigurations;
  }

  Map _clearListFileItems(List<String> listFileItems) {
    Map mapItemsList = new Map();
    mapItemsList[listFileItems[0].trim()] =
        listFileItems[1].trim().split("#")[0];
    return mapItemsList;
  }
}
