import 'package:flutter/foundation.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'dart:async';

// model
import 'package:junkar/model/trash.dart';

//region Events
abstract class IOSAREvent {}

class IOSARKitViewCreated extends IOSAREvent {
  ARKitController controller;
  IOSARKitViewCreated({this.controller});
}

class IOSARSetAnchor extends IOSAREvent {
  IOSARSetAnchor();
}

class IOSARChangeTrash extends IOSAREvent {
  IOSARChangeTrash();
}

class IOSARClearState extends IOSAREvent {}
//endregion

//region Bloc
class IOSARBloc {
  ARKitController controller;
  ARKitReferenceNode anchorNode;
  String anchorId;

  // Event Controller
  final eventController = StreamController<IOSAREvent>();
  Sink<IOSAREvent> get collectionEventSink => eventController.sink;

  // measuring title controller
  final anchorNodeController = StreamController<ARKitReferenceNode>.broadcast();

  IOSARBloc() {
    eventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(IOSAREvent event) async {
    // User tapped screen, set anchor
    if (event is IOSARSetAnchor) {
    }
    // ARKit view created, set controller
    else if (event is IOSARKitViewCreated) {
      print('arkit view created');
      controller = event.controller;
//      controller.onARTap = (hitResultList) {};
      controller.onAddNodeForAnchor = (anchor) {
        print('anchor found: $anchor');
        if (anchor is ARKitPlaneAnchor) _addPlane(anchor);
      };
    }
  }

  void _addPlane(ARKitPlaneAnchor anchor) {
    anchorId = anchor.identifier;
    if (anchorNode != null) {
      controller.remove(anchorNode.name);
      anchorNode = null;
    }

    anchorNode = ARKitReferenceNode(
//      url: 'models.scnassets/bottle/bottle.dae',
      url: 'models.scnassets/coffee_pod/coffee_pod.dae',
      position: vector.Vector3(0, 0, 0),
      scale: vector.Vector3(0.001, 0.001, 0.001),
    );
    print('add node');
    controller.add(anchorNode, parentNodeName: anchor.nodeName);
  }

  void dispose() {
    eventController.close();
    anchorNodeController.close();
    controller.dispose();
  }
}
//endregion

class IOSMeasuringFunctions {}
