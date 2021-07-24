import 'package:flutter/material.dart';
import 'package:my_app/models/post.dart';
import 'package:my_app/models/product.dart';
import 'package:my_app/widgets/card_widget.dart';

class HomeScreen extends StatefulWidget {

  final String title;

  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<String> _getUsername() {
    return Future.delayed(Duration(milliseconds: 5000)).then((value) {
      return "Florian";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FutureBuilder(
              future: _getUsername(),
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return Text("Username : ${snapshot.data}");
                } else if(snapshot.hasError) {
                  return Text("Il y a eu une erreur pour charger les données");
                } else {
                  return Text("En cours de chargement");
                }
              },
            )
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
