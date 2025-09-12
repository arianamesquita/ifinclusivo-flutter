import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

import '../ui/pages/auth/sing_up/viewModels/registerViewModel.dart';

List<SingleChildWidget> get providersRemote {
  return <SingleChildWidget>[
    ChangeNotifierProvider<RegisterViewModel>(
      create: (_) => RegisterViewModel(),
    ),
  ];
}