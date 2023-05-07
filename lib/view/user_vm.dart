import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getxgpt/model/user.dart';

class UserViewModel extends GetxController {
  final user = User(name: '', age: 0).obs;
  final _textController = TextEditingController().obs;
  final _numController = TextEditingController().obs;

  TextEditingController get textController => _textController.value;
  TextEditingController get numController => _numController.value;
  String get name => user.value.name; // added getter for name
  int get age => user.value.age; // added getter for name

  @override
  void onInit() {
    super.onInit();
    _textController.value.text = user.value.name;
    _numController.value.text = user.value.age.toString();
  }

  void setName(String name) {
    user.update((val) {
      val?.name = name;
    });
  }

  void setAgeFromString(String ageString) {
    int age = int.tryParse(ageString) ?? 0;
    user.update((val) {
      val?.age = age;
    });
  }

  void saveUser() {
    print('Saving user: ${user.value.name}, ${user.value.age}');
  }
}
