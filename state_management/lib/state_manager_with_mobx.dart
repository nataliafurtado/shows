import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/widgets.dart';

class StateManagementWithMobx<Value> {
  StateManagementWithMobx(Value value) : _observable = Observable<Value>(value);

  final Observable<Value> _observable;
  Value get value => _observable.value;
  set value(Value value) => _observable.value = value;
}

class StateManagementWithMobxBuilder extends StatelessWidget {
  final Widget Function(BuildContext) builder;

  const StateManagementWithMobxBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: builder,
    );
  }
}
