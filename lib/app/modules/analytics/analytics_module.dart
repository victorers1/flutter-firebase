import 'analytics_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'analytics_page.dart';

class AnalyticsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $AnalyticsController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => AnalyticsPage()),
      ];

  static Inject get to => Inject<AnalyticsModule>.of();
}
