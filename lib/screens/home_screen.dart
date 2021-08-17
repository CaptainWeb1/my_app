
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  final String title;

  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _number = 8;
  String _value = "valeur";

  void click() {
    setState(() {
      try {
        _number = 10 ~/ 0;
        _value = _number.toString();
    } catch(e, stacktrace) {
      print("erreur : $e");
      print("stacktrace : $stacktrace");
      if(e is IntegerDivisionByZeroException) {
        _value = "erreur division par zéro";
      }
    } finally {
        print("c'est fini");
      }
    });
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
            Text(_value)
          ],
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
