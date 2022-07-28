import 'package:flutter/material.dart';
import 'package:to_do/core/theme.dart';

class BoardButton extends StatelessWidget {
  final String label;
  final Function()? onTab;
  const BoardButton({super.key, required this.label, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: MediaQuery.of(context).size.width * .90,
        height: 60,
        decoration: BoxDecoration(
          color: primaryClr,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(label, style: buttonStyle),
        ),
      ),
    );
  }
}
