import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  final String username;

  MyProfilePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Center(
        child: Text('Welcome, $username', key: Key('welcomeMessage')),
      ),
    );
  }
}