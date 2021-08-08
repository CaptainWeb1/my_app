import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {

  final String title;

  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Stream<int> _countForOneSecond() async* {
    for(int i = 1; i <= 5; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  void _displaySeconds() async {
    _countForOneSecond().listen(
      (data) {
        print(data);
      },
      onError: (error) {
        print(error);
      },
      onDone: () {
        print("c'est terminé");
      }
      );
  }

  @override
  void initState() {
    super.initState();
    _displaySeconds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text("texte")
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
