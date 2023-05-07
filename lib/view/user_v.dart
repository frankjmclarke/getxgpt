import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxgpt/view/user_v.dart';
import 'package:getxgpt/view/user_vm.dart';

class UserView extends StatelessWidget {
  final UserViewModel userViewModel = Get.put(UserViewModel());

  UserView({Key? key}) : super(key: key);

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
          Obx(() => Text("Name entered: ${userViewModel.name}")),
          const SizedBox(height: 16),
          Obx(() => Text("Number entered: ${userViewModel.age ?? "0"}")),

          ElevatedButton(
            onPressed: userViewModel.saveUser,
            child: const Text('Save'),
          )
        ],
      ),
    );
  }
}
