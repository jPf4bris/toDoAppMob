import 'package:flutter/material.dart';

class CampoDeTexto extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const CampoDeTexto({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          hintText: 'Nome de Usuário',
          hintStyle: TextStyle(color: Colors.grey[500]),
          fillColor: Colors.grey.shade200,
          filled: true,
        ),
      ),
    );
  }
}

class CampoDeTexto2 extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const CampoDeTexto2({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          hintText: 'Senha',
          hintStyle: TextStyle(color: Colors.grey[500]),
          fillColor: Colors.grey.shade200,
          filled: true,
        ),
      ),
    );
  }
}
