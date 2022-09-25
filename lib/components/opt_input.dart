import 'package:flutter/material.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final int currentIndex;
  const OtpInput(this.controller, this.currentIndex, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
      height: 60,
      width: 50,
      child: TextField(
        autofocus: false,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        // cursorColor: Theme.of(context).primaryColor,
        cursorColor: Colors.green,
        cursorWidth: 0,
        decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            counterText: '',
        ),
        style: const TextStyle(
          color: Color(0xff9e9e9e),
          fontSize: 25
        ),
        onChanged: (value) {
          if (value.length == 1) {
            if (currentIndex < 4) {
              FocusScope.of(context).nextFocus();
            }
          } else {
            if (currentIndex > 1) {
              FocusScope.of(context).previousFocus();
            }
          }
        },
      ),
    );
  }
}