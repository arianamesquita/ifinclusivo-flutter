part of 'gen_models.dart';

@freezed
class ContactSearchModel with _$ContactSearchModel {
  const factory ContactSearchModel({
    required String id,
    required String nome,
    String? photoUrl,
    required Roles role,
  }) = _ContactSearchModel;

  factory ContactSearchModel.fromJson(Map<String, dynamic> json) =>
      _$ContactSearchModelFromJson(json);
}
@freezed
class MessageModel with _$MessageModel {
  const factory MessageModel({
    required String id,
    required String authorId,
    required DateTime timestamp,
    required MessageStatus status,
    required MessageType type,
    required String content,
    String? caption,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}

@freezed
class ChatPreviewModel with _$ChatPreviewModel {
  const factory ChatPreviewModel({
    required String chatId,
    required ContactSearchModel otherParticipant,
    required MessageModel lastMessage,
    required int unreadCount,
  }) = _ChatPreviewModel;

  factory ChatPreviewModel.fromJson(Map<String, dynamic> json) =>
      _$ChatPreviewModelFromJson(json);
}