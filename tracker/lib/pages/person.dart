import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:tracker/common/utils/user_preference.dart';
import 'package:tracker/main.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        PersonProfile(),
        Setting(),
        Feedback(),
        Logout()
      ],
    );
  }
}

class PersonProfile extends StatelessWidget {
  const PersonProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 100,
      height: 150,
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 20,
      ),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 0.3)),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
                "https://img.syt5.com/2021/0826/20210826091719959.jpg.420.420.jpg"),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text("狭路相逢勇者胜",
                    style: TextStyle(
                      fontSize: 25,
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "木秀于林，风必摧之",
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

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        margin: const EdgeInsets.symmetric(
          vertical: 40,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 0.3)),
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const Icon(
                Icons.settings_outlined,
                color: Colors.blue,
              ),
            ),
            const Text(
              "设置",
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
          ],
        )
    );
  }
}

class Feedback extends StatelessWidget {
  const Feedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 0.3)),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Icon(
              Icons.feedback_outlined,
              color: Colors.blue,
            ),
          ),
          const Text(
            "反馈",
            style: TextStyle(fontSize: 17, color: Colors.black),
          ),
        ],
      ),
    );
  }
}


class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var token = UserPreferences.getToken();

        Dio dio = Dio();
        dio.options.headers['content-Type'] = 'application/json';
        dio.options.headers["authorization"] = "Token $token";

        String url = "http://192.168.110.25:8000/api/account/logout/";
        Map<String,dynamic> map = {};

        Response response = await dio.post(url, data: map);
        Map<String,dynamic> data = response.data;
        if (data["err"] == null) {
          await UserPreferences.setToken("");
        }
        Get.back();
        Get.to(const MyStatefulWidget());
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 0.3)),
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const Icon(
                Icons.exit_to_app_outlined,
                color: Colors.blue,
              ),
            ),
            const Text(
              "退出登录",
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
