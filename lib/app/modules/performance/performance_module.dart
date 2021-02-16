import 'performance_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'performance_page.dart';

class PerformanceModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $PerformanceController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => PerformancePage()),
      ];

  static Inject get to => Inject<PerformanceModule>.of();
}
