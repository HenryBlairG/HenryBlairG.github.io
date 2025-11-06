
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TextLink extends StatefulWidget {
  final String text;
  final String? href;
  final IconData? icon;

  const TextLink({
    super.key,
    required this.text,
    this.href,
    this.icon,
  });

  @override
  State<TextLink> createState() => _TextLinkState();
}

class _TextLinkState extends State<TextLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          if (widget.href != null) {
            launchUrl(Uri.parse(widget.href!));
          }
        },
        child: Row(
          children: [
            if (widget.icon != null)
              Icon(
                widget.icon,
                color: _isHovered ? Colors.blue.shade900 : Colors.blue,
                size: 16,
              ),
            const SizedBox(width: 4),
            Text(
              widget.text,
              style: TextStyle(
                color: _isHovered ? Colors.blue.shade900 : Colors.blue,
                decoration: _isHovered ? TextDecoration.underline : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
