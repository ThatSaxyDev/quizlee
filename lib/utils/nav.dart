import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

void goBack(BuildContext context) {
  FocusManager.instance.primaryFocus?.unfocus();
  Routemaster.of(context).pop();
}

//! nav function
void navigateToViews(BuildContext context, Widget view) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: ((context) {
        return view;
      }),
    ),
  );
}
