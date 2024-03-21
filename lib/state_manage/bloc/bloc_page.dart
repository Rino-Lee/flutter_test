import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jjigmuck/mvvm/view/user_search_result_page.dart';
import 'package:flutter_jjigmuck/state_manage/bloc/counter_bloc.dart';
import 'package:flutter_jjigmuck/state_manage/bloc/counter_event.dart';
import 'package:flutter_jjigmuck/state_manage/bloc/counter_state.dart';

class BlocPage extends StatelessWidget {
  const BlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Bloc'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(state.count.toString()),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text(
                      '더하기',
                    ),
                    onPressed: () {
                      // 값에 변경이 생겨도 UI 를 갱신 하지 않음
                      context
                          .read<CounterBloc>()
                          .add(const CounterIncrementPressed());
                    },
                  ),
                  ElevatedButton(
                    child: Text(
                      '빼기',
                    ),
                    onPressed: () {
                      // 값에 변경이 생겨도 UI 를 갱신 하지 않음
                      context
                          .read<CounterBloc>()
                          .add(const CounterDecrementPressed());
                    },
                  )
                ],
              )
            ],
          ));
    });
  }
}
