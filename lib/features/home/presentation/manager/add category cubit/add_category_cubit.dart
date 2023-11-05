import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'add_category_state.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit() : super(AddCategoryInitial());

  CollectionReference categories =
      FirebaseFirestore.instance.collection('categories');
  addCategory(TextEditingController folder) async {
    // Call the user's CollectionReference to add a new user
    try {
      emit(AddCategoryLoading());
      DocumentReference response = await categories.add({"name": folder.text});
      emit(AddCategorySuccess(
          successMessage: 'Adding successfully category : $response'));
    } catch (e) {
      emit(AddCategoryFailure(error: e.toString()));
    }
  }
}