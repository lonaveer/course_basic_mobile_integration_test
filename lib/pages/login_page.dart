import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/home_page.dart';

void main() {
  runApp(LoginPageApp());
}

class LoginPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LoginPage App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  void _tryLogin(BuildContext context) {
    // ในตัวอย่างนี้ จะแสดงการ login โดยใช้ข้อมูลที่ hardcode ไว้
    if (_username == 'testuser' && _password == 'password123') {
      // หาก login สำเร็จ นำทางไปยัง HomePage
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      // แสดง dialog เมื่อ login ไม่สำเร็จ
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Invalid username or password.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(), // ปิด dialog
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                key: Key('usernameField'),
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) => value!.isEmpty ? 'Please enter username' : null,
                onSaved: (value) => _username = value!,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                key: Key('passwordField'),
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true, // ซ่อนรหัสผ่าน
                validator: (value) => value!.isEmpty ? 'Please enter password' : null,
                onSaved: (value) => _password = value!,
              ),
            ),
            ElevatedButton(
              key: Key('loginButton'),
              child: Text('Login'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _tryLogin(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}