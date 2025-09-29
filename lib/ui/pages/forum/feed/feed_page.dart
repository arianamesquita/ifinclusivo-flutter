import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/pages/forum/feed/viewmodels/feed_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/forum/feed/widgets/filter_chips_bar.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';
import 'package:provider/provider.dart';

import '../../../../domain/models/enums/categorias.dart';
import '../../../core/widgets/search_bar.dart';
import '../publicacao/widget/cards/publicacao_card.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final ScrollController _scrollController = ScrollController();
  bool _showFab = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<FeedViewModel>().fetchPublications();
    });

    _scrollController.addListener(() async {
      final vm = context.read<FeedViewModel>();
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          vm.state != FeedState.loadingMore) {
       await vm.fetchMorePublications();
      }
      // Mostrar/ocultar FAB
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_showFab) setState(() => _showFab = false);
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_showFab) setState(() => _showFab = true);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedViewModel>(
      builder: (context, viewModel, state) {
        return Scaffold(
          floatingActionButton:
              (viewModel.currentUser != null)
                  ? FloatingActionButton(
                    onPressed: () => NewPublicacaoRouter().push(context),
                    child: Icon(Icons.add),
                  )
                  : null,
          body: CustomScrollView(
            controller: _scrollController,
            slivers: [
              buildSliverToBoxAdapter(context),
              buildSliverPersistentHeader(viewModel, context),

              if (viewModel.state == FeedState.initialLoading)
                const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (viewModel.state == FeedState.empty)
                const SliverFillRemaining(
                  child: Center(child: Text("Nenhuma publicação encontrada")),
                )
              else
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index < viewModel.publications.length) {
                        return _centralized(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: PublicacaoCard(
                              model: viewModel.publications[index],
                            ),
                          ),
                        );
                      } else {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                    },
                    childCount:
                        viewModel.publications.length +
                        (viewModel.state == FeedState.loadingMore ? 1 : 0),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  _centralized({required Widget child}) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: ResponsiveUtils.spacingColumn(context)),
        child: child,
      ),
    );
  }

  SliverPersistentHeader buildSliverPersistentHeader(
    FeedViewModel viewModel,
    BuildContext context,
  ) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverSearchFilterDelegate(
        child: _centralized(
          child: Column(
            spacing: 8,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomSearchBar(onChanged: (query) {}),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: FilterChipsBar(
                  onChanged: (filters, order) async{
                    Ordenacao odern =
                        (order == 'Relevância')
                            ? Ordenacao.RELEVANCIA
                            : Ordenacao.MAIS_RECENTE;
                   await viewModel.fetchPublications(
                      categories: filters,
                      order: odern,
                    );
                    _scrollController.animateTo(
                      0,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOut,
                    );
                  },
                ),
              ),
              Container(
                color: Theme.of(context).colorScheme.outline,
                width: double.infinity,
                height: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter buildSliverToBoxAdapter(BuildContext context) {
    final device = ResponsiveUtils.getDeviceType(context);
    return SliverToBoxAdapter(
      child:
          device == DeviceScreenType.mobile
              ? _centralized(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        'assets/logo/logo_expanded_dark.svg',
                        height: 60,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications_outlined),
                      ),
                    ],
                  ),
                ),
              )
              : Padding(
                padding: const EdgeInsets.only(
                  top: 100,
                  right: 8,
                  left: 8,
                  bottom: 16,
                ),
                child: _centralized(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 32,
                    children: [
                      Text(
                        "Conecta IF",
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Compartilhe dúvidas, ideias e soluções com a comunidade",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}

class _SliverSearchFilterDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SliverSearchFilterDelegate({required this.child});

  @override
  double get minExtent => 125; // altura mínima
  @override
  double get maxExtent => 128; // altura máxima

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      color: Theme.of(context).colorScheme.surface,
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
