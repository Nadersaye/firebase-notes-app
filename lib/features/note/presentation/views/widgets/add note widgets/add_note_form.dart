import 'package:firebase_training/core/widgets/custom_button.dart';
import 'package:firebase_training/core/widgets/custom_awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/custom_textformfield.dart';
import '../../../manager/add note cubit/add_note_cubit.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  TextEditingController note = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteSuccess) {
          debugPrint(state.successMessage);
          Navigator.of(context).pushReplacementNamed("note");
        } else if (state is AddNoteFailure) {
          customAwesomeDialog(
              context: context,
              titleText: 'Error',
              contentText: state.toString(),
              color: Colors.red);
        }
      },
      child: Form(
        autovalidateMode: autovalidateMode,
        key: formState,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomTextForm(
                  maxLines: 5,
                  hinttext: 'enter your note',
                  mycontroller: note,
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
                title: 'Add note',
                onPressed: () {
                  if (formState.currentState!.validate()) {
                    BlocProvider.of<AddNoteCubit>(context).addNote(note);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
