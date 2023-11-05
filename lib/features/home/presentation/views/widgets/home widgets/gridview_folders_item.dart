import 'package:firebase_training/core/constants.dart';
import 'package:flutter/material.dart';

class GridViewFolderItem extends StatelessWidget {
  const GridViewFolderItem({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        children: [
          Image.asset(
            folderLogo,
            height: 100,
          ),
          Text(title)
        ],
      ),
    );
  }
}
