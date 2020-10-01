import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PrescriptionDetailsFromFirestore {
  static String hospitalName;
  static String patientName;
  static String patientGender;
  static String patientAge;
  static String problem;
  static String description;
  static String medicineName;
  static String medicineTime;
  static String doctorName;
  static String doctorQualification;
  static String doctorPhoneNumber;
  static String hospitalAddress;

  static Future<String> getPrescriptionDetails(String patientUID, String doctorUID) async {
    Firestore.instance
        .collection('Prescription').where('patientUID'==patientUID && 'doctorUID'==doctorUID)
        .getDocuments()
        .then((value) {
      value.documents.forEach((result) {
        Firestore.instance
            .collection('Patient').document(patientUID)
            .get()
            .then((value) {
          patientName = value.data['name'];
          patientGender = value.data['gender'];
          patientAge = value.data['age'];
        });

          Firestore.instance
              .collection('Doctor').document(doctorUID)
              .get()
              .then((value){
            doctorName = value.data['name'];
            doctorPhoneNumber = value.data['phoneNumber'];
            hospitalName = value.data['hospitalName'];
            hospitalAddress = value.data['hospitalAddress'];
            doctorQualification = value.data['qualification'];
          });
              problem = result.data['problem'];
              description = result.data['description'];
              medicineName = result.data['medicineName'];
        });
});
  }}