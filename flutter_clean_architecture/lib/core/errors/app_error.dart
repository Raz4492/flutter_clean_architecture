import 'package:flutter/material.dart';

class AppError extends Error {
  final String message;

  AppError(this.message);

  @override
  String toString() {
    return 'AppError: $message';
  }
}

class ErrorHandler {
  static void handleError(BuildContext context, dynamic error) {
    if (error is AppError) {
      // Handle AppError
      _showErrorDialog(context, error.message);
    } else {
      // Handle other errors
      _showErrorDialog(context, 'An unexpected error occurred');
    }
  }

  static void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
