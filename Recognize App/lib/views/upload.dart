import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infosys_aarohan_app/constants.dart';
import 'package:infosys_aarohan_app/controllers/dialogs_controller.dart';
import 'package:infosys_aarohan_app/widgets/custom_button.dart';
import 'package:file_picker/file_picker.dart';

class UploadDocuments extends StatefulWidget {
  const UploadDocuments({super.key});

  @override
  State<UploadDocuments> createState() => _UploadDocumentsState();
}

class _UploadDocumentsState extends State<UploadDocuments> {
  PlatformFile? file;
  final constants = Get.put(Constants());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: Get.height / 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Meddy ',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800)),
                Text('Buddy',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: constants.themeColor)),
              ],
            ),
            SizedBox(height: Get.height / 70),
            Text('Upload',
                style: TextStyle(
                    fontSize: 20,
                    // fontWeight: FontWeight.m,
                    color: Colors.grey.shade800)),
            SizedBox(height: Get.height / 8),
            InkWell(
              onTap: () async {
                try {
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(
                          allowMultiple: false,
                          allowedExtensions: ['pdf'],
                          type: FileType.custom);

                  if (result == null) {
                    return DialogsController().showErrorDialog(
                        'Error', 'Please make sure to pick a file.');
                  }

                  if (result.files.first.size > 10000000) {
                    return DialogsController().showErrorDialog('Not allowed',
                        'Please make sure that file size is less than 10 MB.');
                  }

                  setState(() {
                    file = result.files.first;
                  });
                } catch (e) {
                  return DialogsController().showErrorDialog('Error', '$e');
                }
              },
              child: Container(
                height: Get.height / 4,
                width: Get.width / 1.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 225, 244, 252),
                    border: Border.all(
                        color: const Color.fromARGB(255, 148, 223, 255))),
                child: const Center(
                  child: Icon(Icons.upload_file,
                      color: Color.fromARGB(255, 29, 172, 229), size: 72),
                ),
              ),
            ),
            SizedBox(height: Get.height / 20),
            SizedBox(
              width: Get.width / 1.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('I confirm that:',
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: 19)),
                  SizedBox(height: Get.height / 70),
                  Padding(
                    padding: EdgeInsets.only(left: Get.width / 20),
                    child: Text('Given data is 100% accurate.',
                        style: TextStyle(
                            color: Colors.grey.shade800, fontSize: 15)),
                  ),
                  SizedBox(height: Get.height / 70),
                  Padding(
                    padding: EdgeInsets.only(left: Get.width / 20),
                    child: Text('My data can be stored securely.',
                        style: TextStyle(
                            color: Colors.grey.shade800, fontSize: 15)),
                  ),
                  SizedBox(height: Get.height / 4.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                          constants: constants,
                          height: Get.height / 20,
                          width: Get.width / 3,
                          title: 'Upload',
                          color: constants.themeColor,
                          textColor: Colors.grey.shade200,
                          onTap: () async {}),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
