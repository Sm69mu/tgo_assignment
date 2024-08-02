import 'package:flutter/material.dart';
import 'package:tgo_assignment/models/excercise_response_model.dart';
import 'package:tgo_assignment/utils/mediaquaies.dart';

class ExcersiceTile extends StatelessWidget {
  final String title;
  final dynamic ontap;
  final String image;
  final dynamic icon;
  const ExcersiceTile({
    super.key,
    required this.title,
    required this.image,
   required this.ontap,
    required this.icon, Exercise? excercise,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: ScreenUtils.screenHeight(context) / 10,
        width: ScreenUtils.screenWidth(context) - 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white.withOpacity(0.7),
        ),
        child: ListTile(
          leading: Image.network(
            image,
            fit: BoxFit.contain,
          ),
          trailing: InkWell(
            borderRadius: BorderRadius.circular(9),
            splashColor: Colors.black.withOpacity(0.7),
            onTap: ontap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                border: Border.all(
                  color: const Color.fromARGB(255, 237, 128, 26),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  color: const Color.fromARGB(255, 237, 128, 26),
                  size: ScaleSize.textScaleFactor(context) * 20,
                ),
              ),
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
                fontSize: ScaleSize.textScaleFactor(context) * 14,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
