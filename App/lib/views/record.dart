import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infosys_aarohan_app/constants.dart';
import 'package:infosys_aarohan_app/views/upload.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RecordVideo extends StatefulWidget {
  const RecordVideo({super.key});

  @override
  State<RecordVideo> createState() => _RecordVideoState();
}

class _RecordVideoState extends State<RecordVideo> {
  bool isLoading = true;
  bool isRecording = false;
  late CameraController _cameraController;
  final constants = Get.put(Constants());
  RxString videoPath = ''.obs;

  initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);
    _cameraController = CameraController(front, ResolutionPreset.max);
    await _cameraController.initialize();
    setState(() => isLoading = false);
  }

  recordVideo() async {
    if (isRecording) {
      final file = await _cameraController.stopVideoRecording();
      setState(() => {videoPath.value = file.path, isRecording = false});
      Get.off(const UploadDocuments());
    } else {
      Fluttertoast.showToast(
          msg: 'Recording Started. Capture a 30 second video.', toastLength: Toast.LENGTH_LONG);
      await _cameraController.prepareForVideoRecording();
      await _cameraController.startVideoRecording();
      setState(() => isRecording = true);
    }
  }

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(color: constants.themeColor))
          : Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CameraPreview(_cameraController),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: FloatingActionButton(
                      backgroundColor: Colors.red,
                      onPressed: () {
                        recordVideo();
                      },
                      child: Icon(isRecording ? Icons.stop : Icons.circle),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
