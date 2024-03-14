import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/login_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'), // ตั้งชื่อหน้าว่า "Home Page"
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // จัดกลางข้อความในแนวตั้ง
          children: <Widget>[
            Text(
              'Welcome to the Home Page!', // แสดงข้อความต้อนรับ
              style: TextStyle(
                fontSize: 20.0, // ขนาดข้อความ
                fontWeight: FontWeight.bold, // ทำให้ข้อความหนา
              ),
            ),
            SizedBox(height: 20), // เพิ่มช่องว่างระหว่างข้อความกับปุ่ม
            ElevatedButton(
              onPressed: () {
                // กดเพื่อนำทางกลับไปยังหน้า Login
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text('Logout'), // ข้อความบนปุ่ม
            ),
          ],
        ),
      ),
    );
  }
}