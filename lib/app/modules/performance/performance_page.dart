import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'performance_controller.dart';

class PerformancePage extends StatefulWidget {
  const PerformancePage({Key key}) : super(key: key);

  @override
  _PerformancePageState createState() => _PerformancePageState();
}

class _PerformancePageState
    extends ModularState<PerformancePage, PerformanceController> {
  final trace = FirebasePerformance.instance.newTrace('5secs_trace');
  final scaffoldKey = GlobalKey<ScaffoldState>();

  _perfTrace() async {
    trace.start();
    controller.setTraceButtonText('Tracing...');
    await Future.delayed(Duration(seconds: 5));
    trace.stop();
    controller.setTraceButtonText('Peforme trace');
  }

  _incrementMetric() {
    trace.incrementMetric('FAB_count', controller.fabCount).then(
          (value) => print('trace.incrementMetric(${controller.fabCount})'),
        );

    scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          'FAB_count metric updated to ${controller.fabCount}',
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Performance Module'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: _perfTrace,
              child: Observer(
                builder: (_) {
                  return Text(controller.traceButtonsText);
                },
              ),
            ),
            RaisedButton(
              onPressed: () {
                /// TODO(victor): Flutter's Firebase doesn't have native support to network performance,
                /// TODO(victor): feature in stand-by.
                Modular.link.pushNamed('/network_performance');
              },
              child: Text('Go to Network Performance page'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
          _incrementMetric();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
