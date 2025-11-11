
import 'package:flutter/material.dart';
import './styles.dart';

class NavItem {
  final String title;
  final IconData icon;

  NavItem({required this.title, required this.icon});
}

class VerticalNavBar extends StatefulWidget {
  final Function(int) onItemSelected;

  const VerticalNavBar({super.key, required this.onItemSelected});

  @override
  VerticalNavBarState createState() => VerticalNavBarState();
}

class VerticalNavBarState extends State<VerticalNavBar> {
  int _selectedIndex = 0;

  final List<NavItem> _navItems = [
    NavItem(title: 'Home', icon: Icons.home),
    NavItem(title: 'About', icon: Icons.person),
    NavItem(title: 'Skills', icon: Icons.lightbulb),
    NavItem(title: 'Projects', icon: Icons.work),
    NavItem(title: 'Experience', icon: Icons.history),
    NavItem(title: 'Blog', icon: Icons.article),
    NavItem(title: 'Contact', icon: Icons.email),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: backgroundColor,
      child: Column(
        children: [
          const SizedBox(height: 40),
          const Text(
            'Henry Blair',
            style: headline2,
          ),
          const SizedBox(height: 40),
          Expanded(
            child: ListView.builder(
              itemCount: _navItems.length,
              itemBuilder: (context, index) {
                final item = _navItems[index];
                return ListTile(
                  leading: Icon(item.icon, color: _selectedIndex == index ? primaryColor : textColor),
                  title: Text(
                    item.title,
                    style: TextStyle(
                      color: _selectedIndex == index ? primaryColor : textColor,
                      fontWeight: _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                    widget.onItemSelected(index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
