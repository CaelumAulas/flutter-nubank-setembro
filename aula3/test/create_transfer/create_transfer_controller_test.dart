import 'package:aula3/app/create_transfer/create_transfer_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CreateTransferController controller;
  setUp(() {
    controller = CreateTransferController();
  });

  group("CreateTransferController", () {
    test("Validate Conta - success", () {
      final response = controller.validatorConta('1234');
      expect(response, isNull);
    });

    test("Validate Conta - failed", () {
      final response = controller.validatorConta('');
      expect(response, 'Digite um valor da conta');
    });

    test("Validate valor - failed", () {
      final response = controller.validatorValor(0);
      expect(response, "Valor minímo R\$: 10,00");
    });

    test("Validate valor - success", () {
      final response = controller.validatorValor(11);
      expect(response, isNull);
    });
  });
}
