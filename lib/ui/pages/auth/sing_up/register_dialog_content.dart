import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterDialogContent extends StatelessWidget {
  const RegisterDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(24),
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Cadastro', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nome completo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
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

            // 🔥 botão para navegar para login
            TextButton(
              onPressed: () {
                 context.pushReplacement('/login');
              },
              child: const Text("Já tem cadastro? Clique aqui"),
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
                    // lógica de cadastro...
                    context.pop();
                  },
                  child: const Text('Criar conta'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
