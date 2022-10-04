import 'dart:async';

import 'package:flutter/material.dart';

class TimeCountDown extends StatefulWidget {
  final Function onTimeStart;
  final Function onTimeFinish;
  final int countDownTime;

  const TimeCountDown({Key? key, required this.onTimeStart, required this.onTimeFinish, required this.countDownTime}) : super(key: key);

  @override
  State<TimeCountDown> createState() => _TimeCountDownState();
}

class _TimeCountDownState extends State<TimeCountDown> {
  Timer? _timer;
  int _countDownTime = 0;

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  void initState() {
    super.initState();
    startCountDownTime();
  }

  void startCountDownTime() {
    widget.onTimeStart();
    _countDownTime = widget.countDownTime;

    const durationTime = Duration(seconds: 1);
    callback(timer) => {
      setState(() {
        if (_countDownTime < 1) {
          _timer?.cancel();
          widget.onTimeFinish();
        } else {
          _countDownTime = _countDownTime - 1;
        }
      }),
    };

    _timer = Timer.periodic(durationTime, callback);
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_countDownTime == 0) {
          startCountDownTime();
        }
      },
      child: Text(
        _countDownTime > 0 ? "$_countDownTime 秒后重试" : "重新发送",
        style: TextStyle(
          color: _countDownTime > 0 ? Color(0xFF616161) : Color(0xFF26a69a)
        ),
      ),
    );
  }
}
