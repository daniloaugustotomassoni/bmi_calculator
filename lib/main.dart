import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/models/person_model.dart';
import 'package:bmi_calculator/others/display.dart';
import 'package:bmi_calculator/preferences/current_preference.dart';
import 'package:bmi_calculator/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() async {
  Display.uiMode();
  PersonModel personModel = PersonModel(
    '#1',
    await CurrentPreference.getName(),
    await CurrentPreference.getAge(),
    await CurrentPreference.getGender(),
    await CurrentPreference.getWeight(),
    await CurrentPreference.getHeight(),
    await CurrentPreference.getBmi(),
    await CurrentPreference.getCategory(),
    Display.getDate(),
    Color(await CurrentPreference.getColor()),
    await CurrentPreference.getGenderAsset(),
    await CurrentPreference.getBannerState(),
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => BmiController(personModel)),
    ],
    child: const BmiCalculator(),
  ));
}

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: 'BMI Calculator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3: true),
        home: Consumer<BmiController>(
          builder: (context, bmiController, child) => HomeScreen(
            bmiController: bmiController,
          ),
        ),
      ),
    );
  }
}
