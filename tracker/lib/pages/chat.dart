import 'package:flutter/material.dart';
import 'package:tracker/common/color_style.dart';

import 'package:tracker/components/contact.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Map> contactDataList = [
      {
        "name": "bob",
        "message": "hello",
        "avatar_url":
            "https://img.syt5.com/2021/0826/20210826091718376.jpg.420.420.jpg",
      },
      {
        "name": "may",
        "message": "hello world",
        "avatar_url":
            "https://img.syt5.com/2021/0826/20210826091718477.jpg.420.420.jpg",
      },
      {
        "name": "some",
        "message": "hello",
      },
      {
        "name": "some",
        "message": "hello",
        "avatar_url":
            "https://img.syt5.com/2021/0826/20210826091719959.jpg.420.420.jpg"
      },
      {"name": "狭路相逢勇者胜", "message": "木秀于林，风必摧之", "avatar_url": ""}
    ];
    return Scaffold(
      backgroundColor: ColorStyle.backgroundColor,
      body: Container(
        child: getContactList(contactDataList),
      ),
    );
  }
}

Widget getContactList(List<Map> contactDataList) {
  List<ContactModal> contactList = [];
  for (var element in contactDataList) {
    contactList.add(ContactModal(
        name: element["name"],
        message: element["message"],
        avatarUrl: element["avatar_url"])
    );
  }

  if (contactList.isEmpty) {
    return const Center(
      child: Text("一条消息都没有呢，快发起聊天吧，哈哈哈!"),
    );
  }
  return ContactList(contactList);
}
