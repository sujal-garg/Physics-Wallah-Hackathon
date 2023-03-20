import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infosys_aarohan_app/constants.dart';
import 'package:infosys_aarohan_app/views/record.dart';

import '../widgets/custom_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final constants = Get.put(Constants());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: Get.height / 10),
            Image.asset('assets/logo.png'),
            SizedBox(height: Get.height / 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Meddy ',
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800)),
                Text('Buddy',
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: constants.themeColor)),
              ],
            ),
            SizedBox(height: Get.height / 20),
            const Text(
              'An innovation that can save lives in an emergency.',
              style: TextStyle(fontSize: 17),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Get.height / 5.3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    constants: constants,
                    height: Get.height / 20,
                    width: Get.width / 3,
                    title: 'Register',
                    color: constants.themeColor,
                    textColor: Colors.grey.shade100,
                    onTap: () {
                      Get.to(const RecordVideo());
                    }),
                SizedBox(width: Get.width / 20),
                CustomButton(
                    constants: constants,
                    height: Get.height / 20,
                    width: Get.width / 3,
                    title: 'Scan',
                    color: Colors.grey.shade400,
                    textColor: Colors.grey.shade800,
                    onTap: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
