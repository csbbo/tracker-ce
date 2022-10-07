import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:tracker/common/color_style.dart';
import 'package:tracker/common/utils/geo_utils.dart';
import 'package:tracker/pages/auth/login.dart';
import 'package:tracker/pages/publish.dart';

import 'discover.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.backgroundColor,
      body: Column(
          children: [
            TopPanel(),
            HotOperation(),
          ]
      ),
    );
  }
}

class TopPanel extends StatefulWidget {
  const TopPanel({Key? key}) : super(key: key);

  @override
  State<TopPanel> createState() => _TopPanelState();
}

class _TopPanelState extends State<TopPanel> {
  String latitude = "-";
  String longitude = "-";
  String altitude = "-";

  @override
  void initState() {
    super.initState();

    setState(() {
      const LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );
      StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
          locationSettings: locationSettings).listen((Position? position) {
        print(position == null ? 'Unknown' : '${position.latitude.toString()}, ${position.longitude.toString()}');
        latitude = position!.latitude.toString();
        longitude = position.longitude.toString();
        altitude = position.altitude.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage("https://tracker-be.oss-cn-beijing.aliyuncs.com/static/VCG211275464206.jpg"),
              fit: BoxFit.fill)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "永泰园",
            style: TextStyle(fontSize: 27),
          ),
          Text("经度: $longitude\n纬度: $latitude\n海拔: $altitude")
        ],
      ),
    );
  }
}

class HotOperation extends StatelessWidget {
  const HotOperation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: const <Widget>[
          HotOperationLeft(),
          HotOperationRight()
        ],
      ),
    );
  }
}


class HotOperationLeft extends StatelessWidget {
  const HotOperationLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: InkWell(
          onTap: () {
            // Get.back();
            Get.to(DiscoverPage());
          },
          child: Container(
            height: 68,
            margin:
            const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 8),
                  padding: const EdgeInsets.symmetric(
                      vertical: 6, horizontal: 6),
                  decoration: const BoxDecoration(
                      color: ColorStyle.mainColor,
                      borderRadius:
                      BorderRadius.all(Radius.circular(15))),
                  child:
                  const Icon(Icons.search_rounded, color: Colors.white),
                ),
                const Text(
                  "探索周边",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        )
    );
  }
}

class HotOperationRight extends StatelessWidget {
  const HotOperationRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: InkWell(
          onTap: () {
            Get.to(const Publish());
          },
          child: Container(
            height: 68,
            margin:
            const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 8),
                  padding: const EdgeInsets.symmetric(
                      vertical: 6, horizontal: 6),
                  decoration: const BoxDecoration(
                      color: ColorStyle.mainColor,
                      borderRadius:
                      BorderRadius.all(Radius.circular(15))),
                  child: const Icon(Icons.camera, color: Colors.white),
                ),
                const Text(
                  "发表内容",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        )
    );
  }
}
