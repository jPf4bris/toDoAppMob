import 'package:flutter/material.dart';

class PaginaCadastro extends StatelessWidget {
  PaginaCadastro({super.key});

  // Controladores para os campos de texto
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Função para lidar com o cadastro
  void realizarCadastro(BuildContext context) {
    final username = usernameController.text;
    final password = passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      // Exemplo: Exibir uma mensagem de sucesso
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Cadastro Realizado'),
          content: Text('Usuário: $username\nSenha: $password'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Exibir uma mensagem de erro
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Erro'),
          content: const Text('Por favor, preencha todos os campos.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            // Campo de texto para o nome de usuário
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Nome de Usuário',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Campo de texto para a senha
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Botão de cadastro
            ElevatedButton(
              onPressed: () => realizarCadastro(context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
