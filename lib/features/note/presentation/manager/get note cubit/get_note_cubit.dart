import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_training/core/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_note_state.dart';

class GetNoteCubit extends Cubit<GetNoteState> {
  GetNoteCubit() : super(GetNoteInitial());
  late List<QueryDocumentSnapshot> notes;
  late String mainPath;
  getNote() async {
    emit(GetNoteLoading());
    notes = [];
    try {
      QuerySnapshot response = await FirebaseFirestore.instance
          .collection(firstCollection)
          .doc(mainPath)
          .collection(noteCollection)
          .get();
      notes.addAll(response.docs);
      emit(GetNoteSuccess());
    } catch (e) {
      emit(GetNoteFailure(error: e.toString()));
    }
  }
}
