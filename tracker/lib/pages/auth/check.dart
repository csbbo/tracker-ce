import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:tracker/common/utils/pref_utils.dart';
import 'package:tracker/components/opt_input.dart';
import 'package:tracker/components/time_count_down.dart';
import 'package:tracker/main.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  final TextEditingController _thirdController = TextEditingController();
  final TextEditingController _fourthController = TextEditingController();

  Future applyCaptcha(String phoneNumber) async {
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';

    String url = "http://192.168.110.25:8000/api/account/captcha/";
    Map<String,dynamic> map = {};
    map['phone_number']=phoneNumber;

    await dio.post(url, data: map);
  }

  @override
  Widget build(BuildContext context) {
    final phoneNumber = Get.arguments;

    return Scaffold(
      // appBar: AppBar(
      // ),
      body: Container(
        margin: const EdgeInsets.only(
            left: 40,
            right: 40,
            top: 120
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Text.rich(
                  TextSpan(
                      children: [
                        const TextSpan(
                            text: "验证码已通过短信发送至 ",
                            style: TextStyle(color: Color(0xFF616161))
                        ),
                        TextSpan(
                            text: "+86 $phoneNumber",
                            style: const TextStyle(color: Colors.black, fontSize: 15)
                        )
                      ]
                  )
              ),
              // child: TextVar(content: phoneNumber?? "",),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 2,
                right: 2,
                bottom: 12
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // todo: 有些bug，输入一半时候无法删除。希望能够输入完成后自动登录无需点击登录按钮
                children: [
                  OtpInput(_firstController, 1),
                  OtpInput(_secondController, 2),
                  OtpInput(_thirdController, 3),
                  OtpInput(_fourthController, 4)
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: TimeCountDown(onTimeStart: () async {
                    await applyCaptcha(phoneNumber);
                  }, onTimeFinish: () {}, countDownTime: 60),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 40,
                bottom: 40,
              ),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  String captcha = "${_firstController.text}${_secondController.text}${_thirdController.text}${_fourthController.text}";
                  if (captcha.length < 4) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text("请输入完整验证码"),
                        action: SnackBarAction(
                          label: "",
                          onPressed: () {},
                        ),
                      ),
                    );
                  } else {
                    var token = UserPreferences.getToken();

                    Dio dio = Dio();
                    dio.options.headers['content-Type'] = 'application/json';
                    dio.options.headers["authorization"] = "Token $token";

                    String url = "http://192.168.110.25:8000/api/account/login/";
                    Map<String,dynamic> map = {};
                    map['phone_number']=phoneNumber;
                    map['captcha']=captcha;

                    Response response = await dio.post(url, data: map);
                    Map<String,dynamic> data = response.data;
                    if (data["data"] != null) {
                      await UserPreferences.setToken(data["data"]["token"]);
                      Get.back();
                      Get.back();
                      Get.to(const MainPage());
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: const Color(0xFF80CBC4),
                    disabledForegroundColor: Colors.white,
                    backgroundColor: const Color(0xFF26a69a),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
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
