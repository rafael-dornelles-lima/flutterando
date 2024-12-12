class Cpf {
  String _cpfNumber;
  int _firstDigit = 0;
  int _secondDigit = 0;
  static const int _POSITION_FIRST_CHECK_DIGIT = 9;
  static const int _POSITION_SECOND_CHECK_DIGIT = 10;
  static const int _LAST_POSITION_FIRST_CHECK_DIGIT = 8;
  static const int _LAST_POSITION_SECOND_CHECK_DIGIT = 9;

  Cpf(this._cpfNumber);

  String get cpfNumber => this._cpfNumber;

  (bool isValid, String message) cpfIsValid() {
    //REMOVER MÁSCARA DO CPF
    List<int> cpfNumbers = _extractNumbersToList(this._cpfNumber);

    //VERIFICA A QUANTIDADE DE DÍGITOS (DEVE SER IGUAL A 11)
    bool legthIsValid = cpfNumbers.length == 11;

    if (!legthIsValid) {
      return (false, 'The CPF must contain 11 digits. Verify!');
    }

    //SEPARAR O PRIMEIRO DÍGITO VERIFICADOR
    this._firstDigit = cpfNumbers.elementAt(_POSITION_FIRST_CHECK_DIGIT);

    //SEPARAR O SEGUNDO DÍGITO VERIFICADOR
    this._secondDigit = cpfNumbers.elementAt(_POSITION_SECOND_CHECK_DIGIT);

    //CALCULAR O PRIMEIRO DÍGITO VERIFICADOR
    _firstDigit =
        _calculateCheckDigit(cpfNumbers, _LAST_POSITION_FIRST_CHECK_DIGIT);

    //CALCULAR O SEGUNDO DÍGITO VERIFICADOR
    _secondDigit =
        _calculateCheckDigit(cpfNumbers, _LAST_POSITION_SECOND_CHECK_DIGIT);

    bool firstDigiIsValid =
        _firstDigit == cpfNumbers.elementAt(_POSITION_FIRST_CHECK_DIGIT);
    bool secondDigiIsValid =
        _secondDigit == cpfNumbers.elementAt(_POSITION_SECOND_CHECK_DIGIT);

    //COMPARAR DÍGITOs VERIRICADORES
    if (firstDigiIsValid && secondDigiIsValid) {
      return (true, 'Success: valid cpf');
    }

    if (!firstDigiIsValid || !secondDigiIsValid) {
      return (false, 'Error: invalid cpf');
    }

    return (false, 'Error to validate cpf');
  }

  List<int> _extractNumbersToList(String cpfNumber) {
    String newCpfNumber = cpfNumber.replaceAll('-', '').replaceAll('.', '');
    List<int> listNumberOfCpf = newCpfNumber.split('').map(int.parse).toList();

    return listNumberOfCpf;
  }

  int _calculateCheckDigit(List<int> cpfNumbers, int finalPosition) {
    int incrementalNumber = 2;
    int valueSum = 0;
    int digitValue = 0;

    for (var index = finalPosition; index >= 0; index--) {
      valueSum += cpfNumbers.elementAt(index) * incrementalNumber;
      incrementalNumber++;
    }

    if ((valueSum % 11) >= 2) {
      digitValue = 11 - (valueSum % 11);
    } else {
      digitValue = 0;
    }

    return digitValue;
  }
}
