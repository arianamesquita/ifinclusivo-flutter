// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gen_simple_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SimpleLibrasModel _$SimpleLibrasModelFromJson(Map<String, dynamic> json) {
  return _SimpleLibrasModel.fromJson(json);
}

/// @nodoc
mixin _$SimpleLibrasModel {
  String get id => throw _privateConstructorUsedError;
  String get palavra => throw _privateConstructorUsedError;
  Categorias get categorias => throw _privateConstructorUsedError;

  /// Serializes this SimpleLibrasModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SimpleLibrasModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SimpleLibrasModelCopyWith<SimpleLibrasModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleLibrasModelCopyWith<$Res> {
  factory $SimpleLibrasModelCopyWith(
    SimpleLibrasModel value,
    $Res Function(SimpleLibrasModel) then,
  ) = _$SimpleLibrasModelCopyWithImpl<$Res, SimpleLibrasModel>;
  @useResult
  $Res call({String id, String palavra, Categorias categorias});
}

/// @nodoc
class _$SimpleLibrasModelCopyWithImpl<$Res, $Val extends SimpleLibrasModel>
    implements $SimpleLibrasModelCopyWith<$Res> {
  _$SimpleLibrasModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SimpleLibrasModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? palavra = null,
    Object? categorias = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            palavra:
                null == palavra
                    ? _value.palavra
                    : palavra // ignore: cast_nullable_to_non_nullable
                        as String,
            categorias:
                null == categorias
                    ? _value.categorias
                    : categorias // ignore: cast_nullable_to_non_nullable
                        as Categorias,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SimpleLibrasModelImplCopyWith<$Res>
    implements $SimpleLibrasModelCopyWith<$Res> {
  factory _$$SimpleLibrasModelImplCopyWith(
    _$SimpleLibrasModelImpl value,
    $Res Function(_$SimpleLibrasModelImpl) then,
  ) = __$$SimpleLibrasModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String palavra, Categorias categorias});
}

/// @nodoc
class __$$SimpleLibrasModelImplCopyWithImpl<$Res>
    extends _$SimpleLibrasModelCopyWithImpl<$Res, _$SimpleLibrasModelImpl>
    implements _$$SimpleLibrasModelImplCopyWith<$Res> {
  __$$SimpleLibrasModelImplCopyWithImpl(
    _$SimpleLibrasModelImpl _value,
    $Res Function(_$SimpleLibrasModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SimpleLibrasModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? palavra = null,
    Object? categorias = null,
  }) {
    return _then(
      _$SimpleLibrasModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        palavra:
            null == palavra
                ? _value.palavra
                : palavra // ignore: cast_nullable_to_non_nullable
                    as String,
        categorias:
            null == categorias
                ? _value.categorias
                : categorias // ignore: cast_nullable_to_non_nullable
                    as Categorias,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SimpleLibrasModelImpl implements _SimpleLibrasModel {
  const _$SimpleLibrasModelImpl({
    required this.id,
    required this.palavra,
    required this.categorias,
  });

  factory _$SimpleLibrasModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimpleLibrasModelImplFromJson(json);

  @override
  final String id;
  @override
  final String palavra;
  @override
  final Categorias categorias;

  @override
  String toString() {
    return 'SimpleLibrasModel(id: $id, palavra: $palavra, categorias: $categorias)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleLibrasModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.palavra, palavra) || other.palavra == palavra) &&
            (identical(other.categorias, categorias) ||
                other.categorias == categorias));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, palavra, categorias);

  /// Create a copy of SimpleLibrasModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleLibrasModelImplCopyWith<_$SimpleLibrasModelImpl> get copyWith =>
      __$$SimpleLibrasModelImplCopyWithImpl<_$SimpleLibrasModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SimpleLibrasModelImplToJson(this);
  }
}

abstract class _SimpleLibrasModel implements SimpleLibrasModel {
  const factory _SimpleLibrasModel({
    required final String id,
    required final String palavra,
    required final Categorias categorias,
  }) = _$SimpleLibrasModelImpl;

  factory _SimpleLibrasModel.fromJson(Map<String, dynamic> json) =
      _$SimpleLibrasModelImpl.fromJson;

  @override
  String get id;
  @override
  String get palavra;
  @override
  Categorias get categorias;

  /// Create a copy of SimpleLibrasModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimpleLibrasModelImplCopyWith<_$SimpleLibrasModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SimpleTopicoModel _$SimpleTopicoModelFromJson(Map<String, dynamic> json) {
  return _SimpleTopicoModel.fromJson(json);
}

/// @nodoc
mixin _$SimpleTopicoModel {
  String get id => throw _privateConstructorUsedError;
  String get titulo => throw _privateConstructorUsedError;
  String get descricao => throw _privateConstructorUsedError;
  DateTime get dataCriacao => throw _privateConstructorUsedError;
  SimpleUsuarioModel get professor => throw _privateConstructorUsedError;

  /// Serializes this SimpleTopicoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SimpleTopicoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SimpleTopicoModelCopyWith<SimpleTopicoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleTopicoModelCopyWith<$Res> {
  factory $SimpleTopicoModelCopyWith(
    SimpleTopicoModel value,
    $Res Function(SimpleTopicoModel) then,
  ) = _$SimpleTopicoModelCopyWithImpl<$Res, SimpleTopicoModel>;
  @useResult
  $Res call({
    String id,
    String titulo,
    String descricao,
    DateTime dataCriacao,
    SimpleUsuarioModel professor,
  });

  $SimpleUsuarioModelCopyWith<$Res> get professor;
}

/// @nodoc
class _$SimpleTopicoModelCopyWithImpl<$Res, $Val extends SimpleTopicoModel>
    implements $SimpleTopicoModelCopyWith<$Res> {
  _$SimpleTopicoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SimpleTopicoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titulo = null,
    Object? descricao = null,
    Object? dataCriacao = null,
    Object? professor = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            titulo:
                null == titulo
                    ? _value.titulo
                    : titulo // ignore: cast_nullable_to_non_nullable
                        as String,
            descricao:
                null == descricao
                    ? _value.descricao
                    : descricao // ignore: cast_nullable_to_non_nullable
                        as String,
            dataCriacao:
                null == dataCriacao
                    ? _value.dataCriacao
                    : dataCriacao // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            professor:
                null == professor
                    ? _value.professor
                    : professor // ignore: cast_nullable_to_non_nullable
                        as SimpleUsuarioModel,
          )
          as $Val,
    );
  }

  /// Create a copy of SimpleTopicoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SimpleUsuarioModelCopyWith<$Res> get professor {
    return $SimpleUsuarioModelCopyWith<$Res>(_value.professor, (value) {
      return _then(_value.copyWith(professor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SimpleTopicoModelImplCopyWith<$Res>
    implements $SimpleTopicoModelCopyWith<$Res> {
  factory _$$SimpleTopicoModelImplCopyWith(
    _$SimpleTopicoModelImpl value,
    $Res Function(_$SimpleTopicoModelImpl) then,
  ) = __$$SimpleTopicoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String titulo,
    String descricao,
    DateTime dataCriacao,
    SimpleUsuarioModel professor,
  });

  @override
  $SimpleUsuarioModelCopyWith<$Res> get professor;
}

/// @nodoc
class __$$SimpleTopicoModelImplCopyWithImpl<$Res>
    extends _$SimpleTopicoModelCopyWithImpl<$Res, _$SimpleTopicoModelImpl>
    implements _$$SimpleTopicoModelImplCopyWith<$Res> {
  __$$SimpleTopicoModelImplCopyWithImpl(
    _$SimpleTopicoModelImpl _value,
    $Res Function(_$SimpleTopicoModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SimpleTopicoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titulo = null,
    Object? descricao = null,
    Object? dataCriacao = null,
    Object? professor = null,
  }) {
    return _then(
      _$SimpleTopicoModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        titulo:
            null == titulo
                ? _value.titulo
                : titulo // ignore: cast_nullable_to_non_nullable
                    as String,
        descricao:
            null == descricao
                ? _value.descricao
                : descricao // ignore: cast_nullable_to_non_nullable
                    as String,
        dataCriacao:
            null == dataCriacao
                ? _value.dataCriacao
                : dataCriacao // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        professor:
            null == professor
                ? _value.professor
                : professor // ignore: cast_nullable_to_non_nullable
                    as SimpleUsuarioModel,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SimpleTopicoModelImpl implements _SimpleTopicoModel {
  const _$SimpleTopicoModelImpl({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.dataCriacao,
    required this.professor,
  });

  factory _$SimpleTopicoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimpleTopicoModelImplFromJson(json);

  @override
  final String id;
  @override
  final String titulo;
  @override
  final String descricao;
  @override
  final DateTime dataCriacao;
  @override
  final SimpleUsuarioModel professor;

  @override
  String toString() {
    return 'SimpleTopicoModel(id: $id, titulo: $titulo, descricao: $descricao, dataCriacao: $dataCriacao, professor: $professor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleTopicoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.titulo, titulo) || other.titulo == titulo) &&
            (identical(other.descricao, descricao) ||
                other.descricao == descricao) &&
            (identical(other.dataCriacao, dataCriacao) ||
                other.dataCriacao == dataCriacao) &&
            (identical(other.professor, professor) ||
                other.professor == professor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, titulo, descricao, dataCriacao, professor);

  /// Create a copy of SimpleTopicoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleTopicoModelImplCopyWith<_$SimpleTopicoModelImpl> get copyWith =>
      __$$SimpleTopicoModelImplCopyWithImpl<_$SimpleTopicoModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SimpleTopicoModelImplToJson(this);
  }
}

abstract class _SimpleTopicoModel implements SimpleTopicoModel {
  const factory _SimpleTopicoModel({
    required final String id,
    required final String titulo,
    required final String descricao,
    required final DateTime dataCriacao,
    required final SimpleUsuarioModel professor,
  }) = _$SimpleTopicoModelImpl;

  factory _SimpleTopicoModel.fromJson(Map<String, dynamic> json) =
      _$SimpleTopicoModelImpl.fromJson;

  @override
  String get id;
  @override
  String get titulo;
  @override
  String get descricao;
  @override
  DateTime get dataCriacao;
  @override
  SimpleUsuarioModel get professor;

  /// Create a copy of SimpleTopicoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimpleTopicoModelImplCopyWith<_$SimpleTopicoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SimplePublicacaoModel _$SimplePublicacaoModelFromJson(
  Map<String, dynamic> json,
) {
  return _SimplePublicacaoModel.fromJson(json);
}

/// @nodoc
mixin _$SimplePublicacaoModel {
  String get id => throw _privateConstructorUsedError;
  String get titulo => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String? get urlVideo => throw _privateConstructorUsedError;
  String? get urlFoto => throw _privateConstructorUsedError;
  DateTime get dataCriacao => throw _privateConstructorUsedError;
  SimpleUsuarioModel get usuario => throw _privateConstructorUsedError;

  /// Serializes this SimplePublicacaoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SimplePublicacaoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SimplePublicacaoModelCopyWith<SimplePublicacaoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimplePublicacaoModelCopyWith<$Res> {
  factory $SimplePublicacaoModelCopyWith(
    SimplePublicacaoModel value,
    $Res Function(SimplePublicacaoModel) then,
  ) = _$SimplePublicacaoModelCopyWithImpl<$Res, SimplePublicacaoModel>;
  @useResult
  $Res call({
    String id,
    String titulo,
    String text,
    String? urlVideo,
    String? urlFoto,
    DateTime dataCriacao,
    SimpleUsuarioModel usuario,
  });

  $SimpleUsuarioModelCopyWith<$Res> get usuario;
}

/// @nodoc
class _$SimplePublicacaoModelCopyWithImpl<
  $Res,
  $Val extends SimplePublicacaoModel
>
    implements $SimplePublicacaoModelCopyWith<$Res> {
  _$SimplePublicacaoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SimplePublicacaoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titulo = null,
    Object? text = null,
    Object? urlVideo = freezed,
    Object? urlFoto = freezed,
    Object? dataCriacao = null,
    Object? usuario = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            titulo:
                null == titulo
                    ? _value.titulo
                    : titulo // ignore: cast_nullable_to_non_nullable
                        as String,
            text:
                null == text
                    ? _value.text
                    : text // ignore: cast_nullable_to_non_nullable
                        as String,
            urlVideo:
                freezed == urlVideo
                    ? _value.urlVideo
                    : urlVideo // ignore: cast_nullable_to_non_nullable
                        as String?,
            urlFoto:
                freezed == urlFoto
                    ? _value.urlFoto
                    : urlFoto // ignore: cast_nullable_to_non_nullable
                        as String?,
            dataCriacao:
                null == dataCriacao
                    ? _value.dataCriacao
                    : dataCriacao // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            usuario:
                null == usuario
                    ? _value.usuario
                    : usuario // ignore: cast_nullable_to_non_nullable
                        as SimpleUsuarioModel,
          )
          as $Val,
    );
  }

  /// Create a copy of SimplePublicacaoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SimpleUsuarioModelCopyWith<$Res> get usuario {
    return $SimpleUsuarioModelCopyWith<$Res>(_value.usuario, (value) {
      return _then(_value.copyWith(usuario: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SimplePublicacaoModelImplCopyWith<$Res>
    implements $SimplePublicacaoModelCopyWith<$Res> {
  factory _$$SimplePublicacaoModelImplCopyWith(
    _$SimplePublicacaoModelImpl value,
    $Res Function(_$SimplePublicacaoModelImpl) then,
  ) = __$$SimplePublicacaoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String titulo,
    String text,
    String? urlVideo,
    String? urlFoto,
    DateTime dataCriacao,
    SimpleUsuarioModel usuario,
  });

  @override
  $SimpleUsuarioModelCopyWith<$Res> get usuario;
}

/// @nodoc
class __$$SimplePublicacaoModelImplCopyWithImpl<$Res>
    extends
        _$SimplePublicacaoModelCopyWithImpl<$Res, _$SimplePublicacaoModelImpl>
    implements _$$SimplePublicacaoModelImplCopyWith<$Res> {
  __$$SimplePublicacaoModelImplCopyWithImpl(
    _$SimplePublicacaoModelImpl _value,
    $Res Function(_$SimplePublicacaoModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SimplePublicacaoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titulo = null,
    Object? text = null,
    Object? urlVideo = freezed,
    Object? urlFoto = freezed,
    Object? dataCriacao = null,
    Object? usuario = null,
  }) {
    return _then(
      _$SimplePublicacaoModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        titulo:
            null == titulo
                ? _value.titulo
                : titulo // ignore: cast_nullable_to_non_nullable
                    as String,
        text:
            null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                    as String,
        urlVideo:
            freezed == urlVideo
                ? _value.urlVideo
                : urlVideo // ignore: cast_nullable_to_non_nullable
                    as String?,
        urlFoto:
            freezed == urlFoto
                ? _value.urlFoto
                : urlFoto // ignore: cast_nullable_to_non_nullable
                    as String?,
        dataCriacao:
            null == dataCriacao
                ? _value.dataCriacao
                : dataCriacao // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        usuario:
            null == usuario
                ? _value.usuario
                : usuario // ignore: cast_nullable_to_non_nullable
                    as SimpleUsuarioModel,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SimplePublicacaoModelImpl implements _SimplePublicacaoModel {
  const _$SimplePublicacaoModelImpl({
    required this.id,
    required this.titulo,
    required this.text,
    this.urlVideo,
    this.urlFoto,
    required this.dataCriacao,
    required this.usuario,
  });

  factory _$SimplePublicacaoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimplePublicacaoModelImplFromJson(json);

  @override
  final String id;
  @override
  final String titulo;
  @override
  final String text;
  @override
  final String? urlVideo;
  @override
  final String? urlFoto;
  @override
  final DateTime dataCriacao;
  @override
  final SimpleUsuarioModel usuario;

  @override
  String toString() {
    return 'SimplePublicacaoModel(id: $id, titulo: $titulo, text: $text, urlVideo: $urlVideo, urlFoto: $urlFoto, dataCriacao: $dataCriacao, usuario: $usuario)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimplePublicacaoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.titulo, titulo) || other.titulo == titulo) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.urlVideo, urlVideo) ||
                other.urlVideo == urlVideo) &&
            (identical(other.urlFoto, urlFoto) || other.urlFoto == urlFoto) &&
            (identical(other.dataCriacao, dataCriacao) ||
                other.dataCriacao == dataCriacao) &&
            (identical(other.usuario, usuario) || other.usuario == usuario));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    titulo,
    text,
    urlVideo,
    urlFoto,
    dataCriacao,
    usuario,
  );

  /// Create a copy of SimplePublicacaoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimplePublicacaoModelImplCopyWith<_$SimplePublicacaoModelImpl>
  get copyWith =>
      __$$SimplePublicacaoModelImplCopyWithImpl<_$SimplePublicacaoModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SimplePublicacaoModelImplToJson(this);
  }
}

abstract class _SimplePublicacaoModel implements SimplePublicacaoModel {
  const factory _SimplePublicacaoModel({
    required final String id,
    required final String titulo,
    required final String text,
    final String? urlVideo,
    final String? urlFoto,
    required final DateTime dataCriacao,
    required final SimpleUsuarioModel usuario,
  }) = _$SimplePublicacaoModelImpl;

  factory _SimplePublicacaoModel.fromJson(Map<String, dynamic> json) =
      _$SimplePublicacaoModelImpl.fromJson;

  @override
  String get id;
  @override
  String get titulo;
  @override
  String get text;
  @override
  String? get urlVideo;
  @override
  String? get urlFoto;
  @override
  DateTime get dataCriacao;
  @override
  SimpleUsuarioModel get usuario;

  /// Create a copy of SimplePublicacaoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimplePublicacaoModelImplCopyWith<_$SimplePublicacaoModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SimpleComentarioModel _$SimpleComentarioModelFromJson(
  Map<String, dynamic> json,
) {
  return _SimpleComentarioModel.fromJson(json);
}

/// @nodoc
mixin _$SimpleComentarioModel {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get dataCriacao => throw _privateConstructorUsedError;

  /// Serializes this SimpleComentarioModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SimpleComentarioModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SimpleComentarioModelCopyWith<SimpleComentarioModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleComentarioModelCopyWith<$Res> {
  factory $SimpleComentarioModelCopyWith(
    SimpleComentarioModel value,
    $Res Function(SimpleComentarioModel) then,
  ) = _$SimpleComentarioModelCopyWithImpl<$Res, SimpleComentarioModel>;
  @useResult
  $Res call({String id, String content, DateTime dataCriacao});
}

/// @nodoc
class _$SimpleComentarioModelCopyWithImpl<
  $Res,
  $Val extends SimpleComentarioModel
>
    implements $SimpleComentarioModelCopyWith<$Res> {
  _$SimpleComentarioModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SimpleComentarioModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? dataCriacao = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            content:
                null == content
                    ? _value.content
                    : content // ignore: cast_nullable_to_non_nullable
                        as String,
            dataCriacao:
                null == dataCriacao
                    ? _value.dataCriacao
                    : dataCriacao // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SimpleComentarioModelImplCopyWith<$Res>
    implements $SimpleComentarioModelCopyWith<$Res> {
  factory _$$SimpleComentarioModelImplCopyWith(
    _$SimpleComentarioModelImpl value,
    $Res Function(_$SimpleComentarioModelImpl) then,
  ) = __$$SimpleComentarioModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String content, DateTime dataCriacao});
}

/// @nodoc
class __$$SimpleComentarioModelImplCopyWithImpl<$Res>
    extends
        _$SimpleComentarioModelCopyWithImpl<$Res, _$SimpleComentarioModelImpl>
    implements _$$SimpleComentarioModelImplCopyWith<$Res> {
  __$$SimpleComentarioModelImplCopyWithImpl(
    _$SimpleComentarioModelImpl _value,
    $Res Function(_$SimpleComentarioModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SimpleComentarioModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? dataCriacao = null,
  }) {
    return _then(
      _$SimpleComentarioModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        content:
            null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                    as String,
        dataCriacao:
            null == dataCriacao
                ? _value.dataCriacao
                : dataCriacao // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SimpleComentarioModelImpl implements _SimpleComentarioModel {
  const _$SimpleComentarioModelImpl({
    required this.id,
    required this.content,
    required this.dataCriacao,
  });

  factory _$SimpleComentarioModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimpleComentarioModelImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final DateTime dataCriacao;

  @override
  String toString() {
    return 'SimpleComentarioModel(id: $id, content: $content, dataCriacao: $dataCriacao)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleComentarioModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.dataCriacao, dataCriacao) ||
                other.dataCriacao == dataCriacao));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, content, dataCriacao);

  /// Create a copy of SimpleComentarioModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleComentarioModelImplCopyWith<_$SimpleComentarioModelImpl>
  get copyWith =>
      __$$SimpleComentarioModelImplCopyWithImpl<_$SimpleComentarioModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SimpleComentarioModelImplToJson(this);
  }
}

abstract class _SimpleComentarioModel implements SimpleComentarioModel {
  const factory _SimpleComentarioModel({
    required final String id,
    required final String content,
    required final DateTime dataCriacao,
  }) = _$SimpleComentarioModelImpl;

  factory _SimpleComentarioModel.fromJson(Map<String, dynamic> json) =
      _$SimpleComentarioModelImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  DateTime get dataCriacao;

  /// Create a copy of SimpleComentarioModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimpleComentarioModelImplCopyWith<_$SimpleComentarioModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SimpleUsuarioModel _$SimpleUsuarioModelFromJson(Map<String, dynamic> json) {
  switch (json['roles']) {
    case 'usuario':
      return _SimpleUsuarioModelUsuario.fromJson(json);
    case 'tutor':
      return _SimpleTutorModel.fromJson(json);
    case 'professor':
      return _SimpleProfessorModel.fromJson(json);
    case 'aluno':
      return _SimpleAlunoModel.fromJson(json);
    case 'alunoNapne':
      return _SimpleAlunoNapneModel.fromJson(json);
    case 'interprete':
      return _SimpleInterpreteModel.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'roles',
        'SimpleUsuarioModel',
        'Invalid union type "${json['roles']}"!',
      );
  }
}

/// @nodoc
mixin _$SimpleUsuarioModel {
  String get id => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  String get matricula => throw _privateConstructorUsedError;
  String? get biografia => throw _privateConstructorUsedError;
  DateTime get dataCriacao => throw _privateConstructorUsedError;
  List<Roles> get roles => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
    )
    usuario,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
    )
    tutor,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String formacao,
    )
    professor,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
    )
    aluno,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
      String condicao,
      String necessidadeEspecial,
      String necessidadeEscolar,
    )
    alunoNapne,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
      double salary,
    )
    interprete,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
    )?
    usuario,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
    )?
    tutor,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String formacao,
    )?
    professor,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
    )?
    aluno,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
      String condicao,
      String necessidadeEspecial,
      String necessidadeEscolar,
    )?
    alunoNapne,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
      double salary,
    )?
    interprete,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
    )?
    usuario,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
    )?
    tutor,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String formacao,
    )?
    professor,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
    )?
    aluno,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
      String condicao,
      String necessidadeEspecial,
      String necessidadeEscolar,
    )?
    alunoNapne,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
      double salary,
    )?
    interprete,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SimpleUsuarioModelUsuario value) usuario,
    required TResult Function(_SimpleTutorModel value) tutor,
    required TResult Function(_SimpleProfessorModel value) professor,
    required TResult Function(_SimpleAlunoModel value) aluno,
    required TResult Function(_SimpleAlunoNapneModel value) alunoNapne,
    required TResult Function(_SimpleInterpreteModel value) interprete,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SimpleUsuarioModelUsuario value)? usuario,
    TResult? Function(_SimpleTutorModel value)? tutor,
    TResult? Function(_SimpleProfessorModel value)? professor,
    TResult? Function(_SimpleAlunoModel value)? aluno,
    TResult? Function(_SimpleAlunoNapneModel value)? alunoNapne,
    TResult? Function(_SimpleInterpreteModel value)? interprete,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SimpleUsuarioModelUsuario value)? usuario,
    TResult Function(_SimpleTutorModel value)? tutor,
    TResult Function(_SimpleProfessorModel value)? professor,
    TResult Function(_SimpleAlunoModel value)? aluno,
    TResult Function(_SimpleAlunoNapneModel value)? alunoNapne,
    TResult Function(_SimpleInterpreteModel value)? interprete,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this SimpleUsuarioModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SimpleUsuarioModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SimpleUsuarioModelCopyWith<SimpleUsuarioModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleUsuarioModelCopyWith<$Res> {
  factory $SimpleUsuarioModelCopyWith(
    SimpleUsuarioModel value,
    $Res Function(SimpleUsuarioModel) then,
  ) = _$SimpleUsuarioModelCopyWithImpl<$Res, SimpleUsuarioModel>;
  @useResult
  $Res call({
    String id,
    String nome,
    String matricula,
    String? biografia,
    DateTime dataCriacao,
    List<Roles> roles,
  });
}

/// @nodoc
class _$SimpleUsuarioModelCopyWithImpl<$Res, $Val extends SimpleUsuarioModel>
    implements $SimpleUsuarioModelCopyWith<$Res> {
  _$SimpleUsuarioModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SimpleUsuarioModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? matricula = null,
    Object? biografia = freezed,
    Object? dataCriacao = null,
    Object? roles = null,
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
            matricula:
                null == matricula
                    ? _value.matricula
                    : matricula // ignore: cast_nullable_to_non_nullable
                        as String,
            biografia:
                freezed == biografia
                    ? _value.biografia
                    : biografia // ignore: cast_nullable_to_non_nullable
                        as String?,
            dataCriacao:
                null == dataCriacao
                    ? _value.dataCriacao
                    : dataCriacao // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            roles:
                null == roles
                    ? _value.roles
                    : roles // ignore: cast_nullable_to_non_nullable
                        as List<Roles>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SimpleUsuarioModelUsuarioImplCopyWith<$Res>
    implements $SimpleUsuarioModelCopyWith<$Res> {
  factory _$$SimpleUsuarioModelUsuarioImplCopyWith(
    _$SimpleUsuarioModelUsuarioImpl value,
    $Res Function(_$SimpleUsuarioModelUsuarioImpl) then,
  ) = __$$SimpleUsuarioModelUsuarioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String nome,
    String matricula,
    String? biografia,
    DateTime dataCriacao,
    List<Roles> roles,
  });
}

/// @nodoc
class __$$SimpleUsuarioModelUsuarioImplCopyWithImpl<$Res>
    extends
        _$SimpleUsuarioModelCopyWithImpl<$Res, _$SimpleUsuarioModelUsuarioImpl>
    implements _$$SimpleUsuarioModelUsuarioImplCopyWith<$Res> {
  __$$SimpleUsuarioModelUsuarioImplCopyWithImpl(
    _$SimpleUsuarioModelUsuarioImpl _value,
    $Res Function(_$SimpleUsuarioModelUsuarioImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SimpleUsuarioModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? matricula = null,
    Object? biografia = freezed,
    Object? dataCriacao = null,
    Object? roles = null,
  }) {
    return _then(
      _$SimpleUsuarioModelUsuarioImpl(
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
        matricula:
            null == matricula
                ? _value.matricula
                : matricula // ignore: cast_nullable_to_non_nullable
                    as String,
        biografia:
            freezed == biografia
                ? _value.biografia
                : biografia // ignore: cast_nullable_to_non_nullable
                    as String?,
        dataCriacao:
            null == dataCriacao
                ? _value.dataCriacao
                : dataCriacao // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        roles:
            null == roles
                ? _value._roles
                : roles // ignore: cast_nullable_to_non_nullable
                    as List<Roles>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SimpleUsuarioModelUsuarioImpl implements _SimpleUsuarioModelUsuario {
  const _$SimpleUsuarioModelUsuarioImpl({
    required this.id,
    required this.nome,
    required this.matricula,
    this.biografia,
    required this.dataCriacao,
    required final List<Roles> roles,
  }) : _roles = roles;

  factory _$SimpleUsuarioModelUsuarioImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimpleUsuarioModelUsuarioImplFromJson(json);

  @override
  final String id;
  @override
  final String nome;
  @override
  final String matricula;
  @override
  final String? biografia;
  @override
  final DateTime dataCriacao;
  final List<Roles> _roles;
  @override
  List<Roles> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  String toString() {
    return 'SimpleUsuarioModel.usuario(id: $id, nome: $nome, matricula: $matricula, biografia: $biografia, dataCriacao: $dataCriacao, roles: $roles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleUsuarioModelUsuarioImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.matricula, matricula) ||
                other.matricula == matricula) &&
            (identical(other.biografia, biografia) ||
                other.biografia == biografia) &&
            (identical(other.dataCriacao, dataCriacao) ||
                other.dataCriacao == dataCriacao) &&
            const DeepCollectionEquality().equals(other._roles, _roles));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    nome,
    matricula,
    biografia,
    dataCriacao,
    const DeepCollectionEquality().hash(_roles),
  );

  /// Create a copy of SimpleUsuarioModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleUsuarioModelUsuarioImplCopyWith<_$SimpleUsuarioModelUsuarioImpl>
  get copyWith => __$$SimpleUsuarioModelUsuarioImplCopyWithImpl<
    _$SimpleUsuarioModelUsuarioImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
    )
    usuario,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
    )
    tutor,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String formacao,
    )
    professor,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
    )
    aluno,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
      String condicao,
      String necessidadeEspecial,
      String necessidadeEscolar,
    )
    alunoNapne,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
      double salary,
    )
    interprete,
  }) {
    return usuario(id, nome, matricula, biografia, dataCriacao, roles);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
    )?
    usuario,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
    )?
    tutor,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String formacao,
    )?
    professor,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
    )?
    aluno,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
      String condicao,
      String necessidadeEspecial,
      String necessidadeEscolar,
    )?
    alunoNapne,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
      double salary,
    )?
    interprete,
  }) {
    return usuario?.call(id, nome, matricula, biografia, dataCriacao, roles);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
    )?
    usuario,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
    )?
    tutor,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String formacao,
    )?
    professor,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
    )?
    aluno,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
      String condicao,
      String necessidadeEspecial,
      String necessidadeEscolar,
    )?
    alunoNapne,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
      double salary,
    )?
    interprete,
    required TResult orElse(),
  }) {
    if (usuario != null) {
      return usuario(id, nome, matricula, biografia, dataCriacao, roles);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SimpleUsuarioModelUsuario value) usuario,
    required TResult Function(_SimpleTutorModel value) tutor,
    required TResult Function(_SimpleProfessorModel value) professor,
    required TResult Function(_SimpleAlunoModel value) aluno,
    required TResult Function(_SimpleAlunoNapneModel value) alunoNapne,
    required TResult Function(_SimpleInterpreteModel value) interprete,
  }) {
    return usuario(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SimpleUsuarioModelUsuario value)? usuario,
    TResult? Function(_SimpleTutorModel value)? tutor,
    TResult? Function(_SimpleProfessorModel value)? professor,
    TResult? Function(_SimpleAlunoModel value)? aluno,
    TResult? Function(_SimpleAlunoNapneModel value)? alunoNapne,
    TResult? Function(_SimpleInterpreteModel value)? interprete,
  }) {
    return usuario?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SimpleUsuarioModelUsuario value)? usuario,
    TResult Function(_SimpleTutorModel value)? tutor,
    TResult Function(_SimpleProfessorModel value)? professor,
    TResult Function(_SimpleAlunoModel value)? aluno,
    TResult Function(_SimpleAlunoNapneModel value)? alunoNapne,
    TResult Function(_SimpleInterpreteModel value)? interprete,
    required TResult orElse(),
  }) {
    if (usuario != null) {
      return usuario(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SimpleUsuarioModelUsuarioImplToJson(this);
  }
}

abstract class _SimpleUsuarioModelUsuario implements SimpleUsuarioModel {
  const factory _SimpleUsuarioModelUsuario({
    required final String id,
    required final String nome,
    required final String matricula,
    final String? biografia,
    required final DateTime dataCriacao,
    required final List<Roles> roles,
  }) = _$SimpleUsuarioModelUsuarioImpl;

  factory _SimpleUsuarioModelUsuario.fromJson(Map<String, dynamic> json) =
      _$SimpleUsuarioModelUsuarioImpl.fromJson;

  @override
  String get id;
  @override
  String get nome;
  @override
  String get matricula;
  @override
  String? get biografia;
  @override
  DateTime get dataCriacao;
  @override
  List<Roles> get roles;

  /// Create a copy of SimpleUsuarioModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimpleUsuarioModelUsuarioImplCopyWith<_$SimpleUsuarioModelUsuarioImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SimpleTutorModelImplCopyWith<$Res>
    implements $SimpleUsuarioModelCopyWith<$Res> {
  factory _$$SimpleTutorModelImplCopyWith(
    _$SimpleTutorModelImpl value,
    $Res Function(_$SimpleTutorModelImpl) then,
  ) = __$$SimpleTutorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String nome,
    String matricula,
    String? biografia,
    DateTime dataCriacao,
    List<Roles> roles,
    String especialidade,
  });
}

/// @nodoc
class __$$SimpleTutorModelImplCopyWithImpl<$Res>
    extends _$SimpleUsuarioModelCopyWithImpl<$Res, _$SimpleTutorModelImpl>
    implements _$$SimpleTutorModelImplCopyWith<$Res> {
  __$$SimpleTutorModelImplCopyWithImpl(
    _$SimpleTutorModelImpl _value,
    $Res Function(_$SimpleTutorModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SimpleUsuarioModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? matricula = null,
    Object? biografia = freezed,
    Object? dataCriacao = null,
    Object? roles = null,
    Object? especialidade = null,
  }) {
    return _then(
      _$SimpleTutorModelImpl(
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
        matricula:
            null == matricula
                ? _value.matricula
                : matricula // ignore: cast_nullable_to_non_nullable
                    as String,
        biografia:
            freezed == biografia
                ? _value.biografia
                : biografia // ignore: cast_nullable_to_non_nullable
                    as String?,
        dataCriacao:
            null == dataCriacao
                ? _value.dataCriacao
                : dataCriacao // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        roles:
            null == roles
                ? _value._roles
                : roles // ignore: cast_nullable_to_non_nullable
                    as List<Roles>,
        especialidade:
            null == especialidade
                ? _value.especialidade
                : especialidade // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SimpleTutorModelImpl implements _SimpleTutorModel {
  const _$SimpleTutorModelImpl({
    required this.id,
    required this.nome,
    required this.matricula,
    this.biografia,
    required this.dataCriacao,
    required final List<Roles> roles,
    required this.especialidade,
  }) : _roles = roles;

  factory _$SimpleTutorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimpleTutorModelImplFromJson(json);

  @override
  final String id;
  @override
  final String nome;
  @override
  final String matricula;
  @override
  final String? biografia;
  @override
  final DateTime dataCriacao;
  final List<Roles> _roles;
  @override
  List<Roles> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  final String especialidade;

  @override
  String toString() {
    return 'SimpleUsuarioModel.tutor(id: $id, nome: $nome, matricula: $matricula, biografia: $biografia, dataCriacao: $dataCriacao, roles: $roles, especialidade: $especialidade)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleTutorModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.matricula, matricula) ||
                other.matricula == matricula) &&
            (identical(other.biografia, biografia) ||
                other.biografia == biografia) &&
            (identical(other.dataCriacao, dataCriacao) ||
                other.dataCriacao == dataCriacao) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.especialidade, especialidade) ||
                other.especialidade == especialidade));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    nome,
    matricula,
    biografia,
    dataCriacao,
    const DeepCollectionEquality().hash(_roles),
    especialidade,
  );

  /// Create a copy of SimpleUsuarioModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleTutorModelImplCopyWith<_$SimpleTutorModelImpl> get copyWith =>
      __$$SimpleTutorModelImplCopyWithImpl<_$SimpleTutorModelImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
    )
    usuario,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
    )
    tutor,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String formacao,
    )
    professor,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
    )
    aluno,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
      String condicao,
      String necessidadeEspecial,
      String necessidadeEscolar,
    )
    alunoNapne,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
      double salary,
    )
    interprete,
  }) {
    return tutor(
      id,
      nome,
      matricula,
      biografia,
      dataCriacao,
      roles,
      especialidade,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
    )?
    usuario,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
    )?
    tutor,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String formacao,
    )?
    professor,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
    )?
    aluno,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
      String condicao,
      String necessidadeEspecial,
      String necessidadeEscolar,
    )?
    alunoNapne,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
      double salary,
    )?
    interprete,
  }) {
    return tutor?.call(
      id,
      nome,
      matricula,
      biografia,
      dataCriacao,
      roles,
      especialidade,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
    )?
    usuario,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
    )?
    tutor,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String formacao,
    )?
    professor,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
    )?
    aluno,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
      String condicao,
      String necessidadeEspecial,
      String necessidadeEscolar,
    )?
    alunoNapne,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
      double salary,
    )?
    interprete,
    required TResult orElse(),
  }) {
    if (tutor != null) {
      return tutor(
        id,
        nome,
        matricula,
        biografia,
        dataCriacao,
        roles,
        especialidade,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SimpleUsuarioModelUsuario value) usuario,
    required TResult Function(_SimpleTutorModel value) tutor,
    required TResult Function(_SimpleProfessorModel value) professor,
    required TResult Function(_SimpleAlunoModel value) aluno,
    required TResult Function(_SimpleAlunoNapneModel value) alunoNapne,
    required TResult Function(_SimpleInterpreteModel value) interprete,
  }) {
    return tutor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SimpleUsuarioModelUsuario value)? usuario,
    TResult? Function(_SimpleTutorModel value)? tutor,
    TResult? Function(_SimpleProfessorModel value)? professor,
    TResult? Function(_SimpleAlunoModel value)? aluno,
    TResult? Function(_SimpleAlunoNapneModel value)? alunoNapne,
    TResult? Function(_SimpleInterpreteModel value)? interprete,
  }) {
    return tutor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SimpleUsuarioModelUsuario value)? usuario,
    TResult Function(_SimpleTutorModel value)? tutor,
    TResult Function(_SimpleProfessorModel value)? professor,
    TResult Function(_SimpleAlunoModel value)? aluno,
    TResult Function(_SimpleAlunoNapneModel value)? alunoNapne,
    TResult Function(_SimpleInterpreteModel value)? interprete,
    required TResult orElse(),
  }) {
    if (tutor != null) {
      return tutor(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SimpleTutorModelImplToJson(this);
  }
}

abstract class _SimpleTutorModel implements SimpleUsuarioModel {
  const factory _SimpleTutorModel({
    required final String id,
    required final String nome,
    required final String matricula,
    final String? biografia,
    required final DateTime dataCriacao,
    required final List<Roles> roles,
    required final String especialidade,
  }) = _$SimpleTutorModelImpl;

  factory _SimpleTutorModel.fromJson(Map<String, dynamic> json) =
      _$SimpleTutorModelImpl.fromJson;

  @override
  String get id;
  @override
  String get nome;
  @override
  String get matricula;
  @override
  String? get biografia;
  @override
  DateTime get dataCriacao;
  @override
  List<Roles> get roles;
  String get especialidade;

  /// Create a copy of SimpleUsuarioModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimpleTutorModelImplCopyWith<_$SimpleTutorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SimpleProfessorModelImplCopyWith<$Res>
    implements $SimpleUsuarioModelCopyWith<$Res> {
  factory _$$SimpleProfessorModelImplCopyWith(
    _$SimpleProfessorModelImpl value,
    $Res Function(_$SimpleProfessorModelImpl) then,
  ) = __$$SimpleProfessorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String nome,
    String matricula,
    String? biografia,
    DateTime dataCriacao,
    List<Roles> roles,
    String formacao,
  });
}

/// @nodoc
class __$$SimpleProfessorModelImplCopyWithImpl<$Res>
    extends _$SimpleUsuarioModelCopyWithImpl<$Res, _$SimpleProfessorModelImpl>
    implements _$$SimpleProfessorModelImplCopyWith<$Res> {
  __$$SimpleProfessorModelImplCopyWithImpl(
    _$SimpleProfessorModelImpl _value,
    $Res Function(_$SimpleProfessorModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SimpleUsuarioModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? matricula = null,
    Object? biografia = freezed,
    Object? dataCriacao = null,
    Object? roles = null,
    Object? formacao = null,
  }) {
    return _then(
      _$SimpleProfessorModelImpl(
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
        matricula:
            null == matricula
                ? _value.matricula
                : matricula // ignore: cast_nullable_to_non_nullable
                    as String,
        biografia:
            freezed == biografia
                ? _value.biografia
                : biografia // ignore: cast_nullable_to_non_nullable
                    as String?,
        dataCriacao:
            null == dataCriacao
                ? _value.dataCriacao
                : dataCriacao // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        roles:
            null == roles
                ? _value._roles
                : roles // ignore: cast_nullable_to_non_nullable
                    as List<Roles>,
        formacao:
            null == formacao
                ? _value.formacao
                : formacao // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SimpleProfessorModelImpl implements _SimpleProfessorModel {
  const _$SimpleProfessorModelImpl({
    required this.id,
    required this.nome,
    required this.matricula,
    this.biografia,
    required this.dataCriacao,
    required final List<Roles> roles,
    required this.formacao,
  }) : _roles = roles;

  factory _$SimpleProfessorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimpleProfessorModelImplFromJson(json);

  @override
  final String id;
  @override
  final String nome;
  @override
  final String matricula;
  @override
  final String? biografia;
  @override
  final DateTime dataCriacao;
  final List<Roles> _roles;
  @override
  List<Roles> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  final String formacao;

  @override
  String toString() {
    return 'SimpleUsuarioModel.professor(id: $id, nome: $nome, matricula: $matricula, biografia: $biografia, dataCriacao: $dataCriacao, roles: $roles, formacao: $formacao)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleProfessorModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.matricula, matricula) ||
                other.matricula == matricula) &&
            (identical(other.biografia, biografia) ||
                other.biografia == biografia) &&
            (identical(other.dataCriacao, dataCriacao) ||
                other.dataCriacao == dataCriacao) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.formacao, formacao) ||
                other.formacao == formacao));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    nome,
    matricula,
    biografia,
    dataCriacao,
    const DeepCollectionEquality().hash(_roles),
    formacao,
  );

  /// Create a copy of SimpleUsuarioModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleProfessorModelImplCopyWith<_$SimpleProfessorModelImpl>
  get copyWith =>
      __$$SimpleProfessorModelImplCopyWithImpl<_$SimpleProfessorModelImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
    )
    usuario,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
    )
    tutor,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String formacao,
    )
    professor,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
    )
    aluno,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
      String condicao,
      String necessidadeEspecial,
      String necessidadeEscolar,
    )
    alunoNapne,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
      double salary,
    )
    interprete,
  }) {
    return professor(
      id,
      nome,
      matricula,
      biografia,
      dataCriacao,
      roles,
      formacao,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
    )?
    usuario,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
    )?
    tutor,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String formacao,
    )?
    professor,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
    )?
    aluno,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
      String condicao,
      String necessidadeEspecial,
      String necessidadeEscolar,
    )?
    alunoNapne,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
      double salary,
    )?
    interprete,
  }) {
    return professor?.call(
      id,
      nome,
      matricula,
      biografia,
      dataCriacao,
      roles,
      formacao,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
    )?
    usuario,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
    )?
    tutor,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String formacao,
    )?
    professor,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
    )?
    aluno,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
      String condicao,
      String necessidadeEspecial,
      String necessidadeEscolar,
    )?
    alunoNapne,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
      double salary,
    )?
    interprete,
    required TResult orElse(),
  }) {
    if (professor != null) {
      return professor(
        id,
        nome,
        matricula,
        biografia,
        dataCriacao,
        roles,
        formacao,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SimpleUsuarioModelUsuario value) usuario,
    required TResult Function(_SimpleTutorModel value) tutor,
    required TResult Function(_SimpleProfessorModel value) professor,
    required TResult Function(_SimpleAlunoModel value) aluno,
    required TResult Function(_SimpleAlunoNapneModel value) alunoNapne,
    required TResult Function(_SimpleInterpreteModel value) interprete,
  }) {
    return professor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SimpleUsuarioModelUsuario value)? usuario,
    TResult? Function(_SimpleTutorModel value)? tutor,
    TResult? Function(_SimpleProfessorModel value)? professor,
    TResult? Function(_SimpleAlunoModel value)? aluno,
    TResult? Function(_SimpleAlunoNapneModel value)? alunoNapne,
    TResult? Function(_SimpleInterpreteModel value)? interprete,
  }) {
    return professor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SimpleUsuarioModelUsuario value)? usuario,
    TResult Function(_SimpleTutorModel value)? tutor,
    TResult Function(_SimpleProfessorModel value)? professor,
    TResult Function(_SimpleAlunoModel value)? aluno,
    TResult Function(_SimpleAlunoNapneModel value)? alunoNapne,
    TResult Function(_SimpleInterpreteModel value)? interprete,
    required TResult orElse(),
  }) {
    if (professor != null) {
      return professor(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SimpleProfessorModelImplToJson(this);
  }
}

abstract class _SimpleProfessorModel implements SimpleUsuarioModel {
  const factory _SimpleProfessorModel({
    required final String id,
    required final String nome,
    required final String matricula,
    final String? biografia,
    required final DateTime dataCriacao,
    required final List<Roles> roles,
    required final String formacao,
  }) = _$SimpleProfessorModelImpl;

  factory _SimpleProfessorModel.fromJson(Map<String, dynamic> json) =
      _$SimpleProfessorModelImpl.fromJson;

  @override
  String get id;
  @override
  String get nome;
  @override
  String get matricula;
  @override
  String? get biografia;
  @override
  DateTime get dataCriacao;
  @override
  List<Roles> get roles;
  String get formacao;

  /// Create a copy of SimpleUsuarioModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimpleProfessorModelImplCopyWith<_$SimpleProfessorModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SimpleAlunoModelImplCopyWith<$Res>
    implements $SimpleUsuarioModelCopyWith<$Res> {
  factory _$$SimpleAlunoModelImplCopyWith(
    _$SimpleAlunoModelImpl value,
    $Res Function(_$SimpleAlunoModelImpl) then,
  ) = __$$SimpleAlunoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String nome,
    String matricula,
    String? biografia,
    DateTime dataCriacao,
    List<Roles> roles,
    CursoRequestModel curso,
  });

  $CursoRequestModelCopyWith<$Res> get curso;
}

/// @nodoc
class __$$SimpleAlunoModelImplCopyWithImpl<$Res>
    extends _$SimpleUsuarioModelCopyWithImpl<$Res, _$SimpleAlunoModelImpl>
    implements _$$SimpleAlunoModelImplCopyWith<$Res> {
  __$$SimpleAlunoModelImplCopyWithImpl(
    _$SimpleAlunoModelImpl _value,
    $Res Function(_$SimpleAlunoModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SimpleUsuarioModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? matricula = null,
    Object? biografia = freezed,
    Object? dataCriacao = null,
    Object? roles = null,
    Object? curso = null,
  }) {
    return _then(
      _$SimpleAlunoModelImpl(
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
        matricula:
            null == matricula
                ? _value.matricula
                : matricula // ignore: cast_nullable_to_non_nullable
                    as String,
        biografia:
            freezed == biografia
                ? _value.biografia
                : biografia // ignore: cast_nullable_to_non_nullable
                    as String?,
        dataCriacao:
            null == dataCriacao
                ? _value.dataCriacao
                : dataCriacao // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        roles:
            null == roles
                ? _value._roles
                : roles // ignore: cast_nullable_to_non_nullable
                    as List<Roles>,
        curso:
            null == curso
                ? _value.curso
                : curso // ignore: cast_nullable_to_non_nullable
                    as CursoRequestModel,
      ),
    );
  }

  /// Create a copy of SimpleUsuarioModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CursoRequestModelCopyWith<$Res> get curso {
    return $CursoRequestModelCopyWith<$Res>(_value.curso, (value) {
      return _then(_value.copyWith(curso: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$SimpleAlunoModelImpl implements _SimpleAlunoModel {
  const _$SimpleAlunoModelImpl({
    required this.id,
    required this.nome,
    required this.matricula,
    this.biografia,
    required this.dataCriacao,
    required final List<Roles> roles,
    required this.curso,
  }) : _roles = roles;

  factory _$SimpleAlunoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimpleAlunoModelImplFromJson(json);

  @override
  final String id;
  @override
  final String nome;
  @override
  final String matricula;
  @override
  final String? biografia;
  @override
  final DateTime dataCriacao;
  final List<Roles> _roles;
  @override
  List<Roles> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  final CursoRequestModel curso;

  @override
  String toString() {
    return 'SimpleUsuarioModel.aluno(id: $id, nome: $nome, matricula: $matricula, biografia: $biografia, dataCriacao: $dataCriacao, roles: $roles, curso: $curso)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleAlunoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.matricula, matricula) ||
                other.matricula == matricula) &&
            (identical(other.biografia, biografia) ||
                other.biografia == biografia) &&
            (identical(other.dataCriacao, dataCriacao) ||
                other.dataCriacao == dataCriacao) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.curso, curso) || other.curso == curso));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    nome,
    matricula,
    biografia,
    dataCriacao,
    const DeepCollectionEquality().hash(_roles),
    curso,
  );

  /// Create a copy of SimpleUsuarioModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleAlunoModelImplCopyWith<_$SimpleAlunoModelImpl> get copyWith =>
      __$$SimpleAlunoModelImplCopyWithImpl<_$SimpleAlunoModelImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
    )
    usuario,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
    )
    tutor,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String formacao,
    )
    professor,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
    )
    aluno,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
      String condicao,
      String necessidadeEspecial,
      String necessidadeEscolar,
    )
    alunoNapne,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
      double salary,
    )
    interprete,
  }) {
    return aluno(id, nome, matricula, biografia, dataCriacao, roles, curso);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
    )?
    usuario,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
    )?
    tutor,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String formacao,
    )?
    professor,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
    )?
    aluno,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
      String condicao,
      String necessidadeEspecial,
      String necessidadeEscolar,
    )?
    alunoNapne,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
      double salary,
    )?
    interprete,
  }) {
    return aluno?.call(
      id,
      nome,
      matricula,
      biografia,
      dataCriacao,
      roles,
      curso,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
    )?
    usuario,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
    )?
    tutor,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String formacao,
    )?
    professor,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
    )?
    aluno,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
      String condicao,
      String necessidadeEspecial,
      String necessidadeEscolar,
    )?
    alunoNapne,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
      double salary,
    )?
    interprete,
    required TResult orElse(),
  }) {
    if (aluno != null) {
      return aluno(id, nome, matricula, biografia, dataCriacao, roles, curso);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SimpleUsuarioModelUsuario value) usuario,
    required TResult Function(_SimpleTutorModel value) tutor,
    required TResult Function(_SimpleProfessorModel value) professor,
    required TResult Function(_SimpleAlunoModel value) aluno,
    required TResult Function(_SimpleAlunoNapneModel value) alunoNapne,
    required TResult Function(_SimpleInterpreteModel value) interprete,
  }) {
    return aluno(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SimpleUsuarioModelUsuario value)? usuario,
    TResult? Function(_SimpleTutorModel value)? tutor,
    TResult? Function(_SimpleProfessorModel value)? professor,
    TResult? Function(_SimpleAlunoModel value)? aluno,
    TResult? Function(_SimpleAlunoNapneModel value)? alunoNapne,
    TResult? Function(_SimpleInterpreteModel value)? interprete,
  }) {
    return aluno?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SimpleUsuarioModelUsuario value)? usuario,
    TResult Function(_SimpleTutorModel value)? tutor,
    TResult Function(_SimpleProfessorModel value)? professor,
    TResult Function(_SimpleAlunoModel value)? aluno,
    TResult Function(_SimpleAlunoNapneModel value)? alunoNapne,
    TResult Function(_SimpleInterpreteModel value)? interprete,
    required TResult orElse(),
  }) {
    if (aluno != null) {
      return aluno(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SimpleAlunoModelImplToJson(this);
  }
}

abstract class _SimpleAlunoModel implements SimpleUsuarioModel {
  const factory _SimpleAlunoModel({
    required final String id,
    required final String nome,
    required final String matricula,
    final String? biografia,
    required final DateTime dataCriacao,
    required final List<Roles> roles,
    required final CursoRequestModel curso,
  }) = _$SimpleAlunoModelImpl;

  factory _SimpleAlunoModel.fromJson(Map<String, dynamic> json) =
      _$SimpleAlunoModelImpl.fromJson;

  @override
  String get id;
  @override
  String get nome;
  @override
  String get matricula;
  @override
  String? get biografia;
  @override
  DateTime get dataCriacao;
  @override
  List<Roles> get roles;
  CursoRequestModel get curso;

  /// Create a copy of SimpleUsuarioModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimpleAlunoModelImplCopyWith<_$SimpleAlunoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SimpleAlunoNapneModelImplCopyWith<$Res>
    implements $SimpleUsuarioModelCopyWith<$Res> {
  factory _$$SimpleAlunoNapneModelImplCopyWith(
    _$SimpleAlunoNapneModelImpl value,
    $Res Function(_$SimpleAlunoNapneModelImpl) then,
  ) = __$$SimpleAlunoNapneModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String nome,
    String matricula,
    String? biografia,
    DateTime dataCriacao,
    List<Roles> roles,
    CursoRequestModel curso,
    String condicao,
    String necessidadeEspecial,
    String necessidadeEscolar,
  });

  $CursoRequestModelCopyWith<$Res> get curso;
}

/// @nodoc
class __$$SimpleAlunoNapneModelImplCopyWithImpl<$Res>
    extends _$SimpleUsuarioModelCopyWithImpl<$Res, _$SimpleAlunoNapneModelImpl>
    implements _$$SimpleAlunoNapneModelImplCopyWith<$Res> {
  __$$SimpleAlunoNapneModelImplCopyWithImpl(
    _$SimpleAlunoNapneModelImpl _value,
    $Res Function(_$SimpleAlunoNapneModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SimpleUsuarioModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? matricula = null,
    Object? biografia = freezed,
    Object? dataCriacao = null,
    Object? roles = null,
    Object? curso = null,
    Object? condicao = null,
    Object? necessidadeEspecial = null,
    Object? necessidadeEscolar = null,
  }) {
    return _then(
      _$SimpleAlunoNapneModelImpl(
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
        matricula:
            null == matricula
                ? _value.matricula
                : matricula // ignore: cast_nullable_to_non_nullable
                    as String,
        biografia:
            freezed == biografia
                ? _value.biografia
                : biografia // ignore: cast_nullable_to_non_nullable
                    as String?,
        dataCriacao:
            null == dataCriacao
                ? _value.dataCriacao
                : dataCriacao // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        roles:
            null == roles
                ? _value._roles
                : roles // ignore: cast_nullable_to_non_nullable
                    as List<Roles>,
        curso:
            null == curso
                ? _value.curso
                : curso // ignore: cast_nullable_to_non_nullable
                    as CursoRequestModel,
        condicao:
            null == condicao
                ? _value.condicao
                : condicao // ignore: cast_nullable_to_non_nullable
                    as String,
        necessidadeEspecial:
            null == necessidadeEspecial
                ? _value.necessidadeEspecial
                : necessidadeEspecial // ignore: cast_nullable_to_non_nullable
                    as String,
        necessidadeEscolar:
            null == necessidadeEscolar
                ? _value.necessidadeEscolar
                : necessidadeEscolar // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }

  /// Create a copy of SimpleUsuarioModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CursoRequestModelCopyWith<$Res> get curso {
    return $CursoRequestModelCopyWith<$Res>(_value.curso, (value) {
      return _then(_value.copyWith(curso: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$SimpleAlunoNapneModelImpl implements _SimpleAlunoNapneModel {
  const _$SimpleAlunoNapneModelImpl({
    required this.id,
    required this.nome,
    required this.matricula,
    this.biografia,
    required this.dataCriacao,
    required final List<Roles> roles,
    required this.curso,
    required this.condicao,
    required this.necessidadeEspecial,
    required this.necessidadeEscolar,
  }) : _roles = roles;

  factory _$SimpleAlunoNapneModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimpleAlunoNapneModelImplFromJson(json);

  @override
  final String id;
  @override
  final String nome;
  @override
  final String matricula;
  @override
  final String? biografia;
  @override
  final DateTime dataCriacao;
  final List<Roles> _roles;
  @override
  List<Roles> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  final CursoRequestModel curso;
  @override
  final String condicao;
  @override
  final String necessidadeEspecial;
  @override
  final String necessidadeEscolar;

  @override
  String toString() {
    return 'SimpleUsuarioModel.alunoNapne(id: $id, nome: $nome, matricula: $matricula, biografia: $biografia, dataCriacao: $dataCriacao, roles: $roles, curso: $curso, condicao: $condicao, necessidadeEspecial: $necessidadeEspecial, necessidadeEscolar: $necessidadeEscolar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleAlunoNapneModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.matricula, matricula) ||
                other.matricula == matricula) &&
            (identical(other.biografia, biografia) ||
                other.biografia == biografia) &&
            (identical(other.dataCriacao, dataCriacao) ||
                other.dataCriacao == dataCriacao) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.curso, curso) || other.curso == curso) &&
            (identical(other.condicao, condicao) ||
                other.condicao == condicao) &&
            (identical(other.necessidadeEspecial, necessidadeEspecial) ||
                other.necessidadeEspecial == necessidadeEspecial) &&
            (identical(other.necessidadeEscolar, necessidadeEscolar) ||
                other.necessidadeEscolar == necessidadeEscolar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    nome,
    matricula,
    biografia,
    dataCriacao,
    const DeepCollectionEquality().hash(_roles),
    curso,
    condicao,
    necessidadeEspecial,
    necessidadeEscolar,
  );

  /// Create a copy of SimpleUsuarioModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleAlunoNapneModelImplCopyWith<_$SimpleAlunoNapneModelImpl>
  get copyWith =>
      __$$SimpleAlunoNapneModelImplCopyWithImpl<_$SimpleAlunoNapneModelImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
    )
    usuario,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
    )
    tutor,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String formacao,
    )
    professor,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
    )
    aluno,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
      String condicao,
      String necessidadeEspecial,
      String necessidadeEscolar,
    )
    alunoNapne,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
      double salary,
    )
    interprete,
  }) {
    return alunoNapne(
      id,
      nome,
      matricula,
      biografia,
      dataCriacao,
      roles,
      curso,
      condicao,
      necessidadeEspecial,
      necessidadeEscolar,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
    )?
    usuario,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
    )?
    tutor,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String formacao,
    )?
    professor,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
    )?
    aluno,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
      String condicao,
      String necessidadeEspecial,
      String necessidadeEscolar,
    )?
    alunoNapne,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
      double salary,
    )?
    interprete,
  }) {
    return alunoNapne?.call(
      id,
      nome,
      matricula,
      biografia,
      dataCriacao,
      roles,
      curso,
      condicao,
      necessidadeEspecial,
      necessidadeEscolar,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
    )?
    usuario,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
    )?
    tutor,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String formacao,
    )?
    professor,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
    )?
    aluno,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
      String condicao,
      String necessidadeEspecial,
      String necessidadeEscolar,
    )?
    alunoNapne,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
      double salary,
    )?
    interprete,
    required TResult orElse(),
  }) {
    if (alunoNapne != null) {
      return alunoNapne(
        id,
        nome,
        matricula,
        biografia,
        dataCriacao,
        roles,
        curso,
        condicao,
        necessidadeEspecial,
        necessidadeEscolar,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SimpleUsuarioModelUsuario value) usuario,
    required TResult Function(_SimpleTutorModel value) tutor,
    required TResult Function(_SimpleProfessorModel value) professor,
    required TResult Function(_SimpleAlunoModel value) aluno,
    required TResult Function(_SimpleAlunoNapneModel value) alunoNapne,
    required TResult Function(_SimpleInterpreteModel value) interprete,
  }) {
    return alunoNapne(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SimpleUsuarioModelUsuario value)? usuario,
    TResult? Function(_SimpleTutorModel value)? tutor,
    TResult? Function(_SimpleProfessorModel value)? professor,
    TResult? Function(_SimpleAlunoModel value)? aluno,
    TResult? Function(_SimpleAlunoNapneModel value)? alunoNapne,
    TResult? Function(_SimpleInterpreteModel value)? interprete,
  }) {
    return alunoNapne?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SimpleUsuarioModelUsuario value)? usuario,
    TResult Function(_SimpleTutorModel value)? tutor,
    TResult Function(_SimpleProfessorModel value)? professor,
    TResult Function(_SimpleAlunoModel value)? aluno,
    TResult Function(_SimpleAlunoNapneModel value)? alunoNapne,
    TResult Function(_SimpleInterpreteModel value)? interprete,
    required TResult orElse(),
  }) {
    if (alunoNapne != null) {
      return alunoNapne(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SimpleAlunoNapneModelImplToJson(this);
  }
}

abstract class _SimpleAlunoNapneModel implements SimpleUsuarioModel {
  const factory _SimpleAlunoNapneModel({
    required final String id,
    required final String nome,
    required final String matricula,
    final String? biografia,
    required final DateTime dataCriacao,
    required final List<Roles> roles,
    required final CursoRequestModel curso,
    required final String condicao,
    required final String necessidadeEspecial,
    required final String necessidadeEscolar,
  }) = _$SimpleAlunoNapneModelImpl;

  factory _SimpleAlunoNapneModel.fromJson(Map<String, dynamic> json) =
      _$SimpleAlunoNapneModelImpl.fromJson;

  @override
  String get id;
  @override
  String get nome;
  @override
  String get matricula;
  @override
  String? get biografia;
  @override
  DateTime get dataCriacao;
  @override
  List<Roles> get roles;
  CursoRequestModel get curso;
  String get condicao;
  String get necessidadeEspecial;
  String get necessidadeEscolar;

  /// Create a copy of SimpleUsuarioModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimpleAlunoNapneModelImplCopyWith<_$SimpleAlunoNapneModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SimpleInterpreteModelImplCopyWith<$Res>
    implements $SimpleUsuarioModelCopyWith<$Res> {
  factory _$$SimpleInterpreteModelImplCopyWith(
    _$SimpleInterpreteModelImpl value,
    $Res Function(_$SimpleInterpreteModelImpl) then,
  ) = __$$SimpleInterpreteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String nome,
    String matricula,
    String? biografia,
    DateTime dataCriacao,
    List<Roles> roles,
    String especialidade,
    double salary,
  });
}

/// @nodoc
class __$$SimpleInterpreteModelImplCopyWithImpl<$Res>
    extends _$SimpleUsuarioModelCopyWithImpl<$Res, _$SimpleInterpreteModelImpl>
    implements _$$SimpleInterpreteModelImplCopyWith<$Res> {
  __$$SimpleInterpreteModelImplCopyWithImpl(
    _$SimpleInterpreteModelImpl _value,
    $Res Function(_$SimpleInterpreteModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SimpleUsuarioModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? matricula = null,
    Object? biografia = freezed,
    Object? dataCriacao = null,
    Object? roles = null,
    Object? especialidade = null,
    Object? salary = null,
  }) {
    return _then(
      _$SimpleInterpreteModelImpl(
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
        matricula:
            null == matricula
                ? _value.matricula
                : matricula // ignore: cast_nullable_to_non_nullable
                    as String,
        biografia:
            freezed == biografia
                ? _value.biografia
                : biografia // ignore: cast_nullable_to_non_nullable
                    as String?,
        dataCriacao:
            null == dataCriacao
                ? _value.dataCriacao
                : dataCriacao // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        roles:
            null == roles
                ? _value._roles
                : roles // ignore: cast_nullable_to_non_nullable
                    as List<Roles>,
        especialidade:
            null == especialidade
                ? _value.especialidade
                : especialidade // ignore: cast_nullable_to_non_nullable
                    as String,
        salary:
            null == salary
                ? _value.salary
                : salary // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SimpleInterpreteModelImpl implements _SimpleInterpreteModel {
  const _$SimpleInterpreteModelImpl({
    required this.id,
    required this.nome,
    required this.matricula,
    this.biografia,
    required this.dataCriacao,
    required final List<Roles> roles,
    required this.especialidade,
    required this.salary,
  }) : _roles = roles;

  factory _$SimpleInterpreteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimpleInterpreteModelImplFromJson(json);

  @override
  final String id;
  @override
  final String nome;
  @override
  final String matricula;
  @override
  final String? biografia;
  @override
  final DateTime dataCriacao;
  final List<Roles> _roles;
  @override
  List<Roles> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  final String especialidade;
  @override
  final double salary;

  @override
  String toString() {
    return 'SimpleUsuarioModel.interprete(id: $id, nome: $nome, matricula: $matricula, biografia: $biografia, dataCriacao: $dataCriacao, roles: $roles, especialidade: $especialidade, salary: $salary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleInterpreteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.matricula, matricula) ||
                other.matricula == matricula) &&
            (identical(other.biografia, biografia) ||
                other.biografia == biografia) &&
            (identical(other.dataCriacao, dataCriacao) ||
                other.dataCriacao == dataCriacao) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.especialidade, especialidade) ||
                other.especialidade == especialidade) &&
            (identical(other.salary, salary) || other.salary == salary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    nome,
    matricula,
    biografia,
    dataCriacao,
    const DeepCollectionEquality().hash(_roles),
    especialidade,
    salary,
  );

  /// Create a copy of SimpleUsuarioModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleInterpreteModelImplCopyWith<_$SimpleInterpreteModelImpl>
  get copyWith =>
      __$$SimpleInterpreteModelImplCopyWithImpl<_$SimpleInterpreteModelImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
    )
    usuario,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
    )
    tutor,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String formacao,
    )
    professor,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
    )
    aluno,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
      String condicao,
      String necessidadeEspecial,
      String necessidadeEscolar,
    )
    alunoNapne,
    required TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
      double salary,
    )
    interprete,
  }) {
    return interprete(
      id,
      nome,
      matricula,
      biografia,
      dataCriacao,
      roles,
      especialidade,
      salary,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
    )?
    usuario,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
    )?
    tutor,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String formacao,
    )?
    professor,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
    )?
    aluno,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
      String condicao,
      String necessidadeEspecial,
      String necessidadeEscolar,
    )?
    alunoNapne,
    TResult? Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
      double salary,
    )?
    interprete,
  }) {
    return interprete?.call(
      id,
      nome,
      matricula,
      biografia,
      dataCriacao,
      roles,
      especialidade,
      salary,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
    )?
    usuario,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
    )?
    tutor,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String formacao,
    )?
    professor,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
    )?
    aluno,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      CursoRequestModel curso,
      String condicao,
      String necessidadeEspecial,
      String necessidadeEscolar,
    )?
    alunoNapne,
    TResult Function(
      String id,
      String nome,
      String matricula,
      String? biografia,
      DateTime dataCriacao,
      List<Roles> roles,
      String especialidade,
      double salary,
    )?
    interprete,
    required TResult orElse(),
  }) {
    if (interprete != null) {
      return interprete(
        id,
        nome,
        matricula,
        biografia,
        dataCriacao,
        roles,
        especialidade,
        salary,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SimpleUsuarioModelUsuario value) usuario,
    required TResult Function(_SimpleTutorModel value) tutor,
    required TResult Function(_SimpleProfessorModel value) professor,
    required TResult Function(_SimpleAlunoModel value) aluno,
    required TResult Function(_SimpleAlunoNapneModel value) alunoNapne,
    required TResult Function(_SimpleInterpreteModel value) interprete,
  }) {
    return interprete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SimpleUsuarioModelUsuario value)? usuario,
    TResult? Function(_SimpleTutorModel value)? tutor,
    TResult? Function(_SimpleProfessorModel value)? professor,
    TResult? Function(_SimpleAlunoModel value)? aluno,
    TResult? Function(_SimpleAlunoNapneModel value)? alunoNapne,
    TResult? Function(_SimpleInterpreteModel value)? interprete,
  }) {
    return interprete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SimpleUsuarioModelUsuario value)? usuario,
    TResult Function(_SimpleTutorModel value)? tutor,
    TResult Function(_SimpleProfessorModel value)? professor,
    TResult Function(_SimpleAlunoModel value)? aluno,
    TResult Function(_SimpleAlunoNapneModel value)? alunoNapne,
    TResult Function(_SimpleInterpreteModel value)? interprete,
    required TResult orElse(),
  }) {
    if (interprete != null) {
      return interprete(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SimpleInterpreteModelImplToJson(this);
  }
}

abstract class _SimpleInterpreteModel implements SimpleUsuarioModel {
  const factory _SimpleInterpreteModel({
    required final String id,
    required final String nome,
    required final String matricula,
    final String? biografia,
    required final DateTime dataCriacao,
    required final List<Roles> roles,
    required final String especialidade,
    required final double salary,
  }) = _$SimpleInterpreteModelImpl;

  factory _SimpleInterpreteModel.fromJson(Map<String, dynamic> json) =
      _$SimpleInterpreteModelImpl.fromJson;

  @override
  String get id;
  @override
  String get nome;
  @override
  String get matricula;
  @override
  String? get biografia;
  @override
  DateTime get dataCriacao;
  @override
  List<Roles> get roles;
  String get especialidade;
  double get salary;

  /// Create a copy of SimpleUsuarioModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimpleInterpreteModelImplCopyWith<_$SimpleInterpreteModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SimpleMessageModel _$SimpleMessageModelFromJson(Map<String, dynamic> json) {
  return _SimpleMessageModel.fromJson(json);
}

/// @nodoc
mixin _$SimpleMessageModel {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  /// Serializes this SimpleMessageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SimpleMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SimpleMessageModelCopyWith<SimpleMessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleMessageModelCopyWith<$Res> {
  factory $SimpleMessageModelCopyWith(
    SimpleMessageModel value,
    $Res Function(SimpleMessageModel) then,
  ) = _$SimpleMessageModelCopyWithImpl<$Res, SimpleMessageModel>;
  @useResult
  $Res call({String id, String text});
}

/// @nodoc
class _$SimpleMessageModelCopyWithImpl<$Res, $Val extends SimpleMessageModel>
    implements $SimpleMessageModelCopyWith<$Res> {
  _$SimpleMessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SimpleMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? text = null}) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            text:
                null == text
                    ? _value.text
                    : text // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SimpleMessageModelImplCopyWith<$Res>
    implements $SimpleMessageModelCopyWith<$Res> {
  factory _$$SimpleMessageModelImplCopyWith(
    _$SimpleMessageModelImpl value,
    $Res Function(_$SimpleMessageModelImpl) then,
  ) = __$$SimpleMessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String text});
}

/// @nodoc
class __$$SimpleMessageModelImplCopyWithImpl<$Res>
    extends _$SimpleMessageModelCopyWithImpl<$Res, _$SimpleMessageModelImpl>
    implements _$$SimpleMessageModelImplCopyWith<$Res> {
  __$$SimpleMessageModelImplCopyWithImpl(
    _$SimpleMessageModelImpl _value,
    $Res Function(_$SimpleMessageModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SimpleMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? text = null}) {
    return _then(
      _$SimpleMessageModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        text:
            null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SimpleMessageModelImpl implements _SimpleMessageModel {
  const _$SimpleMessageModelImpl({required this.id, required this.text});

  factory _$SimpleMessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimpleMessageModelImplFromJson(json);

  @override
  final String id;
  @override
  final String text;

  @override
  String toString() {
    return 'SimpleMessageModel(id: $id, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleMessageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, text);

  /// Create a copy of SimpleMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleMessageModelImplCopyWith<_$SimpleMessageModelImpl> get copyWith =>
      __$$SimpleMessageModelImplCopyWithImpl<_$SimpleMessageModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SimpleMessageModelImplToJson(this);
  }
}

abstract class _SimpleMessageModel implements SimpleMessageModel {
  const factory _SimpleMessageModel({
    required final String id,
    required final String text,
  }) = _$SimpleMessageModelImpl;

  factory _SimpleMessageModel.fromJson(Map<String, dynamic> json) =
      _$SimpleMessageModelImpl.fromJson;

  @override
  String get id;
  @override
  String get text;

  /// Create a copy of SimpleMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimpleMessageModelImplCopyWith<_$SimpleMessageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
