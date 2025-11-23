
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/core/layout/app_header.dart';
import 'package:if_inclusivo/ui/pages/libras/libras_details/view_models/libras_view_model.dart';
import 'package:if_inclusivo/ui/pages/libras/libras_details/widgets/youtube_player_android.dart';
import 'package:if_inclusivo/ui/pages/libras/libras_details/widgets/youtube_player_web.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';
import 'package:if_inclusivo/utils/text_formater.dart';
import 'package:result_command/result_command.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:if_inclusivo/ui/core/layout/custom_container_shell.dart';

import '../topic_libras/widgets/midia_card_info.dart';

class LibrasDetails extends StatefulWidget {
  final LibrasViewModel viewModel;
  const LibrasDetails({
    super.key,
    required this.viewModel,

  });

  @override
  State<LibrasDetails> createState() => _LibrasDetailsState();
}

class _LibrasDetailsState extends State<LibrasDetails> {

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.getDeviceType(context) == DeviceScreenType.mobile;
    return isMobile
      ? Scaffold(
      appBar: AppBar(title: Text('Converte Libras'),),
      body: _buildBody(),
    )
        : CustomContainerShell(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: Column(
            children: [
              AppHeader(title: 'CONVERTE LIBRAS'),
              _buildBody()
            ],
          ),
        ),
      ),
    );
  }

  _buildBody(){
    return ListenableBuilder(
        listenable: widget.viewModel.fetchLibrasCmd,
        builder: (context,_) {
          final status = widget.viewModel.fetchLibrasCmd.value;
          switch (status){
            case RunningCommand<LibrasResponseModel>():
              return Center(child: CircularProgressIndicator(),);
            case FailureCommand<LibrasResponseModel>(:final error):
              return Center(
                child: Text(
                  'Erro ao carregar o vídeo: $error',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            case SuccessCommand<LibrasResponseModel>(:final value):
              value;
              return Column(
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth < 900) {
                        return _buildNarrowLayout(value);
                      } else {
                        return _buildWideLayout(context, value);
                      }
                    },
                  ),
                ],
              );
            default: return SizedBox.shrink();
          }


        }
    );
  }

  Widget _buildMidiaContent(BuildContext context,LibrasResponseModel value) {
    String palavra = formatarTexto(value.palavra);
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(kIsWeb)
          LibrasVideoPlayerWeb(videoUrl: value.url)
        else
        LibrasVideoPlayerAndroid(videoUrl: value.url,),
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 8.0),
         child: Text(
           palavra,
           style: Theme.of(context).textTheme.titleLarge,
         ),
       ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: MidiaCardInfo(
              maxWidth: 635,
              textAlign: TextAlign.left,
              title: 'Descrição',
              label: value.descricao,
              titleStyle: Theme.of(context).textTheme.titleMedium,
              labelStyle: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRelatedCard(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        return Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(172, 130, 186, 1),
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Relacionados',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.white),
                ),
              ),
              if(widget.viewModel.loading)
                CircularProgressIndicator(),
              if(!widget.viewModel.loading && widget.viewModel.relacionados.isEmpty )
                Text('Não foi possível carregar...'),
              ...widget.viewModel.relacionados.map((toElement)=> _buildRelatedLinkItem(toElement.palavra, toElement.id))
            ],
          ),
        );
      }
    );
  }

  Widget _buildRelatedLinkItem(String title, int id) {
    String palavra = formatarTexto(title);

    return   Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => MidiaRouter(id).push(context),
        hoverColor: const Color.fromRGBO(230, 170, 252, 0.7019607843137254), // hover suave

        child: Ink(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(172, 130, 186, 1),
            border: Border(top: BorderSide(color: Colors.white, width: 2.5)),
          ),
          child: Text(
            palavra,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context,LibrasResponseModel value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: _buildMidiaContent(context, value)),
        const SizedBox(width: 92),
        Expanded(flex: 1, child: _buildRelatedCard(context)),
      ],
    );
  }

  Widget _buildNarrowLayout(LibrasResponseModel value) {
    return Column(
      children: [
        _buildMidiaContent(context, value),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildRelatedCard(context),
        ),
      ],
    );
  }
}

