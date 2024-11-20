import 'package:flutter/material.dart';

snackBarPage() {
  return SnackBar(
    backgroundColor: Colors.red,
    content: const Text('No Internet detected'),
    action: SnackBarAction(
      textColor: Colors.white,
      label: 'fermer',
      onPressed: () {},
    ),
  );
}
