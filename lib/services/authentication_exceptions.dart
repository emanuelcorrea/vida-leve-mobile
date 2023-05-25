import 'package:firebase_auth/firebase_auth.dart';

enum AuthStatus {
  successful,
  wrongPassword,
  emailAlreadyExists,
  invalidEmail,
  weakPassword,
  userNotFound,
  unknown,
}

class AuthenticationException {
  static handleAuthException(code) {
    AuthStatus status;

    switch (code) {
      case "invalid-email":
        status = AuthStatus.invalidEmail;
        break;
      case "wrong-password":
        status = AuthStatus.wrongPassword;
        break;
      case "weak-password":
        status = AuthStatus.weakPassword;
        break;
      case "email-already-in-use":
        status = AuthStatus.emailAlreadyExists;
        break;
      case "user-not-found":
        status = AuthStatus.userNotFound;
        break;
      case "successful":
        status = AuthStatus.successful;
        break;
      default:
        status = AuthStatus.unknown;
    }
    return status;
  }

  static String generateMessage(status) {
    String message;
    switch (status) {
      case AuthStatus.invalidEmail:
        message = "O endereço de e-mail incorreto.";
        break;
      case AuthStatus.weakPassword:
        message = "Sua senha deve ter no mínimo 6 caracteres.";
        break;
      case AuthStatus.wrongPassword:
        message = "E-mail ou senha inválidos.";
        break;
      case AuthStatus.emailAlreadyExists:
        message = "Conta com e-mail já existente.";
        break;
      case AuthStatus.userNotFound:
        message = "Usuário não encontrado.";
        break;
      default:
        message = "Desculpe, ocorreu um erro.";
    }
    return message;
  }
}
