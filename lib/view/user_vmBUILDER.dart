import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getxgpt/model/user.dart';
/*
Here we're using a regular User object instead of an observable. Instead of
updating the observable value using the update() method, we're simply updating
the name and age properties of the User object directly, and then calling
update() to trigger a rebuild.
 */
class UserViewModel extends GetxController {
  final user = User(name: '', age: 0);

  String get name => user.name;
  set name(String value) => user.name = value;

  int get age => user.age;
  set age(int value) => user.age = value;

  void setAgeFromString(String text) {
    age = int.tryParse(text) ?? 0;
    name = "SSSSSSSSSSSSSSS";
    update(); // add this line to trigger rebuild
  }

  void saveUser() {
    user.name = 'Wod';
    user.age = 10;
    update(); // add this line to trigger rebuild
  }
}
