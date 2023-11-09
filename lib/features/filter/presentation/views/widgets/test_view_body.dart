import 'package:flutter/material.dart';

import '../../../data/models/user_model.dart';
import 'custom_listview.dart';

class TestViewBody extends StatelessWidget {
  const TestViewBody({super.key, required this.usersData});
  final List<UserModel> usersData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CustomListview(
        usersData: usersData,
      ),
    );
  }
}
