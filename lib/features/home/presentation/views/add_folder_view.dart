import 'package:flutter/material.dart';

class AddFolderView extends StatelessWidget {
  const AddFolderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add folder'),
        centerTitle: true,
      ),
      body: AddFolderViewBody(),
    );
  }
}
