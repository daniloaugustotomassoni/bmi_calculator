import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HeightWidget extends StatefulWidget {
  final BmiController bmiController;

  const HeightWidget({super.key, required this.bmiController});

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onLongPress: () {
          HapticFeedback.vibrate();
          showAdaptiveDialog(
              context: context, builder: (context) => _buildEdit());
        },
        child: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, blurRadius: 5, offset: Offset(0, 5))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                child: const FittedBox(
                  child: Text(
                    'ALTURA (cm)',
                    style: TextStyle(
                        fontWeight: FontWeight.w900, color: Colors.grey),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      tooltip: 'REMOVE - 1',
                      onPressed: () {
                        if (widget.bmiController.person.height > 0) {
                          HapticFeedback.heavyImpact();
                          animationController.forward(from: 0);
                          widget.bmiController.setHeightValue(
                              widget.bmiController.person.height - 1);
                        }
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_outlined)),
                  FittedBox(
                    child: Text(
                      widget.bmiController.person.height.toStringAsFixed(0),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ).animate(controller: animationController).move().fade(),
                  ),
                  IconButton(
                      tooltip: 'ADICIONA + 1',
                      onPressed: () {
                        if (widget.bmiController.person.height < 200) {
                          HapticFeedback.heavyImpact();
                          animationController.forward(from: 0);
                          widget.bmiController.setHeightValue(
                              widget.bmiController.person.height + 1);
                        }
                      },
                      icon: const Icon(Icons.arrow_forward_ios_outlined))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEdit() {
    textEditingController.text =
        widget.bmiController.person.height.toStringAsFixed(0);
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: TextField(
          autofocus: true,
          maxLength: 3,
          maxLines: 1,
          controller: textEditingController,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w900),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2),
            ),
            counterText: '',
            hintText: widget.bmiController.person.height.toStringAsFixed(0),
          ),
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              if (int.parse(value) >= 0 && int.parse(value) <= 200) {
                widget.bmiController.setHeightValue(double.parse(value));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.black,
                    content: Text(
                      'PESO NÃO PERMITIDO!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w900, color: Colors.redAccent),
                    ),
                  ),
                );
              }
            }
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
