import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/models/enums/message_status.dart';

abstract class FirestoreChatService {

  Stream<List<DocumentSnapshot>> getChatPreviewsStream();
  Stream<List<DocumentSnapshot>> getMessagesStream(String chatId);
  Future<void> sendMessage(String chatId, Map<String, dynamic> messageData);
  Future<void> updateMessageStatus(String chatId, String messageId, MessageStatus status);
  Future<String> findOrCreateChat(String otherUserId);
}