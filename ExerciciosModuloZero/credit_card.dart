class CreditCard {
  String _numberCard = '';
  List<int> _listNumbersCreditCard = <int>[];
  int? _checkDigit = null;
  int? _lastDigit = null;

  CreditCard(this._numberCard);

  String get numberCard => this._numberCard;

  (bool isValid, String message) numberCreditCardIsValid() {
    _listNumbersCreditCard = _extractNumbersToList(this._numberCard);

    this._lastDigit = _listNumbersCreditCard.last;

    _checkDigit = _getCheckDigit(_listNumbersCreditCard);

    if (_lastDigit == _checkDigit) {
      return (true, 'Credit Card is valid');
    } else {
      return (false, 'Credit Card is invalid');
    }
  }
}

int? _getCheckDigit(List<int> _listNumbersCreditCard) {
  List<int> _listNumbersCalculateCheckDigit = <int>[];
  _listNumbersCalculateCheckDigit.addAll(_listNumbersCreditCard);
  _listNumbersCalculateCheckDigit.removeLast();

  int sumValuesList = 0;
  int valueItem = 0;

  for (var index = 0; index < _listNumbersCalculateCheckDigit.length; index++) {
    bool isEven = (index % 2) == 0;

    if (isEven) {
      valueItem = _listNumbersCalculateCheckDigit.elementAt(index) * 2;
    } else {
      valueItem = _listNumbersCalculateCheckDigit.elementAt(index);
    }

    bool hasTwoDigits = valueItem > 9;

    if (hasTwoDigits) {
      List<int> listToNumbers = <int>[];
      listToNumbers = _extractNumbersToList(valueItem.toString());
      valueItem = listToNumbers.elementAt(0) + listToNumbers.elementAt(1);
    }

    sumValuesList += valueItem;
  }

  int restDivision = (sumValuesList % 10);

  if (restDivision == 0) {
    return (restDivision);
  } else {
    return (10 - restDivision);
  }
}

List<int> _extractNumbersToList(String value) {
  String newValue = value.replaceAll(' ', '');
  List<int> listNumbers = newValue.split('').map(int.parse).toList();

  return listNumbers;
}
