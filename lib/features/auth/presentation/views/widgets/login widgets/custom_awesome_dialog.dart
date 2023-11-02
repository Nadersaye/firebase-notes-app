import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void customAwesomeDialog({
  required BuildContext context,
  required String titleText,
  required String contentText,
  required Color color,
}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    animType: AnimType.rightSlide,
    headerAnimationLoop: false,
    title: titleText,
    desc: contentText,
    btnOkOnPress: () {},
    btnOkIcon: Icons.cancel,
    btnOkColor: color,
  ).show();
}
