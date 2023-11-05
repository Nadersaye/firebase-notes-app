import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_training/core/constants.dart';
import 'package:firebase_training/core/widgets/custom_awesome_dialog.dart';
import 'package:firebase_training/core/widgets/custom_toast.dart';
import 'package:firebase_training/features/home/presentation/manager/delete%20category%20cubit/delete_category_cubit.dart';
import 'package:firebase_training/features/home/presentation/manager/get%20category%20cubit/get_category_cubit.dart';
import 'package:firebase_training/features/home/presentation/manager/sign%20out%20cubit/sign_out_cubit.dart';
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
        return BlocConsumer<DeleteCategoryCubit, DeleteCategoryState>(
          listener: (deleteContext, deleteState) {
            if (deleteState is DeleteCategorySuccess) {
              //Navigator.of(context).pop;
              customToast(message: 'Deleting item seccessfully');
            } else if (deleteState is DeleteCategoryFailure) {
              customAwesomeDialog(
                  context: context,
                  titleText: 'Error',
                  contentText:
                      'Error occured when try to delete item,try again');
            }
          },
          builder: (deleteContext, deleteState) {
            return BlocConsumer<SignOutCubit, SignOutState>(
              listener: (signOutContext, signOutState) {
                if (signOutState is SignOutSuccess) {
                  customToast(message: 'Successfully sign out');
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("login", (route) => false);
                  googleLogin = false;
                } else if (signOutState is SignOutFailure) {
                  customAwesomeDialog(
                      context: context,
                      titleText: 'Error',
                      contentText: signOutState.errorMessage);
                }
              },
              builder: (signOutContext, signOutState) {
                return deleteState is DeleteCategoryLoading ||
                        state is GetCategoryLoading ||
                        signOutState is SignOutLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GridView.builder(
                          itemCount: BlocProvider.of<GetCategoryCubit>(context)
                              .categories
                              .length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
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
                                title:
                                    BlocProvider.of<GetCategoryCubit>(context)
                                        .categories[index]['name'],
                                onLongPress: () {
                                  customAwesomeDialog(
                                      context: context,
                                      titleText: 'question',
                                      contentText:
                                          'Are you sure you want to delete it?',
                                      dialogType: DialogType.question,
                                      color: Colors.green,
                                      btnOkOnPress: () {
                                        BlocProvider.of<DeleteCategoryCubit>(
                                                context)
                                            .deleteCategory(BlocProvider.of<
                                                    GetCategoryCubit>(context)
                                                .categories[index]
                                                .id);
                                        BlocProvider.of<GetCategoryCubit>(
                                                context)
                                            .getCategory();
                                      },
                                      btnCancelOnPress: () =>
                                          Navigator.of(context).pop());
                                },
                              );
                            } else {
                              return null; // or return a fallback widget if needed
                            }
                          },
                        ),
                      );
              },
            );
          },
        );
      },
    );
  }
}
