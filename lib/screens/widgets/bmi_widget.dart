import 'dart:ui';

import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/others/display.dart';
import 'package:flutter/material.dart';

class BmiWidget extends StatefulWidget {
  final BmiController bmiController;

  const BmiWidget({super.key, required this.bmiController});

  @override
  State<BmiWidget> createState() => _BmiWidgetState();
}

class _BmiWidgetState extends State<BmiWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1400));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(10),
      height: Display.getHeight(context) * .2,
      width: Display.getWidth(context),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius:  BorderRadius.all(Radius.circular(16)),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: FittedBox(
                    child: Text(
                      widget.bmiController.person.bmi.toStringAsFixed(2),
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
