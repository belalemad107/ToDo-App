import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget {
  final String title;
  final IconData? leading;
  final IconData? actions;

  const CustomAppbar(
      {Key? key, required this.title, this.leading, this.actions})
      : super(key: key);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: const TabBar(tabs: []),
      centerTitle: false,
      bottomOpacity: 0,
      elevation: 0,
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15),
        child: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          maxLines: 1,
        ),
      ),
      actions: [
        const Padding(
          padding: EdgeInsets.only(right: 15.0, top: 15),
          child: Icon(Icons.calendar_month, color: Colors.black),
        )
      ],
    );
  }
}
