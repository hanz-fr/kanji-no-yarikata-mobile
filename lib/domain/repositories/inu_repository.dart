import '../entities/inu.dart';

abstract class DogRepository {
  Future<void> insertDog(Dog dog);
  Future<List<Dog>> dogs();
}