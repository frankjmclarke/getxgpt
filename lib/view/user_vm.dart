import 'package:get/get.dart';


class UserViewModel {
  final RxString _name;
  final RxInt _age;

  UserViewModel({String name = '', int age = 0})
      : _name = name.obs,
        _age = age.obs;

  String get name => _name.value;
  set name(String value) => _name.value = value;

  int get age => _age.value;
  set age(int value) => _age.value = value;

  void setAgeFromString(String value) {
    _age.value = int.tryParse(value) ?? 0;
  }

  void saveUser() {
    _name.value = 'saved';
    _age.value = 123;
  }
}
