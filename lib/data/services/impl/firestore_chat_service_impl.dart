import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:if_inclusivo/domain/models/enums/message_status.dart';

import '../firestore_chat_service.dart';

class FirestoreChatServiceImpl implements FirestoreChatService {
  @override
  Future<String> findOrCreateChat(String otherUserId) {
    // TODO: implement findOrCreateChat
    throw UnimplementedError();
  }

  @override
  Stream<List<DocumentSnapshot<Object?>>> getChatPreviewsStream() {
    // TODO: implement getChatPreviewsStream
    throw UnimplementedError();
  }

  @override
  Stream<List<DocumentSnapshot<Object?>>> getMessagesStream(String chatId) {
    // TODO: implement getMessagesStream
    throw UnimplementedError();
  }

  @override
  Future<void> sendMessage(String chatId, Map<String, dynamic> messageData) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }

  @override
  Future<void> updateMessageStatus(String chatId, String messageId, MessageStatus status) {
    // TODO: implement updateMessageStatus
    throw UnimplementedError();
  }

}