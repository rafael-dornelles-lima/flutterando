class Calculator {
  int calculateFibonacci(int position) {
    List numbers = [1];
    int previousNumber = 0;
    int newNumber = 0;

    for (var i = 0; i < position - 1; i++) {
      newNumber = numbers.elementAt(i);
      previousNumber = (numbers.length > 1) ? numbers.elementAt(i - 1) : 0;
      newNumber = newNumber + previousNumber;
      numbers.add(newNumber);
      print('$numbers ');
    }

    return numbers.last;
  }

  double calculateSimpleRuleOfThree(
      {double? numeratorOne,
      double? denominatorOne,
      double? numeratorTwo,
      double? denominatorTwo}) {
    double result = 0;

    bool numeratorOneIsNull = _isNull(numeratorOne);
    bool denominatorOneIsNull = _isNull(denominatorOne);
    bool numeratorTwoIsNull = _isNull(numeratorTwo);
    bool denominatorTwoIsNull = _isNull(denominatorTwo);

    if (numeratorOneIsNull) {
      result = (denominatorOne! * numeratorTwo!) / denominatorTwo!;
    }
    if (denominatorOneIsNull) {
      result = (numeratorOne! * denominatorTwo!) / numeratorTwo!;
    }
    if (numeratorTwoIsNull) {
      result = (numeratorOne! * denominatorTwo!) / denominatorOne!;
    }
    if (denominatorTwoIsNull) {
      result = (denominatorOne! * numeratorTwo!) / numeratorOne!;
    }
    return result;
  }

  bool _isNull(double? value) {
    return value == null;
  }
}
