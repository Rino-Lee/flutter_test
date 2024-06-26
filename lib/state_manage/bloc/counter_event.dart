import 'package:meta/meta.dart';

@immutable
abstract class CounterEvent {
  const CounterEvent();
}

class CounterIncrementPressed extends CounterEvent {
  const CounterIncrementPressed();
}

class CounterDecrementPressed extends CounterEvent {
  const CounterDecrementPressed();
}
