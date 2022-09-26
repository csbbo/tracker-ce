import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracker/components/opt_input.dart';
import 'package:tracker/components/time_count_down.dart';

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
                  child: TimeCountDown(onTimeStart: () {}, onTimeFinish: () {}, countDownTime: 60),
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
                onPressed: () {
                  print("#"*100);
                  print(_firstController.text);
                  print(_secondController.text);
                  print(_thirdController.text);
                  print(_fourthController.text);
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
