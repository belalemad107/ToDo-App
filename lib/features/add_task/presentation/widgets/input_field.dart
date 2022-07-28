import 'package:flutter/material.dart';
import 'package:to_do/core/theme.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextStyle hintStyle;
  final TextEditingController? controller;
  final Widget? widget;
  const InputField(
      {super.key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget,
      required this.hintStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.only(left: 10),
            height: 52,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(12)),
            child: Row(children: [
              Expanded(
                child: TextFormField(
                  readOnly: widget == null ? false : true,
                  controller: controller,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: hintStyle,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        // color: context.theme.backgroundColor
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              widget == null
                  ? Container()
                  : Container(
                      child: widget,
                    ),
            ]),
          )
        ],
      ),
    );
  }
}
