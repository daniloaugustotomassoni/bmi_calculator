import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/others/display.dart';
import 'package:flutter/material.dart';

class AgeWidget extends StatefulWidget {
  final BmiController bmiController;

  const AgeWidget({super.key, required this.bmiController});

  @override
  State<AgeWidget> createState() => _AgeWidgetState();
}

class _AgeWidgetState extends State<AgeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController(initialPage: widget.bmiController.person.age,viewportFraction: .2);
    currentPage = widget.bmiController.person.age;
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));

    pageController.addListener(
      () {
        setState(() {
          currentPage = pageController.page!.round();
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: Display.getHeight(context) * .1,
      child: PageView.builder(
        controller: pageController,
        itemCount: 100,
        onPageChanged: (page) {
          widget.bmiController.setAge(page);
        },
        itemBuilder: (_, index) {
          double opacity = currentPage == index ? 1 : .3;
          double top = currentPage == index ? 5 : 30;
          double bottom = currentPage == index ? 5 : 30;
          return AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(milliseconds: 500),
            child: AnimatedContainer(
              padding: const EdgeInsets.all(10),
              duration: const Duration(milliseconds: 600),
              margin: EdgeInsets.fromLTRB(5, top, 5, bottom),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 5,
                        offset: Offset(0, 5))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: FittedBox(
                      child: Text(
                        'IDADE',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, color: Colors.grey),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: FittedBox(
                      child: Text(
                        '$index',
                        style: const TextStyle(
                            fontSize: 48, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  @override
  void dispose() {
    pageController.dispose();
    animationController.dispose();
    super.dispose();
  }
}
