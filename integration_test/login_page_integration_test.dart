import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_flutter_app/pages/login_page.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized(); // สำคัญสำหรับการทดสอบ integration

  group('Login Integration Test', () {
    testWidgets('สามารถ login และนำทางไปหน้าหลักได้', (WidgetTester tester) async {
      app.main(); // เริ่มต้นแอป
      await tester.pumpAndSettle(); // รอการโหลดแอป

      // จำลองการป้อนข้อมูล username และ password
      await tester.enterText(find.byKey(Key('usernameField')), 'testuser');
      await tester.enterText(find.byKey(Key('passwordField')), 'password123');

      // กดปุ่ม login
      await tester.tap(find.byKey(Key('loginButton')));
      await tester.pumpAndSettle(); // รอการนำทาง

      // ตรวจสอบว่าได้นำทางไปยังหน้าหลักหลังจาก login สำเร็จ
      expect(find.text('Welcome to the Home Page!'), findsOneWidget);
    });
  });
}