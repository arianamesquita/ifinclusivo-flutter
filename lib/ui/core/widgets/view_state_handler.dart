import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../exceptions/api_exception.dart';
import '../../../routing/app_router.dart';
import '../viewmodels/BaseViewModel.dart';

/// Um widget "Helper" que reage aos estados de um [BaseViewModel].
/// Ele simplifica a lógica da UI, decidindo automaticamente o que renderizar:
/// a UI de sucesso, um indicador de loading, uma mensagem de erro, ou
/// redirecionar para uma página de erro crítica.
class ViewStateHandler<T extends BaseViewModel> extends StatelessWidget {

  /// O builder obrigatório para o estado de sucesso.
  final Widget Function(BuildContext context, T viewModel) successBuilder;

  /// Widget opcional para o estado de loading. Se não for fornecido,
  /// um [CircularProgressIndicator] padrão será exibido.
  final Widget? loadingBuilder;

  /// Builder opcional para o estado de erro. Permite customizar a exibição
  /// de erros não críticos na própria tela.
  final Widget Function(BuildContext context, ApiException exception)? errorBuilder;

  const ViewStateHandler({
    super.key,
    required this.successBuilder,
    this.loadingBuilder,
    this.errorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<T>(context);

    // LÓGICA DE REDIRECIONAMENTO AUTOMÁTICO
    // Se o erro for do tipo InternalServerException, navega para a tela 500.
    if (viewModel.apiException is InternalServerException) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Usa o go_router_builder para navegar para a rota de erro.
        ServerErrorRoute().go(context);
      });
      return const SizedBox.shrink(); // Exibe um widget vazio durante a transição
    }

    switch (viewModel.state) {
      case ViewState.loading:
        return loadingBuilder ?? const Center(child: CircularProgressIndicator());

      case ViewState.error:
      // Se um errorBuilder customizado foi fornecido, usa ele.
        if (errorBuilder != null && viewModel.apiException != null) {
          return errorBuilder!(context, viewModel.apiException!);
        }
        // Caso contrário, exibe uma mensagem de erro padrão.
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(viewModel.apiException?.message ?? "Ocorreu um erro."),
          ),
        );

      case ViewState.success:
      case ViewState.idle:
      default:
        return successBuilder(context, viewModel);
    }
  }
}