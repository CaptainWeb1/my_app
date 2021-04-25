import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  final String title;

  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  TabController _tabController;
  int _index = 0;

  void initTabController() {
    _tabController = TabController(
        length: 2,
        vsync: this
    );
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      _index = _tabController.index;
    });
  }

  @override
  void initState() {
    super.initState();
    initTabController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(
                      icon: Icon(
                          Icons.cached_rounded,
                          color: Colors.blue,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                          Icons.pan_tool,
                          color: Colors.blue,
                      ),
                    ),
                  ]
              ),
              Container(
                height: 200,
                child: TabBarView(
                    controller: _tabController,
                    children: [
                      Text("tab 1"),
                      Text("tab 2"),
                    ]
                ),
              )
            ],
          )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
