import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_flutter_app/pages/sign_in_page.dart' as app;
import 'package:my_flutter_app/pages/my_profile_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('ทดสอบการ login และแสดงข้อมูลบนหน้า My Profile', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Setup ก่อนทำการทดสอบ
    final usernameField = find.byKey(Key('usernameField'));
    final passwordField = find.byKey(Key('passwordField'));
    final loginButton = find.byKey(Key('loginButton'));

    // ทดสอบการ login
    await tester.enterText(usernameField, 'user123');
    await tester.enterText(passwordField, 'password');
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // ตรวจสอบว่าเข้าสู่หน้า My Profile
    expect(find.byType(MyProfilePage), findsOneWidget);

    // ตรวจสอบข้อมูลบนหน้า My Profile
    expect(find.text('Welcome, user123'), findsOneWidget);
  });
}