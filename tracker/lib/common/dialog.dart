import 'package:flutter/material.dart';

void dialog(BuildContext context, String title, String content) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, "确定"),
            child: const Text("确定", style: TextStyle(color: Color(0xFF8F8B8B)),),
          ),
        ],
      )
  );
}