import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'analytics_controller.dart';

/// Command to do Analytics work on debug mode:
/// Comando para Analytics funcionar em modo Debug:
/// `adb shell setprop debug.firebase.analytics.app com.example.firebase_flutter`

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({Key key}) : super(key: key);

  @override
  _AnalyticsPageState createState() => _AnalyticsPageState();
}

class _AnalyticsPageState
    extends ModularState<AnalyticsPage, AnalyticsController> {
  final analytics = FirebaseAnalytics();

  analyticsPressedButton(int value) {
    final params = {'count': value};
    analytics.logEvent(name: 'pressed_button', parameters: params).then(
          (value) => print('analytics.logEvent($params)'),
        );
  }

  crashApp() {
    FirebaseCrashlytics.instance.crash();
    // throw Exception('Crashing app for Firebase');
  }

  analyticsAppOpen() {
    analytics.logAppOpen().then((value) => print('analytics.logAppOpen()'));
  }

  @override
  void initState() {
    super.initState();
    analyticsAppOpen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analytics'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              color: Colors.blue,
              onPressed: () {
                analyticsPressedButton(controller.value);
              },
              child: Observer(builder: (_) {
                return Text('Trigger Analytics Event ${controller.value}');
              }),
            ),
            RaisedButton(
              color: Colors.red,
              onPressed: crashApp,
              child: Text('Crash App'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: controller.increment,
      ),
    );
  }
}
