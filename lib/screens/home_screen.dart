import 'package:flutter/material.dart';
import 'package:my_app/utils/navigation_utils.dart';

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
              Text(_checked ? "coché" : "non coché"),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () => NavigationUtils.showMainDialog(
                      context: context,
                      title: "pomme",
                      onChecked: (value) {
                        setState(() {
                          _checked = value;
                        });
                      },
                      isChecked: _checked
                      //onClick: () => print("click sur bouton")
                  ),
                  child: Text("open dialog")
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () => NavigationUtils.showMainSnackBar(context: context),
                  child: Text("open snackbar")
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () => NavigationUtils.showMainModalBottomSheet(context: context) ,
                  child: Text("open modal bottom sheet")
              )
            ],
          )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
