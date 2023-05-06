import 'package:get/get.dart';
import 'package:getxgpt/model/user.dart';

class UserViewModel extends GetxController {
  final user = User(name: '', age: 0).obs;

  String get name => user.value.name;
  set name(String value) => user.value.name = value;
  set setText(String value) => user.value.name = value;

  int get age => user.value.age;
  set age(int value) => user.value.age = value;

  void setAgeFromString(String text) {
    //user.value.age = int.tryParse(text) ?? 0;
   // user.value.name = 'Jonny';
    user.update( (user) { // you have to use update for the class
      user?.name = 'Jonny';
      user?.age = int.tryParse(text) ?? 0;
    });

  }
  void setAgeFromInt(int num) {
    //user.value.age = int.tryParse(text) ?? 0;
    // user.value.name = 'Jonny';
    user.update( (user) { // you have to use update for the class
     // user?.name = 'Jonny';
      user?.age = num;
    });

  }
  void setNameFromString(String text) {
    user.update( (user) { // you have to use update for the class
      user?.name = text;
    });

  }

  void saveUser() {
    user.value = User(name: 'Wod', age: 10);
  }
}
