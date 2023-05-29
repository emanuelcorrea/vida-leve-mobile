import 'package:flutter/material.dart';
import 'package:vidaleve/main.dart';

class ToastNotification {
  static showSuccessSnackBar(BuildContext context,
      {required String message,
      int milliseconds = 10000,
      SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        margin: const EdgeInsets.only(bottom: 100.0),
        behavior: snackBarBehavior,
        action: SnackBarAction(
            textColor: Colors.white,
            label: 'DISMISS',
            onPressed: () => _dismissCurrentSnackBar(context)),
        duration: Duration(milliseconds: milliseconds),
        content: SelectableText(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static void showErrorSnackBar(BuildContext context,
      {String? message,
      int milliseconds = 5000,
      SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFF00588A),
        behavior: snackBarBehavior,
        action: SnackBarAction(
            textColor: Colors.white,
            label: 'Fechar',
            onPressed: () => _dismissCurrentSnackBar(context)),
        duration: Duration(milliseconds: milliseconds),
        content: SelectableText(
          message ?? 'Erro no sistema.',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static void message({
    String? message,
    int milliseconds = 3000,
    SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating,
  }) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFF00588A),
        behavior: snackBarBehavior,
        action: SnackBarAction(
            textColor: Colors.white,
            label: 'Fechar',
            onPressed: () =>
                _dismissCurrentSnackBar(navigatorKey.currentContext!)),
        duration: Duration(milliseconds: milliseconds),
        content: SelectableText(
          message ?? 'Erro no sistema.',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static void _dismissCurrentSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
