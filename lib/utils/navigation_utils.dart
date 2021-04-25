
import 'package:flutter/material.dart';

class NavigationUtils {

  static showMainDialog({
   @required BuildContext context,
    String title = "title",
    String body = "message pop up",
    String buttonText = "open dialog",
    Function onClick,
    bool isChecked = false,
    ValueChanged<bool> onChecked
  }) {
    bool _isChecked = isChecked;
    showDialog(
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
                    Text(title),
                    Text(body),
                    Checkbox(
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value;
                            onChecked(value);
                          });
                        }
                    ),
                    ElevatedButton(
                        onPressed: (onClick != null)
                            ? () => onClick()
                            : () => Navigator.of(context).pop(),
                        child: Text("fermer dialog")
                    )
                  ],
                ),
              );
            },
          ),
        )
    );
  }

  static showMainSnackBar({
    @required BuildContext context
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
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
    );
  }

  static showMainModalBottomSheet({@required BuildContext context}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 300,
            color: Colors.purple[100],
            child: Text("texte"),
          );
        }
    );
  }

}