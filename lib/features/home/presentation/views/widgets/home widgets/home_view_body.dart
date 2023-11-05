import 'package:firebase_training/features/auth/presentation/views/widgets/custom_awesome_dialog.dart';
import 'package:firebase_training/features/home/presentation/manager/get%20category%20cubit/get_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'gridview_folders_item.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<GetCategoryCubit>(context).getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetCategoryCubit, GetCategoryState>(
      listener: (context, state) {
        if (state is GetCategoryFailure) {
          customAwesomeDialog(
              context: context,
              titleText: 'Error',
              contentText: state.error,
              color: Colors.red);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
            itemCount:
                BlocProvider.of<GetCategoryCubit>(context).categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                mainAxisExtent: 160),
            itemBuilder: (BuildContext context, int index) {
              if (index <
                  BlocProvider.of<GetCategoryCubit>(context)
                      .categories
                      .length) {
                return GridViewFolderItem(
                  title: BlocProvider.of<GetCategoryCubit>(context)
                      .categories[index]['name'],
                );
              } else {
                return null; // or return a fallback widget if needed
              }
            },
          ),
        );
      },
    );
  }
}
