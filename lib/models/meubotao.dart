import 'package:flutter/material.dart';

class MeuBotao extends StatefulWidget {
  final Function()? onTap;
  final String text; // Permite personalizar o texto do botão

  const MeuBotao({super.key, required this.onTap, required this.text});

  @override
  State<MeuBotao> createState() => _MeuBotaoState();
}

class _MeuBotaoState extends State<MeuBotao> {
  bool isHovering = false; // Controla o estado de hover

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: isHovering ? Colors.grey[800] : Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
