# firebase_flutter

## Performance

### Rasteamento (tracing):
Para aplicativos iOS e Android, o Monitoramento de Desempenho coleta **automaticamente** vários rastros relacionados ao ciclo de vida do aplicativo. São eles:

- **Início de aplicativo**: mede o tempo entre o momento em que o usuário abre o aplicativo e o momento em que o aplicativo responde.

- **Aplicativo em primeiro plano**: mede o tempo em que o aplicativo está sendo executado em primeiro plano e disponível para o usuário.

- **Aplicativo em segundo plano**: mede o tempo em que o aplicativo está sendo executado em segundo plano.

Esses rastreios são rastros prontos para uso, portanto, você não pode adicionar métricas personalizadas ou atributos personalizados a eles. Todos esses rastreios são como cronômetros porque medem o tempo que leva para o processo monitorado ser executado. [Fonte](https://firebase.google.com/docs/perf-mon/app-start-foreground-background-traces?platform=android).


Rasteamento personalizado:
```dart
_perfTrace() async {
    final trace = FirebasePerformance.instance.newTrace('5secs_trace');
    trace.start();
    await Future.delayed(Duration(seconds: 5));
    trace.stop();
  }
```
Mede tempo entre os comandos `trace.start()` e `trace.stop()`.


### Network performance

Rastreia o tempo que as requisições levam para completarem-se, a taxa de erro e também registra as informações no body e header. 

Firebase ainda [não oferece](https://stackoverflow.com/a/54272558/9718711) essa funcionalidade por padrão nem no FLutter nem no Dio. É possível adiconar essa funcionalidade programaticamente usando o código disponível na documentação do [firebase_performance](https://pub.dev/packages/firebase_performance). Há [esse pacote](https://pub.dev/packages/dio_firebase_performance) que tenta fazer a mesma coisa utilizando o Dio, mas não é seguro adicioná-lo.

## Analytics


