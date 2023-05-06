import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getxgpt/model/user.dart';

class UserViewModel extends GetxController {
  final user = User(name: '', age: 0).obs;

  String get name => user.value.name;
  set name(String value) => user.update((u) => u?.name = value);

  int get age => user.value.age;
  set age(int value) => user.update((u) => u?.age = value);
  /*
  set name(String value) => user.value = user.value.copyWith(name: value);
  set age(int value) => user.value = user.value.copyWith(age: value);
   */

  void setAgeFromString(String text) {
    age = int.tryParse(text) ?? 0;
    name="SSSSSSSSSSSSSSS";
    //user.value = User(name: 'SSSSSSSSS', age: age);//you have to update the whole thing
    update(); // add this line to trigger rebuild
  }

  void saveUser() {
    user.value = User(name: 'Wod', age: 10);
    update(); // add this line to trigger rebuild
  }
}
