import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../counter.dart';
import '../counter1000.dart';

class MultiProviderPage extends StatelessWidget {
  const MultiProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              "${context.watch<Counter>().count} || ${context.watch<Counter1000>().count}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text(
                  '더하기',
                ),
                onPressed: () {
                  context.read<Counter>().increase();
                },
              ),
              ElevatedButton(
                child: Text(
                  '더하기1000',
                ),
                onPressed: () {
                  context.read<Counter1000>().increase();
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
