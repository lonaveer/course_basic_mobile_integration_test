import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_flutter_app/pages/login_page.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Login and Logout Integration Test', () {
    testWidgets('ทดสอบการ login และ logout', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // ทดสอบการ login
      await tester.enterText(find.byKey(Key('usernameField')), 'testuser');
      await tester.enterText(find.byKey(Key('passwordField')), 'password123');
      await tester.tap(find.byKey(Key('loginButton')));
      await tester.pumpAndSettle();

      // ตรวจสอบว่าเข้าสู่หน้าหลักหลังจากการ login
      expect(find.text('Welcome to the Home Page!'), findsOneWidget);

      // ทดสอบการ logout
      await tester.tap(find.byKey(Key('logoutButton'))); // สมมติว่าคุณมีปุ่ม logout ที่มี Key ว่า 'logoutButton'
      await tester.pumpAndSettle();

      // ตรวจสอบว่ากลับมายังหน้า login หลังจากการ logout
      expect(find.byKey(Key('loginButton')), findsOneWidget); // ตรวจสอบโดยหาปุ่ม login ในหน้า login
    });
  });
}