// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AnalyticsController = BindInject(
  (i) => AnalyticsController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnalyticsController on _AnalyticsControllerBase, Store {
  final _$valueAtom = Atom(name: '_AnalyticsControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_AnalyticsControllerBaseActionController =
      ActionController(name: '_AnalyticsControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_AnalyticsControllerBaseActionController.startAction(
        name: '_AnalyticsControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_AnalyticsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
