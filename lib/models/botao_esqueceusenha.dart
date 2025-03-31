import 'package:flutter/material.dart';

class BotaoEsqueceuSenha extends StatelessWidget {
  final Function()? onTap;

  const BotaoEsqueceuSenha({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.grey[800], // Cor diferente para o botão
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            "Esqueceu a senha?",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
