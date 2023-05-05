import 'package:get/get.dart';
import '../model/user.dart';

class UserViewModel {
  final user = User(name: '', age: 0).obs;

  String get name => user.value.name;
  set name(String value) => user.update((val) => val!.name = value);

  int get age => user.value.age;
  set age(int value) => user.update((val) => val!.age = value);

  void setAgeFromString(String value) {
    user.update((val) => val!.age = int.tryParse(value) ?? 0);
  }

  void saveUser() {
    user.update((val) {
      val!.name = 'saved';
      val.age = 123;
    });
  }
}
