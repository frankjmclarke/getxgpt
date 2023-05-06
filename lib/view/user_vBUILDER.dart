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

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  UserView({super.key});

  @override
  Widget build(BuildContext context) {
    nameController.text = userViewModel.name;
    ageController.text = userViewModel.age.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: Column(
        children: [
          GetBuilder<UserViewModel>(
            builder: (controller) => TextField(
              controller: nameController,
              onChanged: (text) => controller.name = text,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
          ),
          GetBuilder<UserViewModel>(
            builder: (controller) => TextField(
              controller: ageController,
              onChanged: (text) => controller.setAgeFromString(text),
              decoration: const InputDecoration(
                labelText: 'Enter age',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: userViewModel.saveUser,
            child: const Text('Save'),
          )
        ],
      ),
    );
  }
}
