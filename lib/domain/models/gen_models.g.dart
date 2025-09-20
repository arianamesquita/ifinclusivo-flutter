// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gen_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactSearchModelImpl _$$ContactSearchModelImplFromJson(
  Map<String, dynamic> json,
) => _$ContactSearchModelImpl(
  id: json['id'] as String,
  nome: json['nome'] as String,
  photoUrl: json['photoUrl'] as String?,
  role: $enumDecode(_$RolesEnumMap, json['role']),
);

Map<String, dynamic> _$$ContactSearchModelImplToJson(
  _$ContactSearchModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'nome': instance.nome,
  'photoUrl': instance.photoUrl,
  'role': _$RolesEnumMap[instance.role]!,
};

const _$RolesEnumMap = {
  Roles.ROLE_ALUNO: 'ROLE_ALUNO',
  Roles.ROLE_ALUNO_NAPNE: 'ROLE_ALUNO_NAPNE',
  Roles.ROLE_PROFESSOR: 'ROLE_PROFESSOR',
  Roles.ROLE_TUTOR: 'ROLE_TUTOR',
  Roles.ROLE_INTERPRETE: 'ROLE_INTERPRETE',
};

_$MessageModelImpl _$$MessageModelImplFromJson(Map<String, dynamic> json) =>
    _$MessageModelImpl(
      id: json['id'] as String,
      authorId: json['authorId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      status: $enumDecode(_$MessageStatusEnumMap, json['status']),
      type: $enumDecode(_$MessageTypeEnumMap, json['type']),
      content: json['content'] as String,
      caption: json['caption'] as String?,
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'authorId': instance.authorId,
      'timestamp': instance.timestamp.toIso8601String(),
      'status': _$MessageStatusEnumMap[instance.status]!,
      'type': _$MessageTypeEnumMap[instance.type]!,
      'content': instance.content,
      'caption': instance.caption,
    };

const _$MessageStatusEnumMap = {
  MessageStatus.sent: 'sent',
  MessageStatus.delivered: 'delivered',
  MessageStatus.read: 'read',
};

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.image: 'image',
  MessageType.video: 'video',
  MessageType.file: 'file',
};

_$ChatPreviewModelImpl _$$ChatPreviewModelImplFromJson(
  Map<String, dynamic> json,
) => _$ChatPreviewModelImpl(
  chatId: json['chatId'] as String,
  otherParticipant: ContactSearchModel.fromJson(
    json['otherParticipant'] as Map<String, dynamic>,
  ),
  lastMessage: MessageModel.fromJson(
    json['lastMessage'] as Map<String, dynamic>,
  ),
  unreadCount: (json['unreadCount'] as num).toInt(),
);

Map<String, dynamic> _$$ChatPreviewModelImplToJson(
  _$ChatPreviewModelImpl instance,
) => <String, dynamic>{
  'chatId': instance.chatId,
  'otherParticipant': instance.otherParticipant,
  'lastMessage': instance.lastMessage,
  'unreadCount': instance.unreadCount,
};
