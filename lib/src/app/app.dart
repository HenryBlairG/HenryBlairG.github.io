import 'package:flutter/material.dart';
import 'package:me/src/features/home/application/home_service.dart';
import 'package:me/src/features/home/presentation/view/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        homeService: HomeService(),
      ),
    );
  }
}
