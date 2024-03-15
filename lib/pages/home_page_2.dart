import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(HomePage2App());

class HomePage2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Integration Test Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _postsData = 'Press button to fetch posts';

  Future<void> _fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    final data = json.decode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        _postsData = data['title']; // แสดง title ของ post
      });
    } else {
      setState(() {
        _postsData = 'Failed to fetch posts';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Posts Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_postsData, key: Key('postData'), textAlign: TextAlign.center,),
            ElevatedButton(
              key: Key('fetchPostsButton'),
              onPressed: _fetchPosts,
              child: Text('Fetch Posts'),
            ),
          ],
        ),
      ),
    );
  }
}