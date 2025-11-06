import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/libras/libras_search_bar/search_not_found.dart';
import 'package:if_inclusivo/ui/pages/libras/specific_topic/viewmodels/specific_topic_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/libras/specific_topic/widgets/specific_topic_grid.dart';
import 'package:if_inclusivo/ui/pages/libras/libras_page/widgets/top_content_libras.dart';

import '../../../../routing/app_router.dart';
import '../../../../utils/responsive_utils.dart';
import '../../../core/layout/custom_container_shell.dart';

class SpecificTopicPage extends StatefulWidget {
  final SpecificTopicViewModel viewModel;
  const SpecificTopicPage({super.key, required this.viewModel});

  @override
  State<SpecificTopicPage> createState() => _SpecificTopicPageState();
}

class _SpecificTopicPageState extends State<SpecificTopicPage> {
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
                          widget.viewModel.setId(model.id),
                          widget.viewModel.setVideoUrl(model.url),
                          MidiaRouter(model.id).go(context),
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
                  child: Column(
                    children: [
                      const Text(
                        "Explore os principais sinais de Libras sobre este tema.",
                      ),
                      const SizedBox(height: 90),
                      content,
                    ],
                  ),
                ),
              ),
            )
            : CustomContainerShell(
              child: Column(
                children: [
                  TopContentLibras(
                    title: title,
                    subtitle:
                        "Explore os principais sinais de Libras sobre este tema.",
                  ),
                  const SizedBox(height: 15),
                  content,
                ],
              ),
            );
      },
    );
  }
}
