import 'package:firebase_flutter/app/modules/performance/repositories/interfaces/base_performance_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'performance_controller.g.dart';

@Injectable()
class PerformanceController = _PerformanceControllerBase
    with _$PerformanceController;

abstract class _PerformanceControllerBase with Store {
  BasePerformanceRepository basePerformanceRepository;
  _PerformanceControllerBase({this.basePerformanceRepository});

  /// Trace performance
  @observable
  String _traceButtonText = 'Peforme trace';
  @observable
  int fabCount = 0;
  @action
  increment() => ++fabCount;
  @action
  setTraceButtonText(String s) => _traceButtonText = s;
  get traceButtonsText => _traceButtonText;
  // Trace performance

  /// Network performance
  int pageOffset = 0;
  int limitPerPage = 20;
  Future getPokemons() async {
    return await basePerformanceRepository.getPokemons(
        pageOffset, limitPerPage);
  }
  // Network performance

}
