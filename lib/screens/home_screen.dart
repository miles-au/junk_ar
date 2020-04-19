import 'package:flutter/material.dart';

// screens
import 'ios_ar_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Junk AR'),
      ),
      body: Container(
        padding: EdgeInsets.all(25.0),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              'Welcome to Junk AR!',
              style: TextStyle(
                  fontSize: 30, color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 20.0),
            Text(
              'Junk AR uses Augmented Reality to visualize how much trash we throw away everyday.',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 30.0),
            FlatButton(
              padding: EdgeInsets.all(15),
              color: Theme.of(context).primaryColor,
              child: Text(
                'Start Visualizing!',
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(ARScreenIOS.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
