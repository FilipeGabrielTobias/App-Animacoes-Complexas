// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.only(
        top: 160
      ),
      onPressed: () {

      },
      child: const Text(
        'Não possui uma conta? Cadastre-se!',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.white,
          fontSize: 12,
          letterSpacing: 0.5
        ),
      ),
    );
  }
}