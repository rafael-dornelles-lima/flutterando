import 'dart:math';

class Encryption {
  String _generateRandonKey(int length) {
    var r = Random();
    return String.fromCharCodes(
        List.generate(length, (index) => r.nextInt(33) + 89)).toUpperCase();
  }

  (String encryptedText, String key) encode(String text) {
    String preparedMessage =
        text.replaceAll(RegExp(r"\d|\W+"), "").toUpperCase();

    String key = _generateRandonKey(preparedMessage.length);

    List<int> listCharCodesText = preparedMessage.codeUnits;
    List<int> listCharCodesKey = key.codeUnits;
    List<String> listEncryptedText = <String>[];

    int sum = 0;
    int restDivision = 0;
    int numberCharCodeA = 65;
    for (var i = 0; i < preparedMessage.length; i++) {
      sum = listCharCodesText.elementAt(i) + listCharCodesKey.elementAt(i);
      restDivision = sum % 26;
      int value = restDivision + numberCharCodeA;
      listEncryptedText.add(String.fromCharCode(value));
    }
    return (listEncryptedText.join(), key);
  }

  String decode(String text, String key) {
    List<int> listCharCodesText = text.codeUnits;
    List<int> listCharCodesKey = key.codeUnits;
    List<String> listDecryptedText = <String>[];

    int sum = 0;
    int sub = 0;
    int restDivision = 0;
    int numberCharCodeA = 65;
    for (var i = 0; i < text.length; i++) {
      sub = listCharCodesText.elementAt(i) - listCharCodesKey.elementAt(i);
      sum = sub + 26;
      restDivision = sum % 26;
      int value = restDivision + numberCharCodeA;
      listDecryptedText.add(String.fromCharCode(value));
    }
    return listDecryptedText.join();
  }
}
