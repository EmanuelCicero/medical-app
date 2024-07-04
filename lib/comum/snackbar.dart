import 'package:flutter/material.dart';

mostrarSnackBar({required BuildContext context, required String texto}) {
  SnackBar snackBar = SnackBar(
    content: Text(texto),
    backgroundColor: Colors.red,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
