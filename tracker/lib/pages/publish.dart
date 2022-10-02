import 'package:flutter/material.dart';

class Publish extends StatelessWidget {
  const Publish({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("陈少波")
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1
                  ),
                  borderRadius: BorderRadius.circular(0)
              ),
              hintText: "在这里输入要发布内容...",
            ),
            keyboardType: TextInputType.multiline,
            maxLines: 10,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("发布", style: TextStyle(fontSize: 18),),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}

