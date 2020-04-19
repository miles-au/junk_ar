import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:provider/provider.dart';

// bloc
import 'package:junkar/bloc/ios_ar_bloc.dart';

// components
import 'package:junkar/components/junk_type_button.dart';

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

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Junk AR'),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
          child: Stack(
        children: <Widget>[
          ARKitSceneView(
            onARKitViewCreated: _onARKitViewCreated,
            planeDetection: ARPlaneDetection.horizontal,
            enableTapRecognizer: true,
            showFeaturePoints: true,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Theme.of(context).primaryColor,
              height: 125,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'This is a statistic or a fact.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 30,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        JunkTypeButton(
                          label: 'Water Bottles',
                          onPress: () {
                            print('water bottles');
                          },
                        ),
                        JunkTypeButton(
                          label: 'Coffee Pods',
                          onPress: () {
                            print('coffee pods');
                          },
                        ),
                        JunkTypeButton(
                          label: 'Takeout Containers',
                          onPress: () {
                            print('takeout containers');
                          },
                        ),
                      ],
                    ),
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
