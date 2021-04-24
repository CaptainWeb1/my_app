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
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text("je suis une snackbar"),
                        backgroundColor: Colors.green,
                        onVisible: () {
                          print("snackbar est ouverte");
                        },
                        padding: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                            Radius.circular(30)
                          )
                        ),
                      behavior: SnackBarBehavior.fixed,
                      duration: Duration(days: 500),
                      action: SnackBarAction(
                        label: "close",
                        onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                        textColor: Colors.white,
                      ),
                    )
                  ),
                  child: Text("open snackbar")
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 300,
                          color: Colors.purple[100],
                          child: Text("texte"),
                        );
                      }
                  ),
                  child: Text("open modal bottom sheet")
              )
            ],
          )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
