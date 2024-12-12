import 'configuration_file.dart';
import 'cpf.dart';
import 'credit_card.dart';
import 'encryption.dart';
import 'pearson.dart';
import 'calculator.dart';

main() {
  //printBMI();
  //printFibonacci();
  //printSimpleRuleOfThree();
  //printCPF();
  //printCreditCard();
  //printKey();
  printConfigurationFile();
}

Future<void> printConfigurationFile() async {
  ConfigurationFile configurationFile = ConfigurationFile();
  Map map = await configurationFile.readConfigurationFile();
  print(map);
}

void printKey() {
  Encryption encryption = Encryption();

  String message = 'atacar base Sul';

  (String, String) resultEncode = encryption.encode(message);
  String encryptedText = resultEncode.$1;
  String generatedKey = resultEncode.$2;

  print('Texto criptografado:');
  print(encryptedText);

  print('Texto criptografado:');
  print(encryptedText);
  print('Texto descriptografado:');
  print(encryption.decode(encryptedText, generatedKey));
}

void printBMI() {
  Pearson p = Pearson('Pedro', 'Santos', 70.2, 1.80);
  print(p.calculateBodMassIndex());
}

void printFibonacci() {
  Calculator calculator = Calculator();
  print(calculator.calculateFibonacci(6));
}

void printSimpleRuleOfThree() {
  Calculator calculator = Calculator();
  print("Denominador 2");
  print(calculator.calculateSimpleRuleOfThree(
      numeratorOne: 200, denominatorOne: 100, numeratorTwo: 100));
  print("Numerador 2");
  print(calculator.calculateSimpleRuleOfThree(
      numeratorOne: 200, denominatorOne: 100, denominatorTwo: 50));
  print("Denominador 1");
  print(calculator.calculateSimpleRuleOfThree(
      numeratorOne: 200, numeratorTwo: 100, denominatorTwo: 50));
  print("Numerador 1");
  print(calculator.calculateSimpleRuleOfThree(
      denominatorOne: 100, numeratorTwo: 100, denominatorTwo: 50));
}

void printCPF() {
  Cpf cpf = Cpf('749.621.950-93');
  print('CPF -> ' + cpf.cpfNumber);
  print(cpf.cpfIsValid().$2);

  Cpf cpfInvalid = Cpf('749.621.950-90');
  print('CPF -> ' + cpfInvalid.cpfNumber);
  print(cpfInvalid.cpfIsValid().$2);
}

void printCreditCard() {
  CreditCard creditCard = CreditCard('4916 6418 5936 9080');
  print(creditCard.numberCard);
  print(creditCard.numberCreditCardIsValid());

  CreditCard creditCard2 = CreditCard('5419 8250 0346 1210');
  print(creditCard2.numberCard);
  print(creditCard2.numberCreditCardIsValid());
}
