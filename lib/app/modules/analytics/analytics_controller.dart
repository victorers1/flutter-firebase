import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'analytics_controller.g.dart';

@Injectable()
class AnalyticsController = _AnalyticsControllerBase with _$AnalyticsController;

abstract class _AnalyticsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
