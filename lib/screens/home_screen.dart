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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CardWidget(
            cardData: Post(
              userName: "Bgdu92",
              picture: Icon(Icons.emoji_people),
              isOnline: true,
              likes: 5,
              postText: "Salut les petits chats",
              views: 150000
            ),
          ),
          SizedBox(height: 20,),
          CardWidget(
            cardData: Product(
              productName: "Stylo",
              icon: Icon(Icons.create),
              category: "fournitures",
              price: 1.57,
              availability: Availability.AVAILABLE,
              weight: 7
            ),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
