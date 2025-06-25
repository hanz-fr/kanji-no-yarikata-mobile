/* Define the Dog Model */
import '../../domain/entities/inu.dart';

class DogModel extends Dog {
  DogModel({required super.id, required super.name, required super.age});

  factory DogModel.fromMap(Map<String, dynamic> map) {
    return DogModel(
      id: map['id'],
      name: map['name'],
      age: map['age'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }
}
