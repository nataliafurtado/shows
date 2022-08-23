import 'package:flutter/widgets.dart';
import 'package:rx_notifier/rx_notifier.dart';

class StateManagementWithRXNot<Value> {
  StateManagementWithRXNot(Value value)
      : _valueNotifier = RxNotifier<Value>(value);

  final RxNotifier<Value> _valueNotifier;
  Value get value => _valueNotifier.value;
  set value(Value value) => _valueNotifier.value = value;
}

class StateManagementWithRXNotBuilder extends StatelessWidget {
  final Widget Function(BuildContext) builder;
  final bool Function()? filter;
  const StateManagementWithRXNotBuilder({
    Key? key,
    required this.builder,
    this.filter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: builder,
      filter: filter,
    );
  }
}
