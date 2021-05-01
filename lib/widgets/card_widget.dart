
import 'package:flutter/material.dart';

import '../models/post.dart';
import '../models/product.dart';

class CardWidget extends StatefulWidget {

  final Product product;
  final Post post;

  const CardWidget({Key key, this.product, this.post}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {

  String _title, _subtitle, _line1, _line2, _line3;
  Icon _icon;

  void _buildData() {
    if(widget.product != null) {
      _title = widget.product.productName;
      _icon = widget.product.icon;
      _subtitle = widget.product.category;
      _line1 = "${widget.product.price.toString()} €";
      _line2 = (widget.product.availability == Availability.AVAILABLE) ? "en stock" : "indisponible";
      _line3 = "${ widget.product.weight.toString()} g";
    } else {
      _title = widget.post.userName;
      _icon = widget.post.picture;
      _subtitle = (widget.post.isOnline) ? "en ligne" : "hors ligne";
      _line1 = "likes : " + widget.post.likes.toString();
      _line2 = widget.post.postText;
      _line3 = "${widget.post.views.toString()} vues";
    }
  }

  @override
  void initState() {
    super.initState();
    _buildData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              _title,
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
          ),
          SizedBox(height: 15,),
          Container(
            width: 300,
            height: 120,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            flex: 2,
                            child: _icon
                        ),
                        Expanded(
                            flex: 1,
                            child: Text(
                                _subtitle,
                                style: TextStyle(
                                  fontStyle: FontStyle.italic
                                ),
                            )
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(_line1),
                        Text(_line2),
                        Text(_line3),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
