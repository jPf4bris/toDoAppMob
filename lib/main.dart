import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_to_do/pages/Pagina_Login.dart'; // Página de login
import 'package:flutter_to_do/models/salvar_tarefa.dart'; // Gerenciamento de tarefas
import 'package:flutter_to_do/models/theme_provider.dart'; // Gerenciamento de tema
import 'package:device_preview/device_preview.dart'; // Simulação de dispositivos

void main() {
  runApp(
    DevicePreview(
      enabled: true, // Ativa o Device Preview
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SaveTask()), // Estado global das tarefas
          ChangeNotifierProvider(create: (context) => ThemeProvider()), // Estado global do tema
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtém o estado do tema (Dark/Light Mode)
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa de "debug"
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey[300], // Cor de fundo do modo claro
        primaryColor: Colors.blue, // Cor principal
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.grey, // Cor do AppBar no modo claro
          foregroundColor: Colors.white, // Cor do texto no AppBar
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white, // Cor de fundo dos campos de texto
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey[900], // Cor de fundo do modo escuro
        primaryColor: Colors.grey[900], // Cor principal
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.grey, // Cor do AppBar no modo escuro
          foregroundColor: Colors.white, // Cor do texto no AppBar
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[800], // Cor de fundo dos campos de texto
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      themeMode: themeProvider.themeMode, // Alterna entre os temas
      home: PaginaLogin(), // Define a tela inicial como a página de login
      useInheritedMediaQuery: true, // Necessário para o Device Preview
      locale: DevicePreview.locale(context), // Define a localização do Device Preview
      builder: DevicePreview.appBuilder, // Constrói o app com o Device Preview
    );
  }
}