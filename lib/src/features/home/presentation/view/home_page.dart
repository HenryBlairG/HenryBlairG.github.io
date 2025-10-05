import 'package:flutter/material.dart';
import 'package:me/src/features/home/application/home_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
    required this.homeService,
  }) : super(key: key);

  final String title;
  final HomeService homeService;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  late final HomeService _homeService;

  @override
  void initState() {
    super.initState();
    _homeService = widget.homeService;
  }

  void _incrementCounter() {
    // setState is not needed here because ValueListenableBuilder will rebuild the widget
    _homeService.incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: ShadTheme.of(context).textTheme.p,
            ),
            ValueListenableBuilder<int>(
              valueListenable: _homeService.counter,
              builder: (context, value, child) {
                return Text(
                  '$value',
                  style: ShadTheme.of(context).textTheme.h1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: ShadButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
