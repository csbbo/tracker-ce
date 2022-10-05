import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tracker/pages/auth/login.dart';
import 'package:tracker/pages/chat.dart';
import 'package:tracker/pages/home.dart';
import 'package:tracker/pages/person.dart';

import 'common/utils/user_preference.dart';

// todo: 颜色统一风格
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage()
    );
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
      bottomNavigationBar: MainBottomNavigationBar(selectedIndex: selectedIndex, onTapped: onTapped,),
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
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "首页",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          label: "消息",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "我的",
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      iconSize: 25.0,
      onTap: widget.onTapped,
    );
  }
}
