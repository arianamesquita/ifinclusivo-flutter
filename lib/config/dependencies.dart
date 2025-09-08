import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

List<SingleChildWidget> get providersRemote {
  return <SingleChildWidget>[
    Provider<String>(
      create: (_) => "apagar esse provider depois de adicionar outro",
    ),

  ];
}