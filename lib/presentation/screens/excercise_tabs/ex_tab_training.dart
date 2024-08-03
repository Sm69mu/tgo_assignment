import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tgo_assignment/presentation/screens/excersice_screen.dart';
import 'package:tgo_assignment/presentation/widgets/excersice_tile.dart';
import 'package:tgo_assignment/providers/excercise_provider.dart';
import 'package:provider/provider.dart';

class TraingPage extends StatefulWidget {
  const TraingPage({super.key});

  @override
  State<TraingPage> createState() => _TraingPageState();
}

class _TraingPageState extends State<TraingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CupertinoPageScaffold(
        backgroundColor: Colors.white.withOpacity(0.8),
        child: Column(
          children: [
            Expanded(
              child: Consumer<ExerciseProvider>(
                builder: (context, value, child) {
                  if (value.addedExcercises.isEmpty) {
                    return const Center(child: Text("No exercises Added"));
                  } else {
                    return ListView.builder(itemBuilder: (context, index) {
                      return ExcersiceTile(
                          title: value.addedExcercises[index].title,
                          image: value.addedExcercises[index].coverImage,
                          ontap: () {
                            context
                                .read<ExerciseProvider>()
                                .removeExcersise(value.addedExcercises);
                          },
                          icon: Icons.cancel);
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
