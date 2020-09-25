import 'package:demo_speech_to_text/app/Controllers/patientRecordController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpeechListenPage extends StatelessWidget {
  final PatientRecordController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(() => FloatingActionButton(
            onPressed: () {
              controller.listen();
              Get.to(SpeechListenPage());
            },
            child:
                Icon(controller.isListning.value ? Icons.mic : Icons.mic_none),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(title: Text('Tap the Button to Listen ')),
      body: Obx(
        () => Container(
          padding: EdgeInsets.all(16),
          child: Text(
            controller.listenedText.value ?? "",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
