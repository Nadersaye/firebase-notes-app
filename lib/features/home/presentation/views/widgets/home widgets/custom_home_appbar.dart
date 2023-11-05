import 'package:firebase_training/features/home/presentation/manager/sign%20out%20cubit/sign_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBar customHomeAppbar(BuildContext context) {
  return AppBar(
    title: const Text('Firebase install'),
    centerTitle: true,
    actions: [
      IconButton(
          onPressed: () {
            BlocProvider.of<SignOutCubit>(context).signOut();
          },
          icon: const Icon(Icons.exit_to_app))
    ],
  );
}
