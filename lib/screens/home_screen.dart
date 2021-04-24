import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  final String title;

  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _checked = false;

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
              Text("text"),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () => showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (_) => WillPopScope(
                        onWillPop: () async {
                          return false;
                        },
                        child: StatefulBuilder(
                          builder: (context, setState) {
                            return Dialog(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("titre"),
                                  Text("ceci est une Dialog"),
                                  Checkbox(
                                      value: _checked,
                                      onChanged: (value) {
                                        setState(() {
                                          _checked = value;
                                        });
                                      }
                                  ),
                                  ElevatedButton(
                                      onPressed: () => Navigator.of(context).pop(),
                                      child: Text("fermer dialog")
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                  ),
                  child: Text("open dialog")
              ),
            ],
          )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
