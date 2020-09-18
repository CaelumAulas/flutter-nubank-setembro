import 'package:aula5/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Login Page ", () {
    testWidgets("Login - sucess and Open Home", (tester) async {
      await tester.pumpWidget(App());
    });
  });
}
