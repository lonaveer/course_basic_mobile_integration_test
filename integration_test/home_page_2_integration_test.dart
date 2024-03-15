import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_flutter_app/pages/home_page_2.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('API Integration Tests', () {
    testWidgets('Fetch post data from JSONPlaceholder and display', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // กดปุ่มเพื่อดึงข้อมูล posts
      final fetchPostsButton = find.byKey(Key('fetchPostsButton'));
      await tester.tap(fetchPostsButton);
      // await tester.pumpAndSettle();              // วิธีนี้ไม่สามารถใช้งานได้ เนื่องจาก API Response กลับมาไม่ทัน
      // await tester.pump(Duration(seconds: 5));   // วิธีนี้ใช้งานได้ แต่อาจต้องตั้งเวลาให้ดี มิเช่นนั้นจะทำให้การทดสอบผิดพลาดได้
      final DateTime endTime = DateTime.now().add(Duration(seconds: 10));
      while (DateTime.now().isBefore(endTime)) {    // วิธีนี้ใช้งานได้ และไม่ต้องตั้งเวลาให้ยุ่งยาก แถมช่วยลดข้อผิดพลาดของการทดสอบลงได้
        await tester.pump(Duration(seconds: 1));
        if (find.textContaining('sunt aut facere repellat provident').evaluate().isNotEmpty) {
          break; // หากพบข้อมูลที่คาดหวัง, ออกจากลูป
        }
      };

      // ตรวจสอบว่าข้อมูล post ถูกแสดงบนหน้าจอ
      expect(find.textContaining('sunt aut facere repellat provident'), findsOneWidget);
    });
  });
}