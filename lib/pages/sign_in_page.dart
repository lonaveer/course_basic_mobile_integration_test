import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/my_profile_page.dart';

void main () {
  runApp(SignInPageApp());
}
class SignInPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign-In Page App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign-In Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              key: Key('usernameField'),
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              key: Key('passwordField'),
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            ElevatedButton(
              key: Key('loginButton'),
              child: Text('Login'),
              onPressed: () {
                // สมมติว่า การเข้าสู่ระบบสำเร็จ
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => MyProfilePage(username: usernameController.text),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}