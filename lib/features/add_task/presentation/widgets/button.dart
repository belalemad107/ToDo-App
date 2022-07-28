import 'package:flutter/material.dart';
import 'package:to_do/core/theme.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTab;
  const MyButton({super.key, required this.label, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: 120,
        height: 60,
        decoration: BoxDecoration(
          color: primaryClr,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
