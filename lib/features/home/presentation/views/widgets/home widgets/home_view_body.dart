import 'package:flutter/material.dart';

import 'gridview_folders_item.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List<String> folders = ['general', 'sports'];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          mainAxisExtent: 160),
      itemBuilder: (BuildContext context, int index) {
        return GridViewFolderItem(
          title: folders[index],
        );
      },
    );
  }
}
