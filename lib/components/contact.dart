import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tracker/pages/chat_room.dart';

class ContactModal {
  final String? name;
  final String? message;
  final String? avatarUrl;

  const ContactModal({this.name, this.message, this.avatarUrl});
}

class ContactList extends StatelessWidget {
  final List<ContactModal> contactModalList;

  const ContactList(this.contactModalList, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      children: buildContactsList(),
    );
  }

  List<Widget> buildContactsList() {
    return contactModalList.map((contact) => getListTile(contact)).toList();
  }

  // ContactModal转成ListTile
  Widget getListTile(ContactModal contactModal) {
    return ContactListItem(
      avatarUrl: contactModal.avatarUrl,
      name: contactModal.name,
      message: contactModal.message,
    );
  }
}

class ContactListItem extends StatefulWidget {
  const ContactListItem(
      {Key? key,
      required this.avatarUrl,
      required this.name,
      required this.message})
      : super(key: key);
  final String? avatarUrl;
  final String? name;
  final String? message;

  @override
  State<ContactListItem> createState() => _ContactListItemState();
}

class _ContactListItemState extends State<ContactListItem> {
  late String avatarUrl;
  late String name;
  late String message;

  @override
  void initState() {
    super.initState();
    avatarUrl = widget.avatarUrl ?? "";
    name = widget.name ?? "";
    message = widget.message ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(const ChatRoom());
      },
      child: Container(
        height: 65,
        padding: const EdgeInsets.symmetric(
          horizontal: 3,
          vertical: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                ContactListAvatar(
                  avatarUrl: avatarUrl,
                  name: name,
                ),
                ContactListContent(name: name, message: message)
              ],
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: Column(
                children: const <Widget>[Text("00:17")],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ContactListAvatar extends StatefulWidget {
  const ContactListAvatar(
      {Key? key, required this.avatarUrl, required this.name})
      : super(key: key);
  final String avatarUrl;
  final String name;

  @override
  State<ContactListAvatar> createState() => _ContactListAvatarState();
}

class _ContactListAvatarState extends State<ContactListAvatar> {
  Widget? avatar;

  @override
  void initState() {
    super.initState();
    if (widget.avatarUrl != "") {
      avatar = Image.network(widget.avatarUrl);
    } else {
      avatar = Container(
        decoration: const BoxDecoration(
          color: Colors.green,
        ),
        child: Center(
          child: Text(widget.name[0],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28.0,
              )),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: avatar,
      ),
    );
  }
}

class ContactListContent extends StatefulWidget {
  const ContactListContent(
      {Key? key, required this.name, required this.message})
      : super(key: key);
  final String name;
  final String message;

  @override
  State<ContactListContent> createState() => _ContactListContentState();
}

class _ContactListContentState extends State<ContactListContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.name,
              style: const TextStyle(fontSize: 17, color: Colors.black)),
          Text(
            widget.message,
            style: const TextStyle(
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
