import 'package:flutter/material.dart';
import 'package:me/src/features/home/application/home_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
    required this.homeService,
  }) : super(key: key);

  final String title;
  final HomeService homeService;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            const Text(
              'You have pushed the button this many times:',
            ),
            ValueListenableBuilder<int>(
              valueListenable: _homeService.counter,
              builder: (context, value, child) {
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
