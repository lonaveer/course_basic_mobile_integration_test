import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_flutter_app/pages/animated_opacity_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('ทดสอบการเปลี่ยนแปลงค่า opacity', (WidgetTester tester) async {
    // โหลดหน้าที่มี AnimatedOpacity
    await tester.pumpWidget(MaterialApp(home: AnimatedOpacityPage()));

    // รอ duration ของ animation
    await tester.pumpAndSettle(Duration(seconds: 2));

    // ตรวจสอบข้อความ "Hello, World!" ว่ามีการแสดงหลังจาก animation
    expect(find.text('Hello, World!'), findsOneWidget);

    // ตรวจสอบค่า opacity หลังจาก animation เสร็จสิ้น
    final FadeTransition fadeTransition = tester.firstWidget(find.byType(FadeTransition));
    expect(fadeTransition.opacity.value, 1.0);
  });
}