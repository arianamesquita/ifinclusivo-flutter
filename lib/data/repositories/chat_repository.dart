import '../../domain/models/enums/message_type.dart';
import '../../domain/models/gen_models.dart';
import '../../guards/roles.dart';

abstract class ChatRepository {
  // Fluxo 1: Iniciar nova conversa
  Future<List<ContactSearchModel>> searchUsers({String? name, Roles? role});
  Future<String> startChatWithUser(String otherUserId);

  // Fluxo 2: Conversas existentes
  Stream<List<ChatPreviewModel>> getChatPreviews();
  Stream<List<MessageModel>> getMessages(String chatId);
  Future<void> sendMessage(String chatId, String content, MessageType type, {String? caption});
  Future<void> markMessageAsRead(String chatId, String messageId);
}