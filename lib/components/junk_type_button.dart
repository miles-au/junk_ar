import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// model
import 'package:junkar/model/junk.dart';

// bloc
import 'package:junkar/bloc/ios_ar_bloc.dart';

class JunkTypeButton extends StatelessWidget {
  final Junk junk;

  JunkTypeButton({@required this.junk});

  @override
  Widget build(BuildContext context) {
    IOSARBloc _arBloc = Provider.of<IOSARBloc>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
      child: StreamBuilder(
        stream: _arBloc.junkController.stream,
        initialData: Junk.junkData.first,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          Junk junkState = snapshot.data;
          JunkButtonTheme theme = JunkButtonTheme.unSelected;
          if (junk.label == junkState.label) theme = JunkButtonTheme.selected;
          return RawMaterialButton(
            fillColor: theme.fillColor,
            shape: theme.shape,
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
            onPressed: () {
              _arBloc.eventController.add(IOSARChangeJunk(junk: junk));
            },
            child: Text(
              junk.label,
              style: theme.textStyle,
            ),
          );
        },
      ),
    );
  }
}

class JunkButtonTheme {
  Color fillColor;
  TextStyle textStyle;
  ShapeBorder shape;
  JunkButtonTheme({this.fillColor, this.textStyle, this.shape});

  static final JunkButtonTheme selected = JunkButtonTheme(
    fillColor: Colors.white,
    textStyle: TextStyle(color: Colors.green[700]),
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(0.0),
      side: BorderSide(color: Colors.white),
    ),
  );

  static final JunkButtonTheme unSelected = JunkButtonTheme(
    fillColor: Colors.green[700],
    textStyle: TextStyle(color: Colors.white),
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(0.0),
      side: BorderSide(color: Colors.white),
    ),
  );
}
