import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../counter.dart';

class SingleProviderPage extends StatelessWidget {
  const SingleProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Provider'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 값에 변경이 생길 시에 UI를 갱신함
              Consumer<Counter>(
                  builder: (context, count, child) => Text('${count.count}')),
              ElevatedButton(
                child: Text(
                  '더하기',
                ),
                onPressed: () {
                  // 값에 변경이 생겨도 UI 를 갱신 하지 않음
                  context.read<Counter>().increase();
                },
              )
            ],
          ),
        ));
  }
}
