import 'package:flutter/material.dart';
import 'package:my_app/controllers/navigation_controller.dart';
import 'package:my_app/screens/second_screen.dart';
import 'package:my_app/widgets/app_bar_widget.dart';
import 'package:my_app/widgets/bottom_navigation_bar_widget.dart';
import 'package:my_app/widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {

  final String title;

  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  NavigationController _appBarController;
  NavigationController _bottomBarController;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _fruit = "pomme";

  @override
  void initState() {
    super.initState();
    _appBarController = NavigationController.appBar(scaffoldKey: _scaffoldKey);
    _bottomBarController = NavigationController.bottomBar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarWidget(appBarController: _appBarController),
      drawer: DrawerWidget(),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_fruit),
              SizedBox(height: 20,),
              PopupMenuButton(
                initialValue: _fruit,
                onSelected: (value) {
                  setState(() {
                    _fruit = value;
                  });
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      value: "pomme",
                      child: Text("pomme"),
                    ),
                    PopupMenuItem(
                      value: "poire",
                      child: Text("poire"),
                    ),
                    PopupMenuItem(
                      value: "raisin",
                      child: Text("raisin"),
                    ),
                  ];
                }
              )
            ],
          )
      ), //
      bottomNavigationBar: BottomNavigationBarWidget(bottomBarController: _bottomBarController,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("click"),
        tooltip: "Si tu cliques il va se passer ça",
        foregroundColor: Colors.white,
        splashColor: Colors.purple,
        child: Text("click"),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
