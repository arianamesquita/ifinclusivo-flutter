import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/libras/topic_libras/viewmodels/specific_topic_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/libras/topic_libras/widgets/specific_topic_grid.dart';


import '../../../../routing/app_router.dart';
import '../../../../utils/responsive_utils.dart';
import '../../../core/layout/custom_container_shell.dart';
import '../libras_details/widgets/top_content_libras.dart';
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

    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        if (widget.viewModel.state == SpecificTopicsState.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        String title = widget.viewModel.category.name.toLowerCase().replaceAll(
          '_',
          ' ',
        );
        if (title.isNotEmpty) {
          title = title[0].toUpperCase() + title.substring(1);
        }
        List<SpecificTopicGridParams> items =
            widget.viewModel.models.isEmpty
                ? []
                : widget.viewModel.models.map((model) {
                  return SpecificTopicGridParams(
                    title: model.palavra,
                    description: model.descricao,
                    url: model.url,
                    onTap:
                        () => {
                          MidiaCategoriaRouter( categoria: widget.viewModel.category.name, id: model.id).go(context),
                        },
                  );
                }).toList();

        Widget searchNotFound = SearchNotFound(
          onPressed: () {
            WordSuggestionRouter().push(context);
          },
          text: 'Não foram encontradas palavras relacionadas a este tema',
          text2: 'Gostaria de sugerir alguma?',
        );

        Widget specificTopicGrid = SpecificTopicGrid(specificTopicsList: items);
        Widget content = specificTopicGrid;

        if (items.isEmpty) {
          content = searchNotFound;
        }

        return device == DeviceScreenType.mobile
            ? Scaffold(
              appBar: AppBar(title: Text(title)),
              body: SafeArea(
                child: SingleChildScrollView(
                  controller: _controller,
                  child: Column(
                    children: [
                      const Text(
                        "Explore os principais sinais de Libras sobre este tema.",
                      ),
                      const SizedBox(height: 90),
                      content,
                      if(widget.viewModel.state == SpecificTopicsState.loadingMore)SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(),
                      )
                    ],
                  ),
                ),
              ),
            )
            : CustomContainerShell(
          scrollController: _controller,
              child: Column(
                children: [
                  TopContentLibras(
                    title: title,
                    subtitle:
                        "Explore os principais sinais de Libras sobre este tema.",
                  ),
                  const SizedBox(height: 15),
                  content,
                  if(widget.viewModel.state == SpecificTopicsState.loadingMore)SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  )
                ],
              ),
            );
      },
    );
  }
}
