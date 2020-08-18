import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_calculator/screens/ConfigureScreen.dart';
import 'package:provider/provider.dart';

import 'models/Data.dart';
import 'screens/HomeScreen.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (_) => Data(),
      child: MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Home.id,
      routes: {
        Home.id : (context) => Home(),
        ConfigureScreen.id : (context) => ConfigureScreen(),
      },
    );
  }
}

