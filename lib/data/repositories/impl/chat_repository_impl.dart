import 'package:if_inclusivo/domain/models/enums/message_type.dart';

import 'package:if_inclusivo/domain/models/gen_models.dart';

import 'package:if_inclusivo/guards/roles.dart';

import '../../services/firestore_chat_service.dart';
import '../../services/user_api_service.dart';
import '../chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final UserApiService _userApiService;
  final FirestoreChatService _firestoreChatService;

  ChatRepositoryImpl({
    required UserApiService userApiService,
    required FirestoreChatService firestoreChatService,
  }) : _userApiService = userApiService,
       _firestoreChatService = firestoreChatService;

  @override
  Stream<List<ChatPreviewModel>> getChatPreviews() {
    // TODO: implement getChatPreviews
    throw UnimplementedError();
  }

  @override
  Stream<List<MessageModel>> getMessages(String chatId) {
    // TODO: implement getMessages
    throw UnimplementedError();
  }

  @override
  Future<void> markMessageAsRead(String chatId, String messageId) {
    // TODO: implement markMessageAsRead
    throw UnimplementedError();
  }

  @override
  Future<List<ContactSearchModel>> searchUsers({String? name, Roles? role}) {
    // TODO: implement searchUsers
    throw UnimplementedError();
  }

  @override
  Future<void> sendMessage(
    String chatId,
    String content,
    MessageType type, {
    String? caption,
  }) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }

  @override
  Future<String> startChatWithUser(String otherUserId) {
    // TODO: implement startChatWithUser
    throw UnimplementedError();
  }
}
