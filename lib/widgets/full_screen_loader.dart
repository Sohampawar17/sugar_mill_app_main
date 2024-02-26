import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sugar_mill_app/constants.dart';

Widget fullScreenLoader(
    {required bool loader,
    required Widget child,
    required BuildContext context}) {
  return Stack(
    children: [
      child,
      loader == true
          ? Container(
              height: getHeight(context),
              width: getWidth(context),
              color: lightBlack,
              child: Center(
                child: LoadingAnimationWidget.discreteCircle(
                    color: Colors.white,
                    size: 150,
                    secondRingColor: Colors.blue,
                    thirdRingColor: Colors.lightBlue),
              ),
            )
          : Container(),
    ],
  );
}
