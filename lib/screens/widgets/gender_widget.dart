import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/preferences/current_preference.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class GenderWidget extends StatefulWidget {
  final BmiController bmiController;

  const GenderWidget({super.key, required this.bmiController});

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool isGender = true;

  @override
  void initState() {
    isGender = widget.bmiController.person.gender.contains('MASCULINO')? true:false;
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          isGender ? 'MASCULINO' : 'FEMININO',
          style: const TextStyle(fontWeight: FontWeight.w900),
        ).animate(controller: animationController).flip().fade(),
        Icon(
          isGender ? FontAwesomeIcons.mars : FontAwesomeIcons.venus,
        ).animate(controller: animationController).scale().fade(),
        Switch(
          value: isGender,
          activeColor: Colors.lightBlueAccent,
          inactiveTrackColor: Colors.pinkAccent,
          thumbColor: WidgetStateProperty.all(Colors.black),
          trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
          onChanged: (value) {
            animationController.forward(from: 0);
            setState(() {
              isGender = value;
              widget.bmiController.setGender(isGender?'MASCULINO':'FEMININO');
              widget.bmiController.setGenderAsset(isGender?'MASCULINO':'FEMININO');
              CurrentPreference.setGender(isGender?'MASCULINO':'FEMININO');
              CurrentPreference.setGenderAsset(widget.bmiController.person.genderAsset);
            });
          },
        ),
      ],
    );
  }
}
