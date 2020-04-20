import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:provider/provider.dart';

// model
import 'package:junkar/model/junk.dart';

// bloc
import 'package:junkar/bloc/ios_ar_bloc.dart';

// components
import 'package:junkar/components/junk_selection.dart';

class ARScreenIOS extends StatefulWidget {
  static const routeName = 'ar_screen';

  @override
  _ARScreenIOSState createState() => _ARScreenIOSState();
}

class _ARScreenIOSState extends State<ARScreenIOS> {
  IOSARBloc _iosArBloc;

  void _onARKitViewCreated(ARKitController controller) {
    _iosArBloc.eventController.sink
        .add(IOSARKitViewCreated(controller: controller));
  }

  @override
  Widget build(BuildContext context) {
    _iosArBloc = Provider.of<IOSARBloc>(context);
    AppBar appBar = AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text('Junk AR'),
    );

    return Scaffold(
      appBar: appBar,
      extendBodyBehindAppBar: true,
      body: Container(
          child: Stack(
        children: <Widget>[
          ARKitSceneView(
            onARKitViewCreated: _onARKitViewCreated,
            enableTapRecognizer: true,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(
                15, appBar.preferredSize.height + 10, 15, 5),
            color: Colors.black.withOpacity(0.4),
            child: Text(
              'Tap where you want to place or move the junk.',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Theme.of(context).primaryColor,
              height: 150,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  JunkSelection(),
                  SizedBox(height: 10),
                  StreamBuilder(
                    stream: _iosArBloc.junkController.stream,
                    initialData: Junk.junkData.first,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      Junk junk = snapshot.data;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            junk.fact,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            junk.source,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
