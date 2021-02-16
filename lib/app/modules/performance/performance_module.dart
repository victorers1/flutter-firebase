import 'package:firebase_flutter/app/modules/performance/pages/network_performance_page.dart';
import 'package:firebase_flutter/app/modules/performance/repositories/performance_repository.dart';
import 'package:firebase_flutter/app/shared/metric_dio.dart';

import 'performance_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'performance_page.dart';

class PerformanceModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MetricDio().dio),
        $PerformanceRepository,
        $PerformanceController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => PerformancePage(),
        ),
        ModularRouter(
          '/network_performance',
          child: (_, args) => NetworkPerformancePage(),
        )
      ];

  static Inject get to => Inject<PerformanceModule>.of();
}
