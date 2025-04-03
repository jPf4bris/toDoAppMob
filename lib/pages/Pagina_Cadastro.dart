import 'package:flutter/material.dart';

class PaginaCadastro extends StatelessWidget {
  PaginaCadastro({super.key});

  // Controladores para os campos de texto
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController(); // Controlador para confirmação de senha
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController(); // Controlador para telefone

  // Função para lidar com o cadastro
  void realizarCadastro(BuildContext context) {
    final username = usernameController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;
    final email = emailController.text;
    final phone = phoneController.text;

    if (username.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        email.isNotEmpty &&
        phone.isNotEmpty) {
      if (password == confirmPassword) {
        // Exemplo: Exibir uma mensagem de sucesso
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Cadastro Realizado'),
            content: Text(
                'Usuário: $username\nE-mail: $email\nTelefone: $phone\nSenha: $password'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        // Exibir erro se as senhas não forem iguais
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Erro'),
            content: const Text('As senhas não coincidem.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } else {
      // Exibir uma mensagem de erro se algum campo estiver vazio
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
        child: SingleChildScrollView(
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

              // Campo de texto para o telefone
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone, // Define o teclado numérico
                decoration: InputDecoration(
                  labelText: 'Telefone',
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

              // Campo de texto para confirmação de senha
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirmar Senha',
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
      ),
    );
  }
}