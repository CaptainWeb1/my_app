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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<int>(
        stream: _countForOneSecond(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            if(snapshot.connectionState == ConnectionState.done) {
              return Center(
                  child: Text("terminé")
              );
            } else {
              return Center(
                  child: Text(snapshot.data.toString())
              );
            }
          } else if (snapshot.hasError) {
            return Center(
                child: Text("erreur")
            );
          } else {
              return Center(
                  child: Text("chargement")
              );
          }
        }
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
