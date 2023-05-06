import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxgpt/view/user_v.dart';
import 'package:getxgpt/view/user_vm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(//remove Get if only using State Management GetX
      title: 'My App',
      home: UserView(),
      initialBinding: BindingsBuilder(() {
        Get.put(UserViewModel());
      }),
      theme: ThemeData(
          primaryColor: Colors.purple,
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: Colors.purpleAccent)),
    );
  }
}
