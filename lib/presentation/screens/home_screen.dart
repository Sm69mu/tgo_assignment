import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tgo_assignment/presentation/screens/excercise_tabs/ex_tab_cooldown.dart';
import 'package:tgo_assignment/presentation/screens/excercise_tabs/ex_tab_training.dart';
import 'package:tgo_assignment/presentation/screens/excercise_tabs/ex_tab_warmup.dart';
import 'package:tgo_assignment/presentation/screens/excersice_screen.dart';
import 'package:tgo_assignment/presentation/widgets/excersice_tile.dart';
import 'package:tgo_assignment/providers/excercise_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CupertinoPageScaffold(
        backgroundColor: Colors.white.withOpacity(0.8),
        navigationBar: const CupertinoNavigationBar(
          middle: Text("Excercises"),
          trailing: Icon(
            CupertinoIcons.info,
            size: 25,
          ),
        ),
        child: Column(
          children: [
            Expanded(child: PageView.builder(itemBuilder: (context, index) {
              PageView(
                controller: PageController(initialPage: 1),
                children: const [
                  WarmuPage(),
                  TraingPage(),
                  CooldownPage(),
                ],
              );
            })),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CupertinoButton.filled(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Add Excersices"),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.add,
                color: Colors.white,
              )
            ],
          ),
          onPressed: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => const ExcersiceScreen()));
          }),
    );
  }
}
