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

  String _userName = "Pas d'utilisateur trouvé";

  Future<String> _getUsername() {
    return Future.delayed(Duration(milliseconds: 5000)).then((value) {
      return "Florian";
    });
  }

  _initDatabase() async {
    String _userNameFuture = await _getUsername();
    setState(() {
      _userName = _userNameFuture;
    });
  }

  @override
  void initState() {
    super.initState();
    _initDatabase();
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
              child: Text("Username : $_userName")
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
