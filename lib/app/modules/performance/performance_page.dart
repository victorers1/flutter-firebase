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
  _perfTrace() async {
    Trace trace = FirebasePerformance.instance.newTrace('5secs_trace');
    trace.start();
    controller.setTraceButtonText('Tracing...');
    await Future.delayed(Duration(seconds: 5));
    trace.stop();
    controller.setTraceButtonText('Peforme trace');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Modular.link.pushNamed('/network_performance');
              },
              child: Text('Go to Network Performance page'),
            ),
          ],
        ),
      ),
    );
  }
}
