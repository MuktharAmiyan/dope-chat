import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CircleButton extends StatelessWidget {
  final double size;
  final Color buttonColor;
  final VoidCallback onPressed;
  final IconData icon;

  const CircleButton(
      {Key? key,
      required this.size,
      required this.buttonColor,
      required this.onPressed,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          shape: const CircleBorder(),
        ),
        onPressed: onPressed,
        child: Icon(
          icon,
        ),
      ),
    );
  }
}
