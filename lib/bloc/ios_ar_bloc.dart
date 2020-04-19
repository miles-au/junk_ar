import 'package:flutter/foundation.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'dart:async';

// model
import 'package:junkar/model/junk.dart';

//region Events
abstract class IOSAREvent {}

class IOSARKitViewCreated extends IOSAREvent {
  ARKitController controller;
  IOSARKitViewCreated({this.controller});
}

class IOSARChangeJunk extends IOSAREvent {
  Junk junk;
  IOSARChangeJunk({@required this.junk});
}

class IOSARClearNodes extends IOSAREvent {}
//endregion

//region Bloc
class IOSARBloc {
  ARKitController _controller;
  ARKitReferenceNode _junkNode;
  Junk junk = Junk.junkData.first;

  // Event Controller
  final eventController = StreamController<IOSAREvent>();
  Sink<IOSAREvent> get collectionEventSink => eventController.sink;

  // junk controller
  final junkController = StreamController<Junk>.broadcast();

  IOSARBloc() {
    eventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(IOSAREvent event) async {
    // ARKit view created, set controller
    if (event is IOSARKitViewCreated) {
      print('arkit view created');
      _controller = event.controller;
      _controller.onARTap = (hitResultList) {
        final point = hitResultList.firstWhere(
          (o) => o.type == ARKitHitTestResultType.featurePoint,
          orElse: () => null,
        );
        if (point != null) _addJunk(position: _pointToTappedPosition(point));
      };
    }
    // Change Junk
    else if (event is IOSARChangeJunk) {
      this.junk = event.junk;
      if (_junkNode != null) {
        _addJunk(position: _junkNode.position.value);
      }
      junkController.sink.add(junk);
    }
  }

  vector.Vector3 _pointToTappedPosition(ARKitTestResult point) {
    // get tapped position
    return vector.Vector3(
      point.worldTransform.getColumn(3).x,
      point.worldTransform.getColumn(3).y,
      point.worldTransform.getColumn(3).z,
    );
  }

  void _addJunk({vector.Vector3 position}) {
    _removeJunkNode();
    // create and add junk node
    _junkNode = ARKitReferenceNode(
      url: junk.daePath,
      position: position,
      scale: vector.Vector3(0.001, 0.001, 0.001),
    );
    _controller.add(_junkNode);
  }

  void _removeJunkNode() {
    // if junk node exists, remove it
    if (_junkNode != null) {
      _controller.remove(_junkNode.name);
      _junkNode = null;
    }
  }

  void dispose() {
    eventController.close();
    junkController.close();
    _controller.dispose();
  }
}
//endregion

class IOSMeasuringFunctions {}
