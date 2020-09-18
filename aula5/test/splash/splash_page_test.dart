import 'package:aula5/app/home/home_page.dart';
import 'package:aula5/app/login/login_page.dart';
import 'package:aula5/app/splash/splash_page.dart';
import 'package:aula5/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("SplashPage", () {
    testWidgets("SplashPage - Start and Open LoginPage", (tester) async {
      await tester.pumpWidget(App());
      expect(find.byIcon(Icons.ac_unit), findsOneWidget);
      expect(find.byType(SplashPage), findsOneWidget);
      await tester.pumpAndSettle(Duration(seconds: 3));
      expect(find.byType(LoginPage), findsOneWidget);
    });
  });
}
