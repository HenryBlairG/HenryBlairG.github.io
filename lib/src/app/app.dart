import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me/src/features/home/application/home_service.dart';
import 'package:me/src/features/home/presentation/view/home_page.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ShadApp(
        title: 'Flutter Demo',
        theme: ShadThemeData(
          brightness: Brightness.light,
          colorScheme: const ShadSlateColorScheme.light(),
        ),
        home: MyHomePage(
          title: 'Flutter Demo Home Page',
          homeService: HomeService(),
        ),
      ),
    );
  }
}
