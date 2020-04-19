import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// bloc
import 'bloc/ios_ar_bloc.dart';

// screens
import 'screens/home_screen.dart';
import 'screens/ios_ar_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IOSARBloc>(create: (_) => IOSARBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green[700],
          primaryColorLight: Color(0xff60ad5e),
          primaryColorDark: Color(0xff005005),
          buttonColor: Colors.green[700],
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          ARScreenIOS.routeName: (context) => ARScreenIOS(),
        },
      ),
    );
  }
}
