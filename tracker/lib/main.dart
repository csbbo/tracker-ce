import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tracker/pages/auth/login.dart';
import 'package:tracker/pages/chat.dart';
import 'package:tracker/pages/home.dart';
import 'package:tracker/pages/person.dart';

import 'common/color_style.dart';
import 'common/utils/pref_utils.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  // 申请位置权限
  Geolocator.requestPermission();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(debugShowCheckedModeBanner: false, home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    var token = UserPreferences.getToken();
    if (token != "") {
      isLogin = true;
    }
  }

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin != true) {
      return const LoginPage();
    }
    return Scaffold(
      body: Container(
        child: getBottomNavigationBarPage(selectedIndex),
      ),
      bottomNavigationBar: MainBottomNavigationBar(
        selectedIndex: selectedIndex,
        onTapped: onTapped,
      ),
    );
  }
}

Widget getBottomNavigationBarPage(int selectedIndex) {
  const List<Widget> pages = <Widget>[HomePage(), ChatPage(), PersonPage()];
  return pages[selectedIndex];
}

class MainBottomNavigationBar extends StatefulWidget {
  const MainBottomNavigationBar({Key? key, required this.selectedIndex, required this.onTapped}) : super(key: key);
  final int selectedIndex;
  final ValueChanged<int> onTapped;

  @override
  State<MainBottomNavigationBar> createState() => _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: widget.selectedIndex == 0 ? Icon(Icons.home) : Icon(Icons.home_outlined),
          label: "首页",
        ),
        BottomNavigationBarItem(
          icon: widget.selectedIndex == 1 ? Icon(Icons.chat_bubble) : Icon(Icons.chat_bubble_outline),
          label: "消息",
        ),
        BottomNavigationBarItem(
          icon: widget.selectedIndex == 2 ? Icon(Icons.person) : Icon(Icons.person_outline),
          label: "我的",
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: ColorStyle.mainColor,
      unselectedItemColor: Colors.grey,
      iconSize: 25.0,
      onTap: widget.onTapped,
    );
  }
}
