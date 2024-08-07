import 'package:flutter/material.dart';

snackBarPage() {
  return SnackBar(
    backgroundColor: Colors.red,
    content: const Text('Aucune connexion internet détecté'),
    action: SnackBarAction(
      textColor: Colors.white,
      label: 'fermer',
      onPressed: () {},
    ),
  );
}
