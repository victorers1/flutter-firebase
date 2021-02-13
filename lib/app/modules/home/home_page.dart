import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final FirebaseAnalytics analytics = FirebaseAnalytics();

  analyticsAppOpen() {
    analytics.logAppOpen().then((value) => print('app open logged'));
  }

  analyticsPressedButton() {
    analytics.logEvent(name: 'pressed_button', parameters: {'foo': 'bar'}).then(
      (value) => print('analytics events logged'),
    );
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
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Firebase could not be initialized');
            } else {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: analyticsPressedButton,
                      child: Text('Trigger Analytics Event'),
                    ),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            }
          },
        ),
      ),
    );
  }
}