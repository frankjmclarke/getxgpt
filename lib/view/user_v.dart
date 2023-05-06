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
          GetX<UserViewModel>(          //  Getx allows init, dispose etc, uses more ram
            builder: (controller) => TextField(
              controller: TextEditingController(text: controller.name),
              onChanged: (txt){
                controller.name =  txt;
              },
              onTapOutside: (xx) {
                //userViewModel.name =  controller.name;
                userViewModel.setNameFromString(controller.name);
                //userViewModel.setNameFromString( controller.name);
              },
              decoration: const InputDecoration(hintText: 'Name'),
            ),
          ),
          Obx(() => TextField(
            controller: TextEditingController(text: userViewModel.age.toString()),
            onChanged: (text) => userViewModel.age= int.tryParse(text) ?? 0,
            onTapOutside: (text) {

              userViewModel.setAgeFromInt( userViewModel.age);

            },
            decoration: const InputDecoration(
              labelText: 'Enter age',
            ),
          )),
          const SizedBox(height: 20),
          Obx(() {
            return Text('Age: ${userViewModel.age}');
          }),
          Obx(() {
            return Text('Name: ${Get.find<UserViewModel>().user.value.name}');
          }),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: userViewModel.saveUser,
            child: const Text('Save'),
          )
        ],
      ),
    );
  }
}
