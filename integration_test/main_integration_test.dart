import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_flutter_app/main.dart' as app; // as app คือการเปลี่ยนชื่อ package ให้เป็น app

void main() {
  // IntegrationTestWidgetsFlutterBinding.ensureInitialized()
  // เป็นเมธอดที่ใช้ในการทดสอบ integration กับไลบรารี integration_test ใน Flutter
  // การเรียกใช้เมธอดนี้จะทำการเตรียมสภาพแวดล้อมการทดสอบเพื่อให้สามารถทำการทดสอบ integration ได้อย่างถูกต้องและมีประสิทธิภาพ
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // ตรวจสอบว่าหน้าแรกแสดงข้อความ "Flutter Demo Home Page" ได้ถูกต้อง
  testWidgets("หน้าแรกแสดงข้อความ 'Flutter Demo Home Page'", (WidgetTester tester) async {
    // 1. โหลดแอป
    app.main();
    await tester.pumpAndSettle(); // รอการเริ่มต้นแอปและ animations

    // 2. ตรวจสอบว่ามีข้อความ 'Flutter Demo Home Page' แสดงบนหน้าจอ
    expect(find.text('Flutter Demo Home Page'), findsOneWidget);
  });
}