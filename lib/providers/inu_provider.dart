import 'package:flutter/material.dart';
import '../domain/entities/inu.dart';
import '../domain/repositories/inu_repository.dart';

class DogProvider extends ChangeNotifier {
  final DogRepository repository;

  DogProvider({required this.repository});

  List<Dog> dogs = [];

  Future<void> loadDogs() async {
    dogs = await repository.dogs();
    notifyListeners();
  }

  Future<void> addDog(Dog dog) async {
    await repository.insertDog(dog);
    await loadDogs();
  }
}