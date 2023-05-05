

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CounterController extends GetxController {
  var _count = 0.obs;

  increment() => _count.value++;

  get count => _count.value;
}

class CounterView extends StatelessWidget {
  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('Count: ${counterController.count}')),
            ElevatedButton(
              onPressed: counterController.increment,
              child: Text('Increment'),
            )
          ],
        ),
      ),
    );
  }
}
