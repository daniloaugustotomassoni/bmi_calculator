import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrentPreference {
  static SharedPreferences? preferences;

  static open() async {
    preferences = await SharedPreferences.getInstance();
  }

  static setName(String name) async {
    await open();
    await preferences?.setString('name', name);
  }

  static setAge(int age) async {
    await open();
    await preferences?.setInt('age',age);
  }
  static setGender(String gender) async {
    await open();
    await preferences?.setString('gender', gender);
  }

  static setWeight(double weight) async {
    await open();
    await preferences?.setDouble('weight', weight);
  }

  static setHeight(double height) async {
    await open();
    await preferences?.setDouble('height', height);
  }

  static setBmi(double bmi) async {
    await open();
    await preferences?.setDouble('bmi', bmi);
  }
  static setCategory(String category) async {
    await open();
    await preferences?.setString('category',category);
  }
  static setColor(int color) async {
    await open();
    await preferences?.setInt('color',color);
  }
  static setGenderAsset(String asset) async {
    await open();
    await preferences?.setString('asset',asset);
  }
  static setBannerState(String state) async {
    await open();
    await preferences?.setString('state',state);
  }
  static Future<String> getName() async {
    await open();
    return preferences?.getString('name') ?? 'PERSON';
  }

  static Future<int> getAge() async{
    await open();
    return preferences?.getInt('age')?? 0;
  }
  static Future<int> getColor() async{
    await open();
    return preferences?.getInt('color')?? Colors.lightBlueAccent.value;
  }
  static Future<String> getGender() async {
    await open();
    return preferences?.getString('gender') ?? 'MASCULINO';
  }
  static Future<double> getWeight() async {
    await open();
    return preferences?.getDouble('weight') ?? 0;
  }

  static Future<double> getHeight() async {
    await open();
    return preferences?.getDouble('height') ?? 0;
  }

  static Future<double> getBmi() async {
    await open();
    return preferences?.getDouble('bmi') ?? 0;
  }
  static Future<String> getGenderAsset() async {
    await open();
    return preferences?.getString('asset') ?? 'assets/man_body_0.png';
  }
  static Future<String> getBannerState() async {
    await open();
    return preferences?.getString('state') ?? 'assets/category_0.png';
  }
  static Future<String> getCategory() async {
    await open();
    return preferences?.getString('category') ?? 'ABAIXO DO PESO';
  }
}
