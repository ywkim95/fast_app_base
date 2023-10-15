import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_text_watching_bear.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:nav/enum/enum_nav_ani.dart';

class NumberDialog extends DialogWidget<int?> {
  NumberDialog({
    super.key,
    super.animation = NavAni.Fade,
  });

  @override
  DialogState<NumberDialog> createState() => _NotificationDialogState();
}

class _NotificationDialogState extends DialogState<NumberDialog> {
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final numberFocus = FocusNode();
  final passwordFocus = FocusNode();
  final textBearWatchingController = TextWatchingBearController();

  bool check = false;
  bool handsUp = false;
  double look = 0.0;

  @override
  void initState() {
    numberController.addListener(() {
      setState(() {
        look = numberController.text.length.toDouble() * 2;
      });
    });
    numberFocus.addListener(() {
      setState(() {
        check = numberFocus.hasFocus;
      });
    });
    passwordFocus.addListener(() {
      setState(() {
        handsUp = passwordFocus.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedContainer(
            child: Column(
              children: [
                '숫자를 입력해주세요.'.text.make(),
                SizedBox(
                  width: 250,
                  height: 250,
                  child: TextWatchingBear(
                    controller: textBearWatchingController,
                    check: check,
                    handsUp: handsUp,
                    look: look,
                  ),
                ),
                TextField(
                  focusNode: numberFocus,
                  controller: numberController,
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  focusNode: passwordFocus,
                  controller: passwordController,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
                RoundButton(
                  text: '완료',
                  onTap: () async {
                    final text = numberController.text;
                    try {
                      int number = int.parse(text);
                      textBearWatchingController.runSuccessAnimation();
                      await sleepAsync(2000.ms);
                      widget.hide(number);
                    } catch (e) {
                      textBearWatchingController.runFailAnimation();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
