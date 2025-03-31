import 'package:flutter/material.dart';

class PaginaRecuperacaoSenha extends StatelessWidget {
  PaginaRecuperacaoSenha({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperação de Senha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            // Campo de texto para o e-mail
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Botão para enviar o e-mail de recuperação
            ElevatedButton(
              onPressed: () {
                final email = emailController.text;
                if (email.isNotEmpty) {
                  // Lógica para enviar o e-mail de recuperação
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text('E-mail de recuperação enviado para $email'),
                    ),
                  );
                  Navigator.pop(context); // Volta para a página anterior
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Por favor, insira um e-mail válido.'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
