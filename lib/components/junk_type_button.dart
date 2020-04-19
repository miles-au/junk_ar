import 'package:flutter/material.dart';

class JunkTypeButton extends StatelessWidget {
  final String label;
  final Function onPress;

  JunkTypeButton({@required this.label, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
      child: RawMaterialButton(
        fillColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 3.0),
        onPressed: onPress,
        child: Text(
          label,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
