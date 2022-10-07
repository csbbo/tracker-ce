import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracker/common/color_style.dart';
import 'package:tracker/common/dialog.dart';
import 'package:tracker/common/utils/http_utils.dart';

class Publish extends StatefulWidget {
  const Publish({Key? key}) : super(key: key);

  @override
  State<Publish> createState() => _PublishState();
}

class _PublishState extends State<Publish> {
  final titleInputController = TextEditingController();
  final contentInputController = TextEditingController();

  @override
  void dispose() {
    titleInputController.dispose();
    contentInputController.dispose();
    super.dispose();
  }

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
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5),
                decoration: const BoxDecoration(color: ColorStyle.secondBackgroundColor, border: Border(bottom: BorderSide(width: 0.5, color: ColorStyle.borderColor))),
                child: TextField(
                  controller: titleInputController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: null,
                    hintText: "填写标题",
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: ColorStyle.secondBackgroundColor, border: Border(bottom: BorderSide(width: 0.5, color: ColorStyle.borderColor))),
                child: TextField(
                  controller: contentInputController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: "添加正文",
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 6,
                ),
              )
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Http http = Http();
                http.post("/api/social/moment/", {
                  "title": titleInputController.text,
                  "content": contentInputController.text
                }, success: (resp) {
                  if (resp["err"] == null) {
                    // todo: 不知道为啥不执行
                    Get.back();
                  } else {
                    dialog(context, "发布失败",  resp["msg"]);
                  }
                });
              },
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
