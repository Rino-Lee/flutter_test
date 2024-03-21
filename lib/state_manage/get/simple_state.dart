import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SimpleController extends GetxController {
  int count = 0;

  void increase() {
    count++;
    // 해당 변수를 가지고 있는 모든 곳에 값 update
    update();
  }
}

class SimpleGetPage extends StatelessWidget {
  SimpleGetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SimpleController());
    return Scaffold(
      appBar: AppBar(
        title: Text("단순 상태관리"),
      ),
      body: Center(
        child: GetBuilder<SimpleController>(
          builder: (controller) {
            return ElevatedButton(
                onPressed: () {
                  controller.increase();
                },
                child: Text('현재 숫자: ${controller.count}'));
          },
        ),
      ),
    );
  }
}
