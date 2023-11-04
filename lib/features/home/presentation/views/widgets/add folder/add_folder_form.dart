import 'package:firebase_training/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_textformfield.dart';

class AddFolderForm extends StatefulWidget {
  const AddFolderForm({
    super.key,
  });

  @override
  State<AddFolderForm> createState() => _AddFolderFormState();
}

class _AddFolderFormState extends State<AddFolderForm> {
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  TextEditingController folder = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formState,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomTextForm(
                hinttext: 'enter folder name',
                mycontroller: folder,
                textFormFieldvalidator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return "can't be empty";
                  } else {
                    return null;
                  }
                }),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              title: 'Add folder',
              onPressed: () {
                if (formState.currentState!.validate()) {
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
