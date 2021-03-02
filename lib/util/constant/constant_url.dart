/// **Conceito:** Constantes de itens Relacioando a chamada de serviços do CUD
/// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
class ConstantsUrl {
  static const content = 'Content-Type';
  static const typeJson = 'application/json';
  static const int timeoutSeconds = 60;

  static String host = urlEwallyDev;
  static const http = true;

  static String urlEwallyDev = 'apidev.ewally.com.br';

  static String login = '/user/login';
}
