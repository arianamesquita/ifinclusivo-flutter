import 'package:if_inclusivo/guards/roles.dart';
import 'package:if_inclusivo/ui/pages/chat/chat/widgets/status_label.dart';

class User {
  final String name;
  final String profileImageURL;
  final Roles role;
  final Status status;
  final int chatId;

  User({required this.name, required this.profileImageURL, required this.role, required this.status, required this.chatId});
}