import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tracker/pages/verify.dart';

import 'package:tracker/common/utils/user_preference.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String phoneNumber = "";
  bool isChecked = false;
  final TextEditingController phoneNumberInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    phoneNumber = UserPreferences.getPhoneNumber() ?? "";
  }

  @override
  void dispose() {
    phoneNumberInputController.dispose();
    super.dispose();
  }

  VoidCallback? loginCheck(BuildContext context) {
    if (phoneNumber.length != 11) {
      return null;
    }

    if (isChecked == false) {
      return () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("用户协议及隐私保护"),
          content: const Text("为保障你的合法权益，请阅读并同意 用户协议 和 隐私政策"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, "确定"),
              child: const Text("确定"),
            ),
          ],
        )
      );
    }

    return () async {
      await UserPreferences.setPhoneNumber(phoneNumber);
      Get.to(const VerifyPage());
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          left: 40,
          right: 40,
          top: 150
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 52,
                    child: TextField(
                      controller: phoneNumberInputController..text=phoneNumber..selection=TextSelection.fromPosition(TextPosition(offset: phoneNumber.length)),
                      decoration: InputDecoration(
                        fillColor: const Color(0xA8DADADA),
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        suffixIcon: phoneNumber == ""? null : IconButton(
                            onPressed: () {
                              setState(() {
                                phoneNumber="";
                                phoneNumberInputController.clear();
                              });
                            },
                            icon: const Icon(Icons.cancel, color: Color(0xC8C5C5C5), size: 20,),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                        hintText: "请输入手机号",
                        hintStyle: const TextStyle(fontSize: 17, color: Color(0xFF8F8B8B)),
                      ),
                      cursorColor: Colors.green,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(11)
                      ],
                      style: const TextStyle(fontSize: 20, color: Colors.black87),
                      onChanged: (inputText) => setState(() {
                        phoneNumber = inputText;
                      }),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                "未注册的手机号验证通过后将自动注册",
                style: TextStyle(fontSize: 15, color: Color(0xFF8F8B8B)),
              )
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 10,
                bottom: 40,
              ),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  onPressed: loginCheck(context),
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: const Color(0xFF80CBC4),
                    disabledForegroundColor: Colors.white,
                    backgroundColor: const Color(0xFF26a69a),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    )
                  ),
                  child: const Text("验证并登录", style: TextStyle(fontSize: 20),),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 22,
                  height: 22,
                  margin: const EdgeInsets.only(
                    top: 3,
                    right: 8,
                  ),
                  child: Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    activeColor: const Color(0xFF26A69A),
                  ),
                ),
                const Expanded(
                  child: Text(
                      "我已阅读并同意 用户协议 和 隐私政策 以及运营商服务协议， 登录tacker, 运营商将对你提供的手机号进行验证"
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
