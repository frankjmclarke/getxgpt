import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxgpt/view/user_vm.dart';

/*
On Update() is needed to update the UI
GetX is still more economical than any other reactive state manager, but it
consumes a little more RAM than GetBuilder. GetBuilder has the most simplistic
approach that exists, of storing a widget's hashcode and its StateSetter
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
