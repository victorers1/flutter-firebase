import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
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
  final FirebaseAnalytics analytics = FirebaseAnalytics();

  analyticsPressedButton() {
    analytics.logEvent(name: 'pressed_button', parameters: {'foo': 'bar'}).then(
      (value) => print('analytics events logged'),
    );
  }

  analyticsAppOpen() {
    analytics.logAppOpen().then((value) => print('app open logged'));
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
              onPressed: analyticsPressedButton,
              child: Text('Trigger Analytics Event'),
            ),
          ],
        ),
      ),
    );
  }
}