import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///
/// flutter_clean_architecture_2023
/// File Name: toast_message
/// Created by sujangmac on 2023/07/29
///
/// Description:
///

void showToastMessage(String message) {
  Fluttertoast.showToast(
    msg: message,
    gravity: ToastGravity.TOP,
    fontSize: 20,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}
