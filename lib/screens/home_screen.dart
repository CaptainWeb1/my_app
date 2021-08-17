
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  final String title;

  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _age1 = 16;
  String _message = "cliquez sur le bouton";

  void click() {
    setState(() {
      try {
        checkAge(_age1);
      }
      catch(e, stacktrace) {
        print("erreur : $e");
        print("stacktrace : $stacktrace");
        if (e is AgeException) {
          _message = e.error();
        }
      }
    });

  }

  void checkAge(int age) {
    if(age > 18) {
      _message = "tu es mineur c'est ok";
    } else {
     throw AgeException();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                click();
              },
              child: Text("click"),
            ),
            Text(_message)
          ],
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class AgeException implements Exception {
  String error() => 'Désolé tu es mineur';
}
