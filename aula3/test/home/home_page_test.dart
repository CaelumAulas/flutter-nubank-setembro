import 'package:aula3/app/create_transfer/create_transfer_form.dart';
import 'package:aula3/app/create_transfer/widgets/input_text_field.dart';
import 'package:aula3/app/home/home_page.dart';
import 'package:aula3/app/home/widgets/transfer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  void testStartHome() {
    expect(find.text("Home Page"), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.byType(TransferCard), findsNothing);
  }

  Future<void> testNavigateCreateTransfer(tester) async {
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle(Duration(seconds: 2));
    expect(find.byType(CreateTransferForm), findsOneWidget);
  }

  group("HomePage", () {
    testWidgets("Start HomePage", (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HomePage(),
      ));

      testStartHome();
      testNavigateCreateTransfer(tester);
    });

    testWidgets("Criando uma transferencia", (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HomePage(),
      ));
      testStartHome();
      await testNavigateCreateTransfer(tester);
      expect(find.text("Número da conta"), findsOneWidget);
      expect(find.text("Valor"), findsOneWidget);
      expect(find.text("Confirmar"), findsOneWidget);
      await tester.pumpAndSettle(Duration(seconds: 2));
      await tester.enterText(
          find.widgetWithText(InputTextField, "Número da conta"), "1234");
      await tester.enterText(
          find.widgetWithText(InputTextField, "Valor"), "5000");

      expect(find.text("1234"), findsOneWidget);
      expect(find.text("R\$50,00"), findsOneWidget);

      await tester.tap(find.text("Confirmar"));
      await tester.pumpAndSettle(Duration(seconds: 2));
      expect(find.byType(HomePage), findsOneWidget);
      expect(find.byType(TransferCard), findsOneWidget);
      expect(find.widgetWithText(TransferCard, "1234"), findsOneWidget);
      expect(find.widgetWithText(TransferCard, "R\$ 50,00"), findsOneWidget);
    });
  });
}
