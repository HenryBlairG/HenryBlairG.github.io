import 'package:flutter/material.dart';
import '../core/widgets/styles.dart';
import '../core/widgets/vertical_navbar.dart';
import '../features/about/presentation/view/about_page.dart';
import '../features/blog/presentation/view/blog_page.dart';
import '../features/contact/presentation/view/contact_page.dart';
import '../features/experience/presentation/view/experience_page.dart';
import '../features/home/presentation/view/home_page.dart';
import '../features/projects/presentation/view/projects_page.dart';
import '../features/skills/presentation/view/skills_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Henry Blair',
      theme: ThemeData(
        primarySwatch: MaterialColor(primaryColor.value, const <int, Color>{
          50: primaryColor,
          100: primaryColor,
          200: primaryColor,
          300: primaryColor,
          400: primaryColor,
          500: primaryColor,
          600: primaryColor,
          700: primaryColor,
          800: primaryColor,
          900: primaryColor,
        }),
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    const HomePage(),
    const AboutPage(),
    const SkillsPage(),
    const ProjectsPage(),
    const ExperiencePage(),
    const BlogPage(),
    const ContactPage(),
  ];

  void _onItemSelected(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          VerticalNavBar(onItemSelected: _onItemSelected),
          Expanded(
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }
}