import 'package:flutter/material.dart';
import '../../../../core/widgets/buttons.dart';
import '../../../../core/widgets/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Henry Blair',
              style: headline1,
            ),
            const Text(
              'Software Engineer / Full-Stack Developer',
              style: headline2,
            ),
            const SizedBox(height: 20),
            const Text(
              'Building scalable solutions...',
              style: bodyText1,
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton(
                  text: 'View Projects',
                  onPressed: () {},
                ),
                const SizedBox(width: 20),
                PrimaryButton(
                  text: 'Download Resume',
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.code),
                  onPressed: () {},
                  tooltip: 'GitHub',
                ),
                IconButton(
                  icon: const Icon(Icons.business),
                  onPressed: () {},
                  tooltip: 'LinkedIn',
                ),
                IconButton(
                  icon: const Icon(Icons.email),
                  onPressed: () {},
                  tooltip: 'Email',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}