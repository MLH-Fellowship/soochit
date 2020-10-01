import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart' as material;
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/pages/pdf/pdfViewer.dart';
import 'package:soochit/pages/prescriptionDetailsFromFirestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

reportView(context) async {
  String patientUID;
  String doctorUID;

  var firebaseUser = await FirebaseAuth.instance.currentUser();
  var collectionRef = Firestore.instance.collection('Doctor');
  var doc = await collectionRef.document(firebaseUser.uid).get();
  if(doc.exists){
    doctorUID = firebaseUser.uid;
    patientUID = 'iPf8DrsQ2HTi4JA2LLhvSdaEab72';
  }
  else{
    patientUID = firebaseUser.uid;
  }


  PrescriptionDetailsFromFirestore.getPrescriptionDetails(patientUID, doctorUID);
  final Document pdf = Document();

  pdf.addPage(MultiPage(
      pageFormat:
      PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (Context context) {
        if (context.pageNumber == 1) {
          return null;
        }
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            decoration: const BoxDecoration(
                border:
                BoxBorder(bottom: true, width: 0.5, color: PdfColors.grey)),
            child: Text('Report',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      footer: (Context context) {
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: Text('Page ${context.pageNumber} of ${context.pagesCount}',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (Context context) => <Widget>[
        Header(
            level: 0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(PrescriptionDetailsFromFirestore.hospitalName, textScaleFactor: 2),
                  PdfLogo()
                ])),
        Paragraph(
            text:'Patient name: ${PrescriptionDetailsFromFirestore.patientName}'
        ),
        Paragraph(
            text:'Patient age: ${PrescriptionDetailsFromFirestore.patientAge}'
        ),
        Paragraph(
            text:'Patient gender: ${PrescriptionDetailsFromFirestore.patientGender}'
        ),
        Paragraph(
            text:'Problem: ${PrescriptionDetailsFromFirestore.problem}'
        ),
        Header(level: 1, text: 'Description'),
        Paragraph(
            text:
            '${PrescriptionDetailsFromFirestore.description}'),
        Header(level: 1, text: 'Prescribed Medicines'),
        Paragraph(
            text:
            'Paracetamol at 12:00 and 24:00'),
        Paragraph(
            text:
            'Paracetamol at 12:00 and 24:00'),
        Paragraph(
            text:
            'Paracetamol at 12:00 and 24:00'),
        Paragraph(
            text:
            'Paracetamol at 12:00 and 24:00'),
        Paragraph(
            text:
            'Paracetamol at 12:00 and 24:00'),
        Container(
          height: 1,
          margin: EdgeInsets.only(bottom: MyDimens.double_10),
          color: PdfColors.grey
        ),
        Paragraph(
            text:'Doctor name: ${PrescriptionDetailsFromFirestore.doctorName}'
        ),
        Paragraph(
            text:'Doctor Qualification: ${PrescriptionDetailsFromFirestore.doctorQualification}'
        ),
        Paragraph(
            text:'Doctor phone number: ${PrescriptionDetailsFromFirestore.doctorPhoneNumber}'
        ),
        Paragraph(
            text:'Hospital Address: ${PrescriptionDetailsFromFirestore.hospitalAddress}'
        ),
      ]));
  //save PDF

  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/report.pdf';
  final File file = File(path);
  await file.writeAsBytes(pdf.save());
  material.Navigator.of(context).push(
    material.MaterialPageRoute(
      builder: (_) => PdfViewerPage(path: path),
    ),
  );
}
