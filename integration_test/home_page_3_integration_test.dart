import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_flutter_app/pages/home_page_3.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Counter App Tests', () {
    // ทดสอบการเพิ่มค่า counter
    testWidgets('Increment Counter Test', (WidgetTester tester) async {
      app.main(); // รันแอป
      await tester.pumpAndSettle(); // รอให้แอปโหลดเสร็จ

      // กดปุ่มเพิ่มค่า count
      await tester.tap(find.byKey(Key('incrementButton')));
      await tester.pumpAndSettle(); // รอการอัปเดต UI
      expect(find.text('Count: 1'), findsOneWidget); // ตรวจสอบว่าค่า count เพิ่มเป็น 1

      // ทดสอบการลดค่า counter
      await tester.tap(find.byKey(Key('decrementButton')));
      await tester.pumpAndSettle(); // รอการอัปเดต UI
      expect(find.text('Count: 0'), findsOneWidget); // ตรวจสอบว่าค่า count ลดลงเป็น 0
    });
  });
}