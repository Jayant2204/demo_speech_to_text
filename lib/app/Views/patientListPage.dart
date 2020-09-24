import 'package:demo_speech_to_text/app/Controllers/patientRecordController.dart';
import 'package:flutter/material.dart';

class PatientsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PatientRecordController controller = PatientRecordController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Patients List"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(itemBuilder: (context, index) {
          return ListTile(
            title: Text(controller.patientList.patientData[index].firstName),
          );
        }),
      ),
    );
  }
}
