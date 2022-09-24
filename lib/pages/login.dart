import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracker/pages/verify.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          left: 40,
          right: 40,
          top: 100
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
                    Get.to(VerifyPage());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      )
                  ),
                  child: const Text("验证并登录", style: TextStyle(fontSize: 20),),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(value: isChecked, onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                }),
                Container(
                  // height: 200,
                  width: 250,
                  child: const Text(
                      "我已阅读并同意 用户协议 和 隐私政策 以及运营商服务协议， 登录tacker, 运营商将对你提供的手机号进行验证"
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
