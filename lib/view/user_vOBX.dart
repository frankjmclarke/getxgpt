import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxgpt/view/user_vm.dart';

/*
Reactive - listens without need for update() (Mixin Builder is reactive + GetBuilder)
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
          //  Getx allows init, dispose etc, uses more ram
          GetX<UserViewModel>(
            //init: userViewModel,
            builder: (controller) => TextField(
              controller: userViewModel.textController,
              onChanged: (text) {
                userViewModel.textController?.value = TextEditingValue(
                  text: text,
                  selection: TextSelection.collapsed(offset: text.length),
                );
                userViewModel.setName(text);
              },
              decoration: const InputDecoration(hintText: 'Name'),
            ),
          ),
          const SizedBox(height: 20),
          Obx(() => TextField(
                controller: userViewModel.numController,
            onChanged: (text) {
              userViewModel.numController?.value = TextEditingValue(
                text: text,
                selection: TextSelection.collapsed(offset: text.length),
              );
              userViewModel.setAgeFromString(text);
            },
                decoration: const InputDecoration(
                  labelText: 'Enter age',
                ),
              )),
          const SizedBox(height: 16),
          Obx(() => Text("Name entered: ${userViewModel.textController.value.text}")),
          const SizedBox(height: 16),
          Obx(() => Text("Number entered: ${userViewModel.numController.value.text}")),
          ElevatedButton(
            onPressed: userViewModel.saveUser,
            child: const Text('Save'),
          )
        ],
      ),
    );
  }
}
