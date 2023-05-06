import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxgpt/view/user_vm.dart';

/*
we're using Obx(() to bind the age observable variable to the TextField. When
the age value changes, the TextField will be updated automatically.
Note that we're not using Obx(() for the name variable because TextField already
rebuilds itself when its value changes.
 */

class UserView extends StatelessWidget {
  final UserViewModel userViewModel = Get.put(UserViewModel());

  UserView({super.key});

  void submitText(String text) {
    // Do something with the text, such as save it to a database or display it in a UI element
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: Column(
        children: [
          Obx(() => TextField(
            controller: TextEditingController(text: userViewModel.name),
            onChanged: (value) => userViewModel.name = value,
            decoration: const InputDecoration(hintText: 'Name'),
          )),
          Obx(() => TextField(
            controller: TextEditingController(text: userViewModel.age.toString()),
            onChanged: (text) => userViewModel.setAgeFromString(text),
            decoration: const InputDecoration(
              labelText: 'Enter age',
            ),
          )),
          ElevatedButton(
            onPressed: userViewModel.saveUser,
            child: const Text('Save'),
          )
        ],
      ),
    );
  }
}
