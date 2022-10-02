import 'package:flutter/material.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white
        ),
        child: const Center(child: Text("ChatRoom"))
    );
  }
}
