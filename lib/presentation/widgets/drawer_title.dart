import 'package:flutter/material.dart';

class DrawerTitle extends StatelessWidget {
  const DrawerTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 24.5),
      child: Text(
        title,
        style: const TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 18,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
