import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void customAwesomeDialog(
    {required BuildContext context,
    required String titleText,
    required String contentText,
    required Color color,
    DialogType dialogType = DialogType.error}) {
  AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.rightSlide,
    headerAnimationLoop: false,
    title: titleText,
    desc: contentText,
    btnOkOnPress: () {},
    btnOkIcon: Icons.cancel,
    btnOkColor: color,
  ).show();
}
