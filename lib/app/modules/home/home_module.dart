import 'package:firebase_flutter/app/modules/analytics/analytics_module.dart';
import 'package:firebase_flutter/app/modules/performance/performance_module.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $HomeController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter('/analytics', module: AnalyticsModule()),
        ModularRouter('/performance', module: PerformanceModule()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
