import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'performance_controller.g.dart';

@Injectable()
class PerformanceController = _PerformanceControllerBase
    with _$PerformanceController;

abstract class _PerformanceControllerBase with Store {
  @observable
  String _traceButtonText = 'Peforme trace';

  @action
  setTraceButtonText(String s) => _traceButtonText = s;
  get traceButtonsText => _traceButtonText;
}
