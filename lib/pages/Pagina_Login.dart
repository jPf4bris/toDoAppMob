import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_to_do/models/theme_provider.dart'; // Gerenciamento de tema
import 'package:flutter_to_do/pages/home.dart'; // Página principal
import 'package:flutter_to_do/pages/Pagina_Cadastro.dart'; // Página de cadastro
import 'package:flutter_to_do/pages/PaginaRecuperacaoSenha.dart'; // Página de recuperação de senha

class PaginaLogin extends StatefulWidget {
  PaginaLogin({super.key});

  @override
  State<PaginaLogin> createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  bool isHoveringEsqueceuSenha = false; // Controla o hover no texto "Esqueceu a senha?"

  // Controle de texto
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // Navegação para a página principal
  void navegarParaHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  // Navegação para a página de cadastro
  void navegarParaCadastro(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaginaCadastro(),
      ),
    );
  }

  // Navegação para a página de recuperação de senha
  void navegarParaRecuperacaoSenha(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaginaRecuperacaoSenha(),
      ),
    );
  }

  // Função para realizar o login com validação
  void realizarLogin(BuildContext context) {
    final username = usernameController.text;
    final password = passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      // Se os campos estiverem preenchidos, navega para a página principal
      navegarParaHome(context);
    } else {
      // Exibe um alerta informando que os campos devem ser preenchidos
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
    final themeProvider = Provider.of<ThemeProvider>(context); // Obtém o estado do tema
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark; // Verifica o tema atual

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.grey[300], // Cor de fundo dinâmica
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribui os widgets
              children: [
                Column(
                  children: [
                    const SizedBox(height: 50),

                    // Logo
                    Icon(
                      Icons.add_task, // Ícone de tarefa
                      size: 100,
                      color: isDarkMode ? Colors.white : Colors.black, // Cor dinâmica
                    ),

                    const SizedBox(height: 20),

                    // Bem vindo de volta
                    Text(
                      'Bem Vindo!',
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black, // Cor dinâmica
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Campo de usuário
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: 'Usuário',
                        filled: true,
                        fillColor: isDarkMode ? Colors.grey[800] : Colors.white, // Cor dinâmica
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Campo de senha
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Senha',
                        filled: true,
                        fillColor: isDarkMode ? Colors.grey[800] : Colors.white, // Cor dinâmica
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Esqueceu a senha com efeito de hover
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MouseRegion(
                            onEnter: (_) =>
                                setState(() => isHoveringEsqueceuSenha = true),
                            onExit: (_) =>
                                setState(() => isHoveringEsqueceuSenha = false),
                            child: GestureDetector(
                              onTap: () => navegarParaRecuperacaoSenha(context), // Navega para a página de recuperação de senha
                              child: Text(
                                'Esqueceu a senha?',
                                style: TextStyle(
                                  color: isHoveringEsqueceuSenha
                                      ? Colors.red
                                      : (isDarkMode ? Colors.blue[300] : Colors.blue),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Botões de Login e Cadastrar-se
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Botão de Login
                        GestureDetector(
                          onTap: () => realizarLogin(context), // Chama a função de verificação
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: isDarkMode ? Colors.grey[700] : Colors.grey, // Cor dinâmica
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        // Botão de Cadastrar-se
                        GestureDetector(
                          onTap: () => navegarParaCadastro(context), // Navega para a página de cadastro
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: isDarkMode ? Colors.grey[700] : Colors.grey, // Cor dinâmica
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'Cadastrar-se',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20), // Espaçamento inferior

                // Botão de alternância de tema
                IconButton(
                  icon: Icon(
                    isDarkMode ? Icons.light_mode : Icons.dark_mode, // Ícone dinâmico
                    color: isDarkMode ? Colors.yellow : Colors.black,
                  ),
                  onPressed: () {
                    // Alterna entre modo claro e escuro
                    themeProvider.toggleTheme();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}