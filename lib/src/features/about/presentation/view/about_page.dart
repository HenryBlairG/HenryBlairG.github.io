import 'package:flutter/material.dart';
import '../../../../core/widgets/image_containers.dart';
import '../../../../core/widgets/styles.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularImageContainer(
              imageUrl: 'https://via.placeholder.com/150',
            ),
            SizedBox(width: 40),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Me',
                    style: headline1,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    style: bodyText1,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('5+', style: headline2),
                          Text('Years of Experience', style: bodyText1),
                        ],
                      ),
                      SizedBox(width: 40),
                      Column(
                        children: [
                          Text('20+', style: headline2),
                          Text('Projects Completed', style: bodyText1),
                        ],
                      ),
                      SizedBox(width: 40),
                      Column(
                        children: [
                          Text('10+', style: headline2),
                          Text('Technologies Mastered', style: bodyText1),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}