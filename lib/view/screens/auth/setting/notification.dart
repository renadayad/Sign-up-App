
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/cutsom_text.dart';




class NotificationWidget extends StatelessWidget {
  NotificationWidget({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            fontSize: 22,
            fontWeight: FontWeight.w300,
            text: "Notification",
            color:  Colors.black,
          ),
          Switch(
            activeTrackColor: Colors.green,
            activeColor: Colors.green,
            value: false,
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }


}