import 'package:flutter/material.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        margin: const EdgeInsets.only(
            left: 40,
            right: 40,
            top: 60
        ),
        child: Column(
          children: [
            const TextField(
              style: TextStyle(fontSize: 28, color: Colors.black87),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                  vertical: 40
              ),
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    )
                ),
                child: const Text("登录/注册", style: TextStyle(fontSize: 20),),
              ),
            ),
          ],
        ),
      )
    );
  }
}
