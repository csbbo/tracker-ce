import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracker/common/color_style.dart';

class Publish extends StatelessWidget {
  const Publish({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorStyle.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorStyle.secondBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xffbdbdbd),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: const [
              Title(),
              Content()
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff00897b),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  )),
              child: const Text(
                "发布",
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      decoration: const BoxDecoration(color: ColorStyle.secondBackgroundColor, border: Border(bottom: BorderSide(width: 0.5, color: ColorStyle.borderColor))),
      child: const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: null,
          hintText: "填写标题",
        ),
      ),
    );
  }
}


class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: ColorStyle.secondBackgroundColor, border: Border(bottom: BorderSide(width: 0.5, color: ColorStyle.borderColor))),
      child: const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: "添加正文",
        ),
        keyboardType: TextInputType.multiline,
        maxLines: 6,
      ),
    );
  }
}
