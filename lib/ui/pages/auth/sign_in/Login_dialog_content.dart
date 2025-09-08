// lib/ui/pages/auth/login_dialog_content.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginDialogContent extends StatelessWidget {
  const LoginDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(24),
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Login', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // 🔥 botão para navegar para cadastro
            TextButton(
              onPressed: () {
               context.pushReplacement('/register');
              },
              child: const Text("Não tem cadastro? Clique aqui"),
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => context.pop(),
                  child: const Text('Cancelar'),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: () {
                    // lógica de login...
                    context.pop();
                  },
                  child: const Text('Entrar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
