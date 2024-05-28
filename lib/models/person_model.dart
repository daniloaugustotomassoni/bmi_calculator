import 'dart:ui';

class PersonModel {
  String uuid;
  String name;
  int age;
  String gender;
  double weight;
  double height;
  double bmi;
  String category;
  String date;
  Color color;
  String genderAsset;
  String bannerState;

  PersonModel(
    this.uuid,
    this.name,
    this.age,
    this.gender,
    this.weight,
    this.height,
    this.bmi,
    this.category,
    this.date,
    this.color,
    this.genderAsset,
    this.bannerState,
  );

  Map<String, dynamic> toMap() => {
        'uuid': uuid,
        'name': name,
        'age': age,
        'gender': gender,
        'weight': weight,
        'height': height,
        'bmi': bmi,
        'category': category,
        'date': date,
        'color': color.value,
        'genderAsset': genderAsset,
        'bannerState': bannerState,
      };

  factory PersonModel.fromToMap(Map<String, dynamic> map) => PersonModel(
        map['uuid'],
        map['name'],
        map['age'],
        map['gender'],
        map['weight'],
        map['weight'],
        map['bmi'],
        map['category'],
        map['date'],
        map['color'],
        map['genderAsset'],
        map['bannerState'],
      );

  @override
  String toString() {
    return 'PersonModel{uuid: $uuid, name: $name, age: $age, gender: $gender, weight: $weight, height: $height, bmi: $bmi, category: $category, date: $date, color: $color, genderAsset: $genderAsset, bannerState: $bannerState}';
  }
}
