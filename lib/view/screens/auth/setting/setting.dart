import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signup/view/screens/auth/setting/log_out_.dart';
import 'package:signup/view/screens/auth/setting/change_password.dart';
import 'package:signup/view/screens/auth/setting/edit_profile.dart';
import 'package:signup/view/screens/auth/setting/notification.dart';

import '../../../widgets/cutsom_text.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            CustomText(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              text: "Account",
              color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            EditProfile(),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            const SizedBox(
              height: 5,
            ),
            ChangePassword(),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            const SizedBox(
              height: 5,
            ),
            NotificationWidget(),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            const SizedBox(
              height: 5,
            ),
            LogOut(),
          ],
        ),
      ),
    );
  }
}
