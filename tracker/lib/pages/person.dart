import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:tracker/common/color_style.dart';
import 'package:tracker/common/utils/user_preference.dart';
import 'package:tracker/main.dart';
import 'package:tracker/pages/auth/login.dart';

class Constant {
  static double itemHeight = 50;
  static double itemBorderRadius = 8;
  static const double itemFontSize = 18;
}

class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.backgroundColor,
      body: Container(
        margin: const EdgeInsets.only(top: 4),
        child: Column(
          children: <Widget>[
            const PersonProfile(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: const [AppFunctionCollection(), Logout()],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PersonProfile extends StatelessWidget {
  const PersonProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 30,
      ),
      decoration: const BoxDecoration(color: ColorStyle.secondBackgroundColor),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network("https://img.syt5.com/2021/0826/20210826091719959.jpg.420.420.jpg"),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  "balabala 昵称",
                  style: TextStyle(
                    fontSize: 25
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "写下你的个性签名吧",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppFunctionCollection extends StatelessWidget {
  const AppFunctionCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        children: const [Feedback(), About(), Setting()],
      ),
    );
  }
}

class Feedback extends StatelessWidget {
  const Feedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constant.itemHeight,
      decoration: const BoxDecoration(
          color: Colors.white, border: Border(bottom: BorderSide(width: 0.5, color: ColorStyle.borderColor))),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Icon(
              Icons.edit,
              color: Color(0xffffab00),
            ),
          ),
          const Text(
            "反馈",
            style: TextStyle(fontSize: Constant.itemFontSize, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constant.itemHeight,
      decoration: const BoxDecoration(
          color: Colors.white, border: Border(bottom: BorderSide(width: 0.5, color: ColorStyle.borderColor))),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Icon(
              Icons.error,
              color: Color(0xff5c6bc0),
            ),
          ),
          const Text(
            "关于",
            style: TextStyle(fontSize: Constant.itemFontSize, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Constant.itemHeight,
        decoration: const BoxDecoration(color: ColorStyle.secondBackgroundColor),
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const Icon(
                Icons.settings,
                color: Colors.blue,
              ),
            ),
            const Text(
              "设置",
              style: TextStyle(fontSize: Constant.itemFontSize, color: Colors.black),
            ),
          ],
        ));
  }
}

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var token = UserPreferences.getToken();
        // todo: 需要统一封装网络请求处理各种异常
        try {
          Dio dio = Dio();
          dio.options.headers['content-Type'] = 'application/json';
          dio.options.headers["authorization"] = "Token $token";

          String url = "http://192.168.110.25:8000/api/account/logout/";
          Map<String, dynamic> map = {};

          Response response = await dio.post(url, data: map);
          Map<String, dynamic> data = response.data;

          await UserPreferences.setToken("");
        } catch (e, stack) {
          print(stack);
        }
        // todo: 这里Get back未按预期执行，跳转LoginPage后返回还是返回到MainPage
        Get.back();
        Get.to(const LoginPage());
      },
      child: Container(
        height: Constant.itemHeight,
        margin: const EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          color: ColorStyle.secondBackgroundColor,
          borderRadius: BorderRadius.circular(Constant.itemBorderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              "退出登录",
              style: TextStyle(fontSize: Constant.itemFontSize, color: ColorStyle.textColor),
            ),
          ],
        ),
      ),
    );
  }
}
