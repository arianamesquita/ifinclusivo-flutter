// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ContactSearchModel _$ContactSearchModelFromJson(Map<String, dynamic> json) {
  return _ContactSearchModel.fromJson(json);
}

/// @nodoc
mixin _$ContactSearchModel {
  String get id => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  Roles get role => throw _privateConstructorUsedError;

  /// Serializes this ContactSearchModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContactSearchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactSearchModelCopyWith<ContactSearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactSearchModelCopyWith<$Res> {
  factory $ContactSearchModelCopyWith(
    ContactSearchModel value,
    $Res Function(ContactSearchModel) then,
  ) = _$ContactSearchModelCopyWithImpl<$Res, ContactSearchModel>;
  @useResult
  $Res call({String id, String nome, String? photoUrl, Roles role});
}

/// @nodoc
class _$ContactSearchModelCopyWithImpl<$Res, $Val extends ContactSearchModel>
    implements $ContactSearchModelCopyWith<$Res> {
  _$ContactSearchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactSearchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? photoUrl = freezed,
    Object? role = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            nome:
                null == nome
                    ? _value.nome
                    : nome // ignore: cast_nullable_to_non_nullable
                        as String,
            photoUrl:
                freezed == photoUrl
                    ? _value.photoUrl
                    : photoUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            role:
                null == role
                    ? _value.role
                    : role // ignore: cast_nullable_to_non_nullable
                        as Roles,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ContactSearchModelImplCopyWith<$Res>
    implements $ContactSearchModelCopyWith<$Res> {
  factory _$$ContactSearchModelImplCopyWith(
    _$ContactSearchModelImpl value,
    $Res Function(_$ContactSearchModelImpl) then,
  ) = __$$ContactSearchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String nome, String? photoUrl, Roles role});
}

/// @nodoc
class __$$ContactSearchModelImplCopyWithImpl<$Res>
    extends _$ContactSearchModelCopyWithImpl<$Res, _$ContactSearchModelImpl>
    implements _$$ContactSearchModelImplCopyWith<$Res> {
  __$$ContactSearchModelImplCopyWithImpl(
    _$ContactSearchModelImpl _value,
    $Res Function(_$ContactSearchModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContactSearchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? photoUrl = freezed,
    Object? role = null,
  }) {
    return _then(
      _$ContactSearchModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        nome:
            null == nome
                ? _value.nome
                : nome // ignore: cast_nullable_to_non_nullable
                    as String,
        photoUrl:
            freezed == photoUrl
                ? _value.photoUrl
                : photoUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        role:
            null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                    as Roles,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactSearchModelImpl implements _ContactSearchModel {
  const _$ContactSearchModelImpl({
    required this.id,
    required this.nome,
    this.photoUrl,
    required this.role,
  });

  factory _$ContactSearchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactSearchModelImplFromJson(json);

  @override
  final String id;
  @override
  final String nome;
  @override
  final String? photoUrl;
  @override
  final Roles role;

  @override
  String toString() {
    return 'ContactSearchModel(id: $id, nome: $nome, photoUrl: $photoUrl, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactSearchModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nome, photoUrl, role);

  /// Create a copy of ContactSearchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactSearchModelImplCopyWith<_$ContactSearchModelImpl> get copyWith =>
      __$$ContactSearchModelImplCopyWithImpl<_$ContactSearchModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactSearchModelImplToJson(this);
  }
}

abstract class _ContactSearchModel implements ContactSearchModel {
  const factory _ContactSearchModel({
    required final String id,
    required final String nome,
    final String? photoUrl,
    required final Roles role,
  }) = _$ContactSearchModelImpl;

  factory _ContactSearchModel.fromJson(Map<String, dynamic> json) =
      _$ContactSearchModelImpl.fromJson;

  @override
  String get id;
  @override
  String get nome;
  @override
  String? get photoUrl;
  @override
  Roles get role;

  /// Create a copy of ContactSearchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactSearchModelImplCopyWith<_$ContactSearchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) {
  return _MessageModel.fromJson(json);
}

/// @nodoc
mixin _$MessageModel {
  String get id => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  MessageStatus get status => throw _privateConstructorUsedError;
  MessageType get type => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;

  /// Serializes this MessageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageModelCopyWith<MessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageModelCopyWith<$Res> {
  factory $MessageModelCopyWith(
    MessageModel value,
    $Res Function(MessageModel) then,
  ) = _$MessageModelCopyWithImpl<$Res, MessageModel>;
  @useResult
  $Res call({
    String id,
    String authorId,
    DateTime timestamp,
    MessageStatus status,
    MessageType type,
    String content,
    String? caption,
  });
}

/// @nodoc
class _$MessageModelCopyWithImpl<$Res, $Val extends MessageModel>
    implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authorId = null,
    Object? timestamp = null,
    Object? status = null,
    Object? type = null,
    Object? content = null,
    Object? caption = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            authorId:
                null == authorId
                    ? _value.authorId
                    : authorId // ignore: cast_nullable_to_non_nullable
                        as String,
            timestamp:
                null == timestamp
                    ? _value.timestamp
                    : timestamp // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as MessageStatus,
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as MessageType,
            content:
                null == content
                    ? _value.content
                    : content // ignore: cast_nullable_to_non_nullable
                        as String,
            caption:
                freezed == caption
                    ? _value.caption
                    : caption // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MessageModelImplCopyWith<$Res>
    implements $MessageModelCopyWith<$Res> {
  factory _$$MessageModelImplCopyWith(
    _$MessageModelImpl value,
    $Res Function(_$MessageModelImpl) then,
  ) = __$$MessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String authorId,
    DateTime timestamp,
    MessageStatus status,
    MessageType type,
    String content,
    String? caption,
  });
}

/// @nodoc
class __$$MessageModelImplCopyWithImpl<$Res>
    extends _$MessageModelCopyWithImpl<$Res, _$MessageModelImpl>
    implements _$$MessageModelImplCopyWith<$Res> {
  __$$MessageModelImplCopyWithImpl(
    _$MessageModelImpl _value,
    $Res Function(_$MessageModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authorId = null,
    Object? timestamp = null,
    Object? status = null,
    Object? type = null,
    Object? content = null,
    Object? caption = freezed,
  }) {
    return _then(
      _$MessageModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        authorId:
            null == authorId
                ? _value.authorId
                : authorId // ignore: cast_nullable_to_non_nullable
                    as String,
        timestamp:
            null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as MessageStatus,
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as MessageType,
        content:
            null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                    as String,
        caption:
            freezed == caption
                ? _value.caption
                : caption // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageModelImpl implements _MessageModel {
  const _$MessageModelImpl({
    required this.id,
    required this.authorId,
    required this.timestamp,
    required this.status,
    required this.type,
    required this.content,
    this.caption,
  });

  factory _$MessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageModelImplFromJson(json);

  @override
  final String id;
  @override
  final String authorId;
  @override
  final DateTime timestamp;
  @override
  final MessageStatus status;
  @override
  final MessageType type;
  @override
  final String content;
  @override
  final String? caption;

  @override
  String toString() {
    return 'MessageModel(id: $id, authorId: $authorId, timestamp: $timestamp, status: $status, type: $type, content: $content, caption: $caption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.caption, caption) || other.caption == caption));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    authorId,
    timestamp,
    status,
    type,
    content,
    caption,
  );

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      __$$MessageModelImplCopyWithImpl<_$MessageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageModelImplToJson(this);
  }
}

abstract class _MessageModel implements MessageModel {
  const factory _MessageModel({
    required final String id,
    required final String authorId,
    required final DateTime timestamp,
    required final MessageStatus status,
    required final MessageType type,
    required final String content,
    final String? caption,
  }) = _$MessageModelImpl;

  factory _MessageModel.fromJson(Map<String, dynamic> json) =
      _$MessageModelImpl.fromJson;

  @override
  String get id;
  @override
  String get authorId;
  @override
  DateTime get timestamp;
  @override
  MessageStatus get status;
  @override
  MessageType get type;
  @override
  String get content;
  @override
  String? get caption;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatPreviewModel _$ChatPreviewModelFromJson(Map<String, dynamic> json) {
  return _ChatPreviewModel.fromJson(json);
}

/// @nodoc
mixin _$ChatPreviewModel {
  String get chatId => throw _privateConstructorUsedError;
  ContactSearchModel get otherParticipant => throw _privateConstructorUsedError;
  MessageModel get lastMessage => throw _privateConstructorUsedError;
  int get unreadCount => throw _privateConstructorUsedError;

  /// Serializes this ChatPreviewModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatPreviewModelCopyWith<ChatPreviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatPreviewModelCopyWith<$Res> {
  factory $ChatPreviewModelCopyWith(
    ChatPreviewModel value,
    $Res Function(ChatPreviewModel) then,
  ) = _$ChatPreviewModelCopyWithImpl<$Res, ChatPreviewModel>;
  @useResult
  $Res call({
    String chatId,
    ContactSearchModel otherParticipant,
    MessageModel lastMessage,
    int unreadCount,
  });

  $ContactSearchModelCopyWith<$Res> get otherParticipant;
  $MessageModelCopyWith<$Res> get lastMessage;
}

/// @nodoc
class _$ChatPreviewModelCopyWithImpl<$Res, $Val extends ChatPreviewModel>
    implements $ChatPreviewModelCopyWith<$Res> {
  _$ChatPreviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? otherParticipant = null,
    Object? lastMessage = null,
    Object? unreadCount = null,
  }) {
    return _then(
      _value.copyWith(
            chatId:
                null == chatId
                    ? _value.chatId
                    : chatId // ignore: cast_nullable_to_non_nullable
                        as String,
            otherParticipant:
                null == otherParticipant
                    ? _value.otherParticipant
                    : otherParticipant // ignore: cast_nullable_to_non_nullable
                        as ContactSearchModel,
            lastMessage:
                null == lastMessage
                    ? _value.lastMessage
                    : lastMessage // ignore: cast_nullable_to_non_nullable
                        as MessageModel,
            unreadCount:
                null == unreadCount
                    ? _value.unreadCount
                    : unreadCount // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }

  /// Create a copy of ChatPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactSearchModelCopyWith<$Res> get otherParticipant {
    return $ContactSearchModelCopyWith<$Res>(_value.otherParticipant, (value) {
      return _then(_value.copyWith(otherParticipant: value) as $Val);
    });
  }

  /// Create a copy of ChatPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageModelCopyWith<$Res> get lastMessage {
    return $MessageModelCopyWith<$Res>(_value.lastMessage, (value) {
      return _then(_value.copyWith(lastMessage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatPreviewModelImplCopyWith<$Res>
    implements $ChatPreviewModelCopyWith<$Res> {
  factory _$$ChatPreviewModelImplCopyWith(
    _$ChatPreviewModelImpl value,
    $Res Function(_$ChatPreviewModelImpl) then,
  ) = __$$ChatPreviewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String chatId,
    ContactSearchModel otherParticipant,
    MessageModel lastMessage,
    int unreadCount,
  });

  @override
  $ContactSearchModelCopyWith<$Res> get otherParticipant;
  @override
  $MessageModelCopyWith<$Res> get lastMessage;
}

/// @nodoc
class __$$ChatPreviewModelImplCopyWithImpl<$Res>
    extends _$ChatPreviewModelCopyWithImpl<$Res, _$ChatPreviewModelImpl>
    implements _$$ChatPreviewModelImplCopyWith<$Res> {
  __$$ChatPreviewModelImplCopyWithImpl(
    _$ChatPreviewModelImpl _value,
    $Res Function(_$ChatPreviewModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? otherParticipant = null,
    Object? lastMessage = null,
    Object? unreadCount = null,
  }) {
    return _then(
      _$ChatPreviewModelImpl(
        chatId:
            null == chatId
                ? _value.chatId
                : chatId // ignore: cast_nullable_to_non_nullable
                    as String,
        otherParticipant:
            null == otherParticipant
                ? _value.otherParticipant
                : otherParticipant // ignore: cast_nullable_to_non_nullable
                    as ContactSearchModel,
        lastMessage:
            null == lastMessage
                ? _value.lastMessage
                : lastMessage // ignore: cast_nullable_to_non_nullable
                    as MessageModel,
        unreadCount:
            null == unreadCount
                ? _value.unreadCount
                : unreadCount // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatPreviewModelImpl implements _ChatPreviewModel {
  const _$ChatPreviewModelImpl({
    required this.chatId,
    required this.otherParticipant,
    required this.lastMessage,
    required this.unreadCount,
  });

  factory _$ChatPreviewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatPreviewModelImplFromJson(json);

  @override
  final String chatId;
  @override
  final ContactSearchModel otherParticipant;
  @override
  final MessageModel lastMessage;
  @override
  final int unreadCount;

  @override
  String toString() {
    return 'ChatPreviewModel(chatId: $chatId, otherParticipant: $otherParticipant, lastMessage: $lastMessage, unreadCount: $unreadCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatPreviewModelImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.otherParticipant, otherParticipant) ||
                other.otherParticipant == otherParticipant) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    chatId,
    otherParticipant,
    lastMessage,
    unreadCount,
  );

  /// Create a copy of ChatPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatPreviewModelImplCopyWith<_$ChatPreviewModelImpl> get copyWith =>
      __$$ChatPreviewModelImplCopyWithImpl<_$ChatPreviewModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatPreviewModelImplToJson(this);
  }
}

abstract class _ChatPreviewModel implements ChatPreviewModel {
  const factory _ChatPreviewModel({
    required final String chatId,
    required final ContactSearchModel otherParticipant,
    required final MessageModel lastMessage,
    required final int unreadCount,
  }) = _$ChatPreviewModelImpl;

  factory _ChatPreviewModel.fromJson(Map<String, dynamic> json) =
      _$ChatPreviewModelImpl.fromJson;

  @override
  String get chatId;
  @override
  ContactSearchModel get otherParticipant;
  @override
  MessageModel get lastMessage;
  @override
  int get unreadCount;

  /// Create a copy of ChatPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatPreviewModelImplCopyWith<_$ChatPreviewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginatedResponse<T> _$PaginatedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object?) fromJsonT,
) {
  return _PaginatedResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$PaginatedResponse<T> {
  List<T> get content => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalElements => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  int get number =>
      throw _privateConstructorUsedError; // Número da página atual
  bool get last => throw _privateConstructorUsedError;
  bool get first => throw _privateConstructorUsedError;
  bool get empty => throw _privateConstructorUsedError;

  /// Serializes this PaginatedResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PaginatedResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedResponseCopyWith<T, PaginatedResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedResponseCopyWith<T, $Res> {
  factory $PaginatedResponseCopyWith(
    PaginatedResponse<T> value,
    $Res Function(PaginatedResponse<T>) then,
  ) = _$PaginatedResponseCopyWithImpl<T, $Res, PaginatedResponse<T>>;
  @useResult
  $Res call({
    List<T> content,
    int totalPages,
    int totalElements,
    int size,
    int number,
    bool last,
    bool first,
    bool empty,
  });
}

/// @nodoc
class _$PaginatedResponseCopyWithImpl<
  T,
  $Res,
  $Val extends PaginatedResponse<T>
>
    implements $PaginatedResponseCopyWith<T, $Res> {
  _$PaginatedResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? totalPages = null,
    Object? totalElements = null,
    Object? size = null,
    Object? number = null,
    Object? last = null,
    Object? first = null,
    Object? empty = null,
  }) {
    return _then(
      _value.copyWith(
            content:
                null == content
                    ? _value.content
                    : content // ignore: cast_nullable_to_non_nullable
                        as List<T>,
            totalPages:
                null == totalPages
                    ? _value.totalPages
                    : totalPages // ignore: cast_nullable_to_non_nullable
                        as int,
            totalElements:
                null == totalElements
                    ? _value.totalElements
                    : totalElements // ignore: cast_nullable_to_non_nullable
                        as int,
            size:
                null == size
                    ? _value.size
                    : size // ignore: cast_nullable_to_non_nullable
                        as int,
            number:
                null == number
                    ? _value.number
                    : number // ignore: cast_nullable_to_non_nullable
                        as int,
            last:
                null == last
                    ? _value.last
                    : last // ignore: cast_nullable_to_non_nullable
                        as bool,
            first:
                null == first
                    ? _value.first
                    : first // ignore: cast_nullable_to_non_nullable
                        as bool,
            empty:
                null == empty
                    ? _value.empty
                    : empty // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaginatedResponseImplCopyWith<T, $Res>
    implements $PaginatedResponseCopyWith<T, $Res> {
  factory _$$PaginatedResponseImplCopyWith(
    _$PaginatedResponseImpl<T> value,
    $Res Function(_$PaginatedResponseImpl<T>) then,
  ) = __$$PaginatedResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({
    List<T> content,
    int totalPages,
    int totalElements,
    int size,
    int number,
    bool last,
    bool first,
    bool empty,
  });
}

/// @nodoc
class __$$PaginatedResponseImplCopyWithImpl<T, $Res>
    extends _$PaginatedResponseCopyWithImpl<T, $Res, _$PaginatedResponseImpl<T>>
    implements _$$PaginatedResponseImplCopyWith<T, $Res> {
  __$$PaginatedResponseImplCopyWithImpl(
    _$PaginatedResponseImpl<T> _value,
    $Res Function(_$PaginatedResponseImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of PaginatedResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? totalPages = null,
    Object? totalElements = null,
    Object? size = null,
    Object? number = null,
    Object? last = null,
    Object? first = null,
    Object? empty = null,
  }) {
    return _then(
      _$PaginatedResponseImpl<T>(
        content:
            null == content
                ? _value._content
                : content // ignore: cast_nullable_to_non_nullable
                    as List<T>,
        totalPages:
            null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                    as int,
        totalElements:
            null == totalElements
                ? _value.totalElements
                : totalElements // ignore: cast_nullable_to_non_nullable
                    as int,
        size:
            null == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                    as int,
        number:
            null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                    as int,
        last:
            null == last
                ? _value.last
                : last // ignore: cast_nullable_to_non_nullable
                    as bool,
        first:
            null == first
                ? _value.first
                : first // ignore: cast_nullable_to_non_nullable
                    as bool,
        empty:
            null == empty
                ? _value.empty
                : empty // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$PaginatedResponseImpl<T> implements _PaginatedResponse<T> {
  const _$PaginatedResponseImpl({
    required final List<T> content,
    required this.totalPages,
    required this.totalElements,
    required this.size,
    required this.number,
    required this.last,
    required this.first,
    required this.empty,
  }) : _content = content;

  factory _$PaginatedResponseImpl.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$$PaginatedResponseImplFromJson(json, fromJsonT);

  final List<T> _content;
  @override
  List<T> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final int totalPages;
  @override
  final int totalElements;
  @override
  final int size;
  @override
  final int number;
  // Número da página atual
  @override
  final bool last;
  @override
  final bool first;
  @override
  final bool empty;

  @override
  String toString() {
    return 'PaginatedResponse<$T>(content: $content, totalPages: $totalPages, totalElements: $totalElements, size: $size, number: $number, last: $last, first: $first, empty: $empty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedResponseImpl<T> &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalElements, totalElements) ||
                other.totalElements == totalElements) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.empty, empty) || other.empty == empty));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_content),
    totalPages,
    totalElements,
    size,
    number,
    last,
    first,
    empty,
  );

  /// Create a copy of PaginatedResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedResponseImplCopyWith<T, _$PaginatedResponseImpl<T>>
  get copyWith =>
      __$$PaginatedResponseImplCopyWithImpl<T, _$PaginatedResponseImpl<T>>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$PaginatedResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _PaginatedResponse<T> implements PaginatedResponse<T> {
  const factory _PaginatedResponse({
    required final List<T> content,
    required final int totalPages,
    required final int totalElements,
    required final int size,
    required final int number,
    required final bool last,
    required final bool first,
    required final bool empty,
  }) = _$PaginatedResponseImpl<T>;

  factory _PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) = _$PaginatedResponseImpl<T>.fromJson;

  @override
  List<T> get content;
  @override
  int get totalPages;
  @override
  int get totalElements;
  @override
  int get size;
  @override
  int get number; // Número da página atual
  @override
  bool get last;
  @override
  bool get first;
  @override
  bool get empty;

  /// Create a copy of PaginatedResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedResponseImplCopyWith<T, _$PaginatedResponseImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}
