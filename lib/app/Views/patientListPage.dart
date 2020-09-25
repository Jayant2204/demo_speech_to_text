import 'package:demo_speech_to_text/app/Controllers/patientRecordController.dart';
import 'package:demo_speech_to_text/app/Data/patientsModel.dart';
import 'package:demo_speech_to_text/app/Views/speechListenview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientsListScreen extends StatelessWidget {
  final PatientRecordController controller = Get.put(PatientRecordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(() => FloatingActionButton(
            onPressed: () {
              controller.listen();
              Get.to(SpeechListenPage(), transition: Transition.downToUp);
            },
            child:
                Icon(controller.isListning.value ? Icons.mic : Icons.mic_none),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text("Patients List"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () => Get.snackbar("List showing Patients Name",
                  "Description containing max 30 characters"))
        ],
      ),
      body: Obx(() => Container(
            child: controller
                    .patientList.value.patientData.isNull // _patientList.isNull
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      itemCount:
                          controller.patientList.value.patientData.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.network(
                            controller
                                .patientList.value.patientData[index].image,
                          ),

                          //Name of Patient in accordance with gender
                          title: Text(
                            controller.patientList.value.patientData[index]
                                        .gender ==
                                    Gender.MALE
                                ? "Mr. ${controller.patientList.value.patientData[index].firstName} ${controller.patientList.value.patientData[index].lastName}"
                                : "Mrs. ${controller.patientList.value.patientData[index].firstName} ${controller.patientList.value.patientData[index].lastName}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            controller.patientList.value.patientData[index]
                                        .description.length >=
                                    30
                                ? controller.patientList.value
                                    .patientData[index].description
                                    .substring(0, 30)
                                : controller.patientList.value
                                    .patientData[index].description,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                    ),
                  ),
          )),
    );
  }
}
