import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_training/core/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_category_state.dart';

class GetCategoryCubit extends Cubit<GetCategoryState> {
  GetCategoryCubit() : super(GetCategoryInitial());

  List<QueryDocumentSnapshot> categories = [];

  getCategory() async {
    emit(GetCategoryLoading());
    try {
      QuerySnapshot response =
          await FirebaseFirestore.instance.collection(firstCollection).get();
      categories.addAll(response.docs);
      emit(GetCategorySuccess());
    } catch (e) {
      emit(GetCategoryFailure(error: e.toString()));
    }
  }
}
