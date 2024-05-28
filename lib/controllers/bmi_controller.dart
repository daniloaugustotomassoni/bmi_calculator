import 'package:bmi_calculator/preferences/current_preference.dart';
import 'package:flutter/material.dart';
import '../models/person_model.dart';

class BmiController extends ChangeNotifier {
  PersonModel person;

  BmiController(this.person);

  calculator() {
    person.bmi = (person.weight * 10000) / (person.height * person.height);
    if (person.bmi.isNaN || person.bmi.isInfinite) {
      person.bmi = 0;
    }
    if (person.bmi < 18.9) {
      person.category = 'ABAIXO DO PESO';
      person.color = Colors.lightBlueAccent;
      person.bannerState = 'assets/category_0.png';
    }
    if (person.bmi > 18.9 && person.bmi < 24.9) {
      person.category = 'NORMAL';
      person.color = Colors.lightGreenAccent;
      person.bannerState = 'assets/category_1.png';
    }
    if (person.bmi > 24.9 && person.bmi < 29.9) {
      person.category = 'SOBREPESO';
      person.color = Colors.deepOrangeAccent;
      person.bannerState = 'assets/category_2.png';
    }
    if (person.bmi > 29.9 && person.bmi < 34.9) {
      person.category = 'OBESO';
      person.color = Colors.redAccent;
      person.bannerState = 'assets/category_3.png';
    }
    if (person.bmi > 34.9) {
      person.category = 'OBESIDADE MORBIDA';
      person.color = Colors.purple;
      person.bannerState = 'assets/category_4.png';
    }
    setGenderAsset(person.gender);
    CurrentPreference.setBmi(person.bmi);
    CurrentPreference.setCategory(person.category);
    CurrentPreference.setBannerState(person.bannerState);
    CurrentPreference.setColor(person.color.value);
    CurrentPreference.setGenderAsset(person.genderAsset);
    notifyListeners();
  }

  setGenderAsset(String value) {
    if (person.bmi < 18.9) {
      if (value.contains('MASCULINO')){
        person.genderAsset = 'assets/man_body_0.png';
      }else{
        person.genderAsset = 'assets/female_body_0.png';
      }


    }
    if (person.bmi > 18.9 && person.bmi < 24.9) {
      if (value.contains('MASCULINO')){
        person.genderAsset = 'assets/man_body_1.png';
      }else{
        person.genderAsset = 'assets/female_body_1.png';
      }
    }
    if (person.bmi > 24.9 && person.bmi < 29.9) {
      if (value.contains('MASCULINO')){
        person.genderAsset = 'assets/man_body_2.png';
      }else{
        person.genderAsset = 'assets/female_body_2.png';
      }
    }
    if (person.bmi > 29.9 && person.bmi < 34.9) {
      if (value.contains('MASCULINO')){
        person.genderAsset = 'assets/man_body_3.png';
      }else{
        person.genderAsset = 'assets/female_body_3.png';
      }
    }
    if (person.bmi > 34.9) {
      if (value.contains('MASCULINO')){
        person.genderAsset = 'assets/man_body_4.png';
      }else{
        person.genderAsset = 'assets/female_body_4.png';
      }
    }
    notifyListeners();
  }

  setWeightValue(double value) {
    person.weight = value;
    CurrentPreference.setWeight(value);
    calculator();
  }

  setHeightValue(double value) {
    person.height = value;
    CurrentPreference.setHeight(value);
    calculator();
  }

  setAge(int value) {
    person.age = value;
    CurrentPreference.setAge(value);
    notifyListeners();
  }

  setGender(String value) {
    person.gender = value;
    notifyListeners();
  }
  setName(String value){
    person.name = value.toUpperCase();
    notifyListeners();
  }
}
