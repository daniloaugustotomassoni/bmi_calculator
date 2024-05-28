import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/others/display.dart';
import 'package:bmi_calculator/preferences/current_preference.dart';
import 'package:bmi_calculator/screens/widgets/age_widget.dart';
import 'package:bmi_calculator/screens/widgets/bmi_widget.dart';
import 'package:bmi_calculator/screens/widgets/gender_widget.dart';
import 'package:bmi_calculator/screens/widgets/height_widget.dart';
import 'package:bmi_calculator/screens/widgets/weight_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  final BmiController bmiController;

  const HomeScreen({super.key, required this.bmiController});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onLongPress: () {
            HapticFeedback.lightImpact();
            showAdaptiveDialog(
              context: context,
              builder: (_) => Dialog(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    autofocus: true,
                    controller: textEditingController,
                    maxLines: 1,
                    maxLength: 24,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: widget.bmiController.person.name,
                      counterText: '',
                      focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 2))
                    ),
                    onSubmitted: (value){
                      if(value.isNotEmpty){
                        widget.bmiController.setName(value);
                        CurrentPreference.setName(value.toUpperCase());
                        Navigator.of(context).pop();
                      }
                    },
                  ),

                ),
              ),
            );
          },
          child: Text(
            widget.bmiController.person.name,
            style: const TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.bmiController.person.genderAsset),
                alignment: Alignment.topCenter),
          ),
          child: Column(
            children: [
              BmiWidget(bmiController: widget.bmiController),
              GenderWidget(bmiController: widget.bmiController),
              AgeWidget(bmiController: widget.bmiController),
              Row(
                children: [
                  WeightWidget(
                    bmiController: widget.bmiController,
                  ),
                  HeightWidget(
                    bmiController: widget.bmiController,
                  ),
                ],
              ),
              Container(
                width: Display.getWidth(context),
                height: Display.getHeight(context) * .3,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage(widget.bmiController.person.bannerState),
                      opacity: .3),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          widget.bmiController.person.category,
                          style: TextStyle(
                            color: widget.bmiController.person.color,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
