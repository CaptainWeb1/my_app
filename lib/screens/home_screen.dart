import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  final String title;

  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final PageController _pageController = PageController(
      initialPage: 1,
      viewportFraction: 0.75
  );

  void _listenToPageChanges(int index) {
    if(index == 0) {
      print("page 0");
    } else if(index == 1) {
      print("page 1");
    } else {
      print("page 2");
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {
          _listenToPageChanges(index);
        },
        children: [
          Container(
              color: Colors.red[200],
              child: Text("first page")
          ),
          Container(
              color: Colors.green[200],
              child: Text("second page")
          ),
          Container(
              color: Colors.purple[200],
              child: Text("third page")
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
