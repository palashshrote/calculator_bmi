import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({super.key, required this.iconData, required this.content});

  final IconData iconData;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(content),
      ],
    );
  }
}
