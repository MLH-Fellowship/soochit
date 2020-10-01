class MyStrings {
  static const appName = "Soochit";
  static const tagline = "Not just another medicine reminder.";

  // welcome screen
  static const welcomeToLabel = "Welcome to";
  static const whoAreYouLabel = "Who are you?";
  static const doctorLabel = "Doctor";
  static const patientLabel = "Patient";

  // loginAuth screen
  static const buttonLabel = "Send Security Code";
  static const phoneRequest = "Enter your mobile number to get an OTP";
  static const placeholderLoginAuth = 'Phone Number (include +91)';

  // otpAuth screen
  static const buttonLabel1 = "Confirm OTP";
  static const otpRequest = "Enter the (6 digit) OTP you have received";

  // snackBar messages (errors/suggestions)
  static const invalidPhoneNumber = 'Please enter a valid phone number';
  static const invalidCodeOrAuth = 'Invalid code/Invalid authentication';
  static const somethingGoneWrong = 'Something has gone wrong, please try later';
  static const invalidPhoneNumberFormat = 'The phone number format is incorrect. Please enter your number in E.164 format i.e. [+][country code][number]';
  static const incorrectOTP = 'Incorrect OTP. Please enter the last code received.';

  // dummy data
  static const patientName = "Rachit Gupta";
  static const paracetamolLabel = "Paracetamol";
  static const crocinLabel = "Crocin";
  static const time = "12:00 PM";
  static const date = "2nd October";
  static const doctorName = "Dr. Rachit Gupta";
  static const phoneNumber = "+91 0000000000";

  static const registerLabel = 'Register'; // for doc and patients both
  static const buttonLabel2 = 'Confirm'; // for doc and patients both

  // >>>>>>>>>>>>>>>>>>>> PATIENT >>>>>>>>>>>>>>>>>>>>

  // home
  static const patientMedDeadlines = "$patientName's Medical Deadlines";
  static const genderLabel = 'Gender';
  static const addressLabel = 'Address';

  // prescription history
  static const patientPrescriptionHistoryLabel =
      "$patientName's Prescription History";

  // >>>>>>>>>>>>>>>>>>>> DOCTOR >>>>>>>>>>>>>>>>>>>>

  // home
  static const doctorPreviousPatients = "'s Previous Patients";
  static const recentAppointmentDate = "2nd Oct";

  // FAB
  static const addAPatientLabel = "Add a patient";
  static const cancelLabel = "Cancel";
  static const confirmLabel = "Confirm";

  // patient's profile (doctor's pov)
  static const ageLabel = "Age";
  static const phoneNumberLabel = "Phone number";
  static const sampleAge = "21";
  static const yearsOldLabel = "years old";
  static const sampleProblem = "Problem: constant cough";
  static const searchPatientsLabel = 'Search patients';

  // register page
  static const nameLabel = 'Full name';
  static const hospitalNameLabel = 'Hospital name';
  static const hospitalAddressLabel = 'Hospital address';
  static const qualificationsLabel = 'Qualification';
  static const uploadSignatureLabel = 'Upload signature';
  static const signatureLabel = 'Signature';

  // prescription
  static const prescriptionLabel = "Prescription";
  static const problemLabel = "Problem";
  static const descriptionOptionalLabel = "Description (Optional)";
  static const sampleMedName = "Paracetamol";
  static const sampleMedTime = "7AM and 8PM";
  static const medicineNameLabel = "Medicine name";
  static const timingsLabel = "Timings";
  static const addAMedicineLabel = "Add a medicine";
}
