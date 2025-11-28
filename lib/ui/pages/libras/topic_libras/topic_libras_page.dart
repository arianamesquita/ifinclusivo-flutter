import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/core/layout/app_header.dart';
import 'package:if_inclusivo/ui/pages/libras/topic_libras/viewmodels/specific_topic_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/libras/topic_libras/widgets/specific_topic_grid.dart';

import '../../../../routing/app_router.dart';
import '../../../../utils/responsive_utils.dart';
import '../../../core/layout/custom_container_shell.dart';
import '../libras_home/widgets/search_not_found.dart';

class TopicLibrasPage extends StatefulWidget {
  final SpecificTopicViewModel viewModel;
  const TopicLibrasPage({super.key, required this.viewModel});

  @override
  State<TopicLibrasPage> createState() => _TopicLibrasPageState();
}

class _TopicLibrasPageState extends State<TopicLibrasPage> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    final vm = widget.viewModel;

    if (_controller.position.pixels >=
            _controller.position.maxScrollExtent - 200 &&
        vm.state != SpecificTopicsState.loadingMore &&
        vm.hasMore) {
      vm.loadMore();
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DeviceScreenType device = ResponsiveUtils.getDeviceType(context);
    String title = widget.viewModel.category.name.toLowerCase().replaceAll(
      '_',
      ' ',
    );
    if (title.isNotEmpty) {
      title = title[0].toUpperCase() + title.substring(1);
    }

    return device == DeviceScreenType.mobile
        ? _buildMobile(title)
        : _buildBigScreens(title);
  }

  CustomContainerShell _buildBigScreens(String title) {
    return CustomContainerShell(
      child: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverToBoxAdapter(
            child: AppHeader(
              title: title,
              subTitle:
                  'Explore os principais sinais de Libras sobre este tema.',
            ),
          ),
         _buildContentSliver()
        ],
      ),
    );
  }

  Scaffold _buildMobile(String title) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: CustomScrollView(
          controller: _controller,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 8,
                ),
                child: Text(
                  "Explore os principais sinais de Libras sobre este tema.",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            _buildContentSliver(),
          ],
        ),
      ),
    );
  }

  Widget _buildContentSliver() {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        if (widget.viewModel.state == SpecificTopicsState.loading) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        final items =
            widget.viewModel.models.map((model) {
              return SpecificTopicGridParams(
                title: model.palavra,
                description: model.descricao,
                url: model.url,
                onTap:
                    () => {
                      MidiaCategoriaRouter(
                        categoria: widget.viewModel.category.name,
                        id: model.id,
                      ).go(context),
                    },
              );
            }).toList();
        if (items.isEmpty) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: SearchNotFound(
                onPressed: () => WordSuggestionRouter().push(context),
                text: 'Não foram encontradas palavras relacionadas a este tema',
                text2: 'Gostaria de sugerir alguma?',
              ),
            ),
          );
        }

        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 884),
              child: SpecificTopicGrid(specificTopicsList: items),
            ),
          ),
        );
      },
    );
  }
}
