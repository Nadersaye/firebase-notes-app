import 'package:flutter/material.dart';

class GridViewNoteItem extends StatelessWidget {
  const GridViewNoteItem({super.key, required this.title, this.onLongPress});
  final String title;
  final void Function()? onLongPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [Text(title)],
          ),
        ),
      ),
    );
  }
}
