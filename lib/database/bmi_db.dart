import 'package:bmi_calculator/models/person_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class BmiDb {
  static const String dbName = 'bmi.db';
  static const int version = 1;
  static Database? database;

  static Future<void> open() async {
    database ??= await openDatabase(join(await getDatabasesPath(), dbName),
        onCreate: (db, v) {
      db.execute(
          'CREATE TABLE history(key INTEGER PRIMARY KEY AUTOINCREMENT, uuid TEXT, name TEXT, age INTEGER, gender TEXT, weight DOUBLE, height DOUBLE, bmi DOUBLE, category TEXT, date TEXT, color INTEGER, genderAsset TEXT, bannerState TEXT)');
    }, version: version);
    return;
  }

  static Future<void> insert(PersonModel person) async {
    await open();
    database?.insert('history', person.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return;
  }

  static Future<List<PersonModel>> getList() async {
    await open();
    List<PersonModel> list = [];
    database?.query('history').then(
      (data) {
        for (var e in data) {
          PersonModel personModel = PersonModel(
            e['uuid'].toString() ?? '',
            e['name'].toString() ?? '',
            int.parse(e['age'].toString()) ?? 0,
            e['uuid'].toString() ?? '',
            double.parse(e['weight'].toString()) ?? 0,
            double.parse(e['height'].toString()) ?? 0,
            double.parse(e['bmi'].toString()) ?? 0,
            e['category'].toString() ?? '',
            e['date'].toString() ?? '',
            Color(int.parse(e['color'].toString()) ?? 0),
            e['genderAsset'].toString() ?? '',
              e['bannerState'].toString() ?? '',

          );
          list.add(personModel);
        }
        return list;
      },
      onError: (error) {
        debugPrint('error');
      },
    );
    return list;
  }
}
