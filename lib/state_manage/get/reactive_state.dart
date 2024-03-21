import 'package:flutter/material.dart';
import 'package:flutter_jjigmuck/state_manage/get/simple_state.dart';
import 'package:get/get.dart';

class ReactiveController extends GetxController {
  static ReactiveController get to => Get.find();
  RxInt count = 0.obs;

  void increase() {
    count++;
  }
}

class ReactivePage extends StatelessWidget {
  ReactivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SimpleController());
    Get.put(ReactiveController()); // 반응형 상태 관리 controller 등록
    return Scaffold(
      appBar: AppBar(
        title: const Text("단순 / 반응형 상태관리"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<SimpleController>(
              // 단순 상태 관리
              builder: (controller) {
                return ElevatedButton(
                  child: Text(
                    '[단순]현재 숫자: ${controller.count}',
                  ),
                  onPressed: () {
                    controller.increase();
                    // Get.find<SimpleController>().increase();
                  },
                );
              },
            ),
            GetX<ReactiveController>(
              // 반응형 상태관리 - 1
              builder: (controller) {
                return ElevatedButton(
                  child: Text(
                    '반응형 1 / 현재 숫자: ${controller.count.value}', // .value 로 접근
                  ),
                  onPressed: () {
                    controller.increase();
                    // Get.find<ReactiveController>().increase();
                  },
                );
              },
            ),
            // GetX 와 차이는 크게 없지만 컨트롤러를 지정해주지 못해 Get.find로 써야하는 차이가 있음
            Obx(
              // 반응형 상태관리 - 2
              () {
                return ElevatedButton(
                  child: Text(
                    '반응형 2 / 현재 숫자: ${Get.find<ReactiveController>().count.value}', // .value 로 접근
                  ),
                  onPressed: () {
                    Get.find<ReactiveController>().increase();
                  },
                );
              },
            ),
            Obx(
              // 반응형 상태관리 - 3
              () {
                return ElevatedButton(
                  child: Text(
                    '반응형 3 / 현재 숫자: ${ReactiveController.to.count.value}', // .value 로 접근
                  ),
                  onPressed: () {
                    ReactiveController.to.increase();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
