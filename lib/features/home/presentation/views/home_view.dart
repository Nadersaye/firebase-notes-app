import 'package:flutter/material.dart';
import 'widgets/home widgets/custom_home_appbar.dart';
import 'widgets/home widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customHomeAppbar(context),
      body: const HomeViewBody(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed("addfolder");
          }),
    );
  }
}
