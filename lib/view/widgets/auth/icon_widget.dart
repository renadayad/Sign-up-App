import 'package:flutter/material.dart';
import 'package:signup/utils/text_utils.dart';
import 'package:signup/utils/theme.dart';
import 'package:sizer/sizer.dart';

class IconWidget extends StatelessWidget {
  final String image;
  final Function() onPressed;
  final String textUtils;
  final Color conternierColor;

  const IconWidget(
      {required this.image,
      required this.textUtils,
      required this.onPressed,
      required this.conternierColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 52,
        width: 133,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(backgroundColor: conternierColor),
            child: Row(
              children: [
                Image.asset(
                  image,
                  width: 23,
                  height: 24,
                ),
                SizedBox(
                  width: 6,
                ),
                TextUtils(
                  color: Colors.white,
                  fontsize: 13,
                  fontWeight: FontWeight.normal,
                  underLine: TextDecoration.none,
                  text: textUtils,
                ),
              ],
            )));
  }
}
