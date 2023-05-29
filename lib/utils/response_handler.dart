import 'package:provider/provider.dart';
import 'package:vidaleve/interfaces/authentication_exceptions.dart';
import 'package:vidaleve/main.dart';
import 'package:vidaleve/providers/settings_provider.dart';

class ResponseHandler {
  final RequestStatus status;

  static const String successStatus = 'successfuly';
  static const String errorStatus = 'error';

  ResponseHandler(this.status);

  setIsLoading(bool isLoading) {
    Provider.of<SettingsProvider>(navigatorKey.currentContext!, listen: false)
        .setIsLoading(isLoading);
  }

  @override
  String toString() {
    setIsLoading(false);

    return generateMessage(status);
  }

  static String generateMessage(RequestStatus status) {
    String message;
    switch (status) {
      case RequestStatus.timeout:
        message = "Conexão temporariamente indisponível.";
        break;
      case RequestStatus.error:
        message = "Erro no processamento da solicitação.";
        break;
      default:
        message = "Desculpe, ocorreu um erro.";
    }
    return message;
  }
}
