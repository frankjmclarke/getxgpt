import 'package:get/get.dart';
import 'package:getxgpt/model/user.dart';

class UserViewModel extends GetxController {
  final user = User(name: '', age: 0).obs;

  String get name => user.value.name;

  set name(String value) => user.value.name = value;

  int get age => user.value.age;

  set age(int value) => user.value.age = value;

  void setAgeFromString(String text) {
    user.value.age = int.tryParse(text) ?? 0;
    user.update((val) {
      // you have to use update for the class
      val?.age = int.tryParse(text) ?? 0;
      val?.name = 'Jonny';
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void saveUser() {
    user.value = User(name: 'Wod', age: 10);
  }
}
