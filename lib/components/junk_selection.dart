import 'package:flutter/material.dart';

// model
import 'package:junkar/model/junk.dart';

// components
import 'package:junkar/components/junk_type_button.dart';

class JunkSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: getJunkButtons(),
      ),
    );
  }

  List<JunkTypeButton> getJunkButtons() {
    List<JunkTypeButton> buttons = [];
    for (Junk junk in Junk.junkData) {
      buttons.add(JunkTypeButton(junk: junk));
    }
    return buttons;
  }
}
