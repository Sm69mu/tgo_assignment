import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tgo_assignment/presentation/widgets/excersice_tile.dart';

import '../../providers/excercise_provider.dart';

class ExcersiceScreen extends StatefulWidget {
  const ExcersiceScreen({super.key});

  @override
  State<ExcersiceScreen> createState() => _ExcersiceScreenState();
}

class _ExcersiceScreenState extends State<ExcersiceScreen> {
  final ScrollController scrollController = ScrollController();
  int page = 1;

  Future<void> _onRefresh() async {
    context.read<ExerciseProvider>().refresh();
  }

  void onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      log('Reached the bottom');
      context.read<ExerciseProvider>().getExercisesList();
    } else {
      log("nothing");
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<ExerciseProvider>().getExercisesList();
    scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CupertinoPageScaffold(
        backgroundColor: Colors.white.withOpacity(0.8),
        navigationBar: CupertinoNavigationBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(CupertinoIcons.back),
          ),
          middle: const Text("Add Excersices"),
          trailing: const Icon(
            CupertinoIcons.info,
            size: 25,
          ),
        ),
        child: Consumer<ExerciseProvider>(
          builder: (context, value, child) {
            return RefreshIndicator(
              onRefresh: _onRefresh,
              child: value.isloading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 237, 128, 26),
                      ),
                    )
                  : ListView.builder(
                      itemCount: value.exercises.length + 1,
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        if (index < value.exercises.length) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ExcersiceTile(
                              icon: CupertinoIcons.add,
                              ontap: () {
                                context
                                    .read<ExerciseProvider>()
                                    .adExcersices(value.exercises);
                              },
                              image: value.exercises[index].coverImage,
                              title: value.exercises[index].title,
                            ),
                          );
                        } else {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 20),
                              child: CircularProgressIndicator(
                                color: Color.fromARGB(255, 237, 128, 26),
                              ),
                            ),
                          );
                        }
                      },
                    ),
            );
          },
        ),
      ),
    );
  }
}
