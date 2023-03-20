import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infosys_aarohan_app/constants.dart';
import 'package:infosys_aarohan_app/views/record.dart';
import 'package:infosys_aarohan_app/views/splash.dart';
import 'package:infosys_aarohan_app/views/upload.dart';
import 'package:infosys_aarohan_app/widgets/custom_button.dart';
import 'package:camera/camera.dart';

// late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // _cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final constants = Get.put(Constants());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.lexendTextTheme()),
      home: const SplashScreen(),
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/record', page: () => const RecordVideo()),
        GetPage(name: '/upload', page: () => const UploadDocuments()),
      ],
    );
  }
}
