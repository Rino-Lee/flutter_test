import 'package:meta/meta.dart';

@immutable
abstract class CounterState {
  final int count;

  const CounterState(this.count);
}

class CounterInitial extends CounterState {
  const CounterInitial(super.count);
}

class CounterChange extends CounterState {
  const CounterChange(super.count);
}
