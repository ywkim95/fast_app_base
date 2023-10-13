import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/data/preference/prefs.dart';
import 'package:fast_app_base/common/widget/w_big_button.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/d_number.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_switch_menu.dart';
import 'package:fast_app_base/screen/opensource/s_opensource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: '설정'.text.make(),
      ),
      body: ListView(
        children: [
          // switch
          Obx(
            () => SwitchMenu(
              title: '푸시 설정',
              isOn: Prefs.isPushOnRx.get(),
              onChanged: (bool isOn) {
                Prefs.isPushOnRx.set(isOn);
              },
            ),
          ),

          // slider
          Obx(
            () => Slider(
              value: Prefs.sliderPosition.get(),
              onChanged: (value) {
                Prefs.sliderPosition.set(value);
              },
            ),
          ),
          // date time
          Obx(
            () => BigButton(
              text:
                  '날짜 ${Prefs.birthday.get() == null ? '' : Prefs.birthday.get()?.formattedDate}',
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(
                    const Duration(
                      days: 90,
                    ),
                  ),
                  lastDate: DateTime.now().add(
                    const Duration(
                      days: 90,
                    ),
                  ),
                );
                if (date != null) {
                  Prefs.birthday.set(date);
                }
              },
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          // number dialog
          Obx(
            () => BigButton(
              text: '저장된 숫자 ${Prefs.number.get()}',
              onTap: () async {
                final number = await NumberDialog().show();
                if (number != null) {
                  Prefs.number.set(number);
                }
              },
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          BigButton(
            text: '오픈소스 화면',
            onTap: () async {
              Nav.push(const OpensourceScreen());
            },
          ),
        ],
      ),
    );
  }
}
