// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PerformanceController = BindInject(
  (i) => PerformanceController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerformanceController on _PerformanceControllerBase, Store {
  final _$_traceButtonTextAtom =
      Atom(name: '_PerformanceControllerBase._traceButtonText');

  @override
  String get _traceButtonText {
    _$_traceButtonTextAtom.reportRead();
    return super._traceButtonText;
  }

  @override
  set _traceButtonText(String value) {
    _$_traceButtonTextAtom.reportWrite(value, super._traceButtonText, () {
      super._traceButtonText = value;
    });
  }

  final _$_PerformanceControllerBaseActionController =
      ActionController(name: '_PerformanceControllerBase');

  @override
  dynamic setTraceButtonText(String s) {
    final _$actionInfo = _$_PerformanceControllerBaseActionController
        .startAction(name: '_PerformanceControllerBase.setTraceButtonText');
    try {
      return super.setTraceButtonText(s);
    } finally {
      _$_PerformanceControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
