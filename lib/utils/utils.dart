import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void displayDrawer(BuildContext context) {
  Scaffold.of(context).openDrawer();
}

Future<FilePickerResult?> pickImage() async {
  final image = await FilePicker.platform.pickFiles(type: FileType.image);

  return image;
}

String convert24HourTo12Hour(String time24) {
  final DateFormat formatter = DateFormat('h:mm a');
  final DateTime dateTime = DateFormat('HH:mm').parse(time24);
  final String formattedTime = formatter.format(dateTime);
  return formattedTime;
}

String formatDate(DateTime dateTime) {
  final DateFormat formatter = DateFormat("d'th,' MMMM");
  return formatter.format(dateTime);
}
