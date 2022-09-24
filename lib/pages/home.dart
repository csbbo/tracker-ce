import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracker/pages/publish.dart';

import 'discover.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: const <Widget>[
      TopPanel(),
      HotOperation(),
    ]);
  }
}

class TopPanel extends StatelessWidget {
  const TopPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://tenfei02.cfp.cn/creative/vcg/800/new/VCG211275464206.jpg"),
                fit: BoxFit.fill)),
        height: 230,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(),
                  Container(
                    child: const Icon(
                      Icons.message_outlined,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "永泰园",
                      style: TextStyle(fontSize: 27),
                    ),
                    Text("东经: 119.23  北纬: 23.46")
                  ],
                ),
              )
            ],
          ),
        ));
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
                      color: Colors.blue,
                      borderRadius:
                      BorderRadius.all(Radius.circular(15))),
                  child:
                  const Icon(Icons.location_on, color: Colors.white),
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
            Get.back();
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
                      color: Colors.blue,
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
