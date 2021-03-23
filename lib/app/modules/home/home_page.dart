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
  Widget snapshotHasError() => Text('Firebase could not be initialized');

  Widget snapshotHasData() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () {
              Modular.to.pushNamed('/analytics');
            },
            color: Colors.yellow,
            child: Text('Try Firebase Analytics'),
          ),
          RaisedButton(
            onPressed: () {
              Modular.to.pushNamed('/performance');
            },
            color: Colors.green,
            child: Text('Try Firebase Performance'),
          ),
        ],
      );

  Widget snapshotIsEmpty() => CircularProgressIndicator();

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
              return snapshotHasError();
            } else {
              if (snapshot.hasData) {
                return snapshotHasData();
              } else {
                return snapshotIsEmpty();
              }
            }
          },
        ),
      ),
    );
  }
}
