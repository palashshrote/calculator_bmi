import 'package:flutter/material.dart';
import '../constantsx.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer(
      {super.key, required this.content, required this.onPress});
  final String content;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        color: bottomContainerColor,
        height: bottomContainerHeight,
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        child: Center(
          child: Text(
            content,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
