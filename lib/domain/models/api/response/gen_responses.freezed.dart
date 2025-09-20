// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gen_responses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UsuarioResponseModel _$UsuarioResponseModelFromJson(Map<String, dynamic> json) {
  switch (json['userType']) {
    case 'aluno':
      return _AlunoResponseModel.fromJson(json);
    case 'alunoNapne':
      return _AlunoNapneResponseModel.fromJson(json);
    case 'professor':
      return _ProfessorResponseModel.fromJson(json);
    case 'tutor':
      return _TutorResponseModel.fromJson(json);
    case 'interprete':
      return _InterpreteResponseModel.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'userType',
        'UsuarioResponseModel',
        'Invalid union type "${json['userType']}"!',
      );
  }
}

/// @nodoc
mixin _$UsuarioResponseModel {
  int get id => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  String get login => throw _privateConstructorUsedError;
  int get matricula => throw _privateConstructorUsedError;
  String? get biografia => throw _privateConstructorUsedError;
  DateTime get dataCriacao => throw _privateConstructorUsedError;
  ConfigAcblResponseModel? get configAcessibilidadeEntity =>
      throw _privateConstructorUsedError;
  List<Roles> get roles => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  String? get firebaseToken => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
    )
    aluno,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
      String condicao,
      String laudo,
      String necessidadeEspecial,
      String necessidadeEscolar,
      String acompanhamento,
      String situacao,
    )
    alunoNapne,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String formacao,
      List<SimpleTopicoModel> topicos,
    )
    professor,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
    )
    tutor,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
      double salary,
      List<SimpleLibrasModel> libras,
    )
    interprete,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
    )?
    aluno,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
      String condicao,
      String laudo,
      String necessidadeEspecial,
      String necessidadeEscolar,
      String acompanhamento,
      String situacao,
    )?
    alunoNapne,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String formacao,
      List<SimpleTopicoModel> topicos,
    )?
    professor,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
    )?
    tutor,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
      double salary,
      List<SimpleLibrasModel> libras,
    )?
    interprete,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
    )?
    aluno,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
      String condicao,
      String laudo,
      String necessidadeEspecial,
      String necessidadeEscolar,
      String acompanhamento,
      String situacao,
    )?
    alunoNapne,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String formacao,
      List<SimpleTopicoModel> topicos,
    )?
    professor,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
    )?
    tutor,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
      double salary,
      List<SimpleLibrasModel> libras,
    )?
    interprete,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AlunoResponseModel value) aluno,
    required TResult Function(_AlunoNapneResponseModel value) alunoNapne,
    required TResult Function(_ProfessorResponseModel value) professor,
    required TResult Function(_TutorResponseModel value) tutor,
    required TResult Function(_InterpreteResponseModel value) interprete,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AlunoResponseModel value)? aluno,
    TResult? Function(_AlunoNapneResponseModel value)? alunoNapne,
    TResult? Function(_ProfessorResponseModel value)? professor,
    TResult? Function(_TutorResponseModel value)? tutor,
    TResult? Function(_InterpreteResponseModel value)? interprete,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AlunoResponseModel value)? aluno,
    TResult Function(_AlunoNapneResponseModel value)? alunoNapne,
    TResult Function(_ProfessorResponseModel value)? professor,
    TResult Function(_TutorResponseModel value)? tutor,
    TResult Function(_InterpreteResponseModel value)? interprete,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this UsuarioResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UsuarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsuarioResponseModelCopyWith<UsuarioResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsuarioResponseModelCopyWith<$Res> {
  factory $UsuarioResponseModelCopyWith(
    UsuarioResponseModel value,
    $Res Function(UsuarioResponseModel) then,
  ) = _$UsuarioResponseModelCopyWithImpl<$Res, UsuarioResponseModel>;
  @useResult
  $Res call({
    int id,
    String nome,
    String login,
    int matricula,
    String? biografia,
    DateTime dataCriacao,
    ConfigAcblResponseModel? configAcessibilidadeEntity,
    List<Roles> roles,
    String? token,
    String? firebaseToken,
  });

  $ConfigAcblResponseModelCopyWith<$Res>? get configAcessibilidadeEntity;
}

/// @nodoc
class _$UsuarioResponseModelCopyWithImpl<
  $Res,
  $Val extends UsuarioResponseModel
>
    implements $UsuarioResponseModelCopyWith<$Res> {
  _$UsuarioResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsuarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? login = null,
    Object? matricula = null,
    Object? biografia = freezed,
    Object? dataCriacao = null,
    Object? configAcessibilidadeEntity = freezed,
    Object? roles = null,
    Object? token = freezed,
    Object? firebaseToken = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            nome:
                null == nome
                    ? _value.nome
                    : nome // ignore: cast_nullable_to_non_nullable
                        as String,
            login:
                null == login
                    ? _value.login
                    : login // ignore: cast_nullable_to_non_nullable
                        as String,
            matricula:
                null == matricula
                    ? _value.matricula
                    : matricula // ignore: cast_nullable_to_non_nullable
                        as int,
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
            configAcessibilidadeEntity:
                freezed == configAcessibilidadeEntity
                    ? _value.configAcessibilidadeEntity
                    : configAcessibilidadeEntity // ignore: cast_nullable_to_non_nullable
                        as ConfigAcblResponseModel?,
            roles:
                null == roles
                    ? _value.roles
                    : roles // ignore: cast_nullable_to_non_nullable
                        as List<Roles>,
            token:
                freezed == token
                    ? _value.token
                    : token // ignore: cast_nullable_to_non_nullable
                        as String?,
            firebaseToken:
                freezed == firebaseToken
                    ? _value.firebaseToken
                    : firebaseToken // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of UsuarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConfigAcblResponseModelCopyWith<$Res>? get configAcessibilidadeEntity {
    if (_value.configAcessibilidadeEntity == null) {
      return null;
    }

    return $ConfigAcblResponseModelCopyWith<$Res>(
      _value.configAcessibilidadeEntity!,
      (value) {
        return _then(
          _value.copyWith(configAcessibilidadeEntity: value) as $Val,
        );
      },
    );
  }
}

/// @nodoc
abstract class _$$AlunoResponseModelImplCopyWith<$Res>
    implements $UsuarioResponseModelCopyWith<$Res> {
  factory _$$AlunoResponseModelImplCopyWith(
    _$AlunoResponseModelImpl value,
    $Res Function(_$AlunoResponseModelImpl) then,
  ) = __$$AlunoResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String nome,
    String login,
    int matricula,
    String? biografia,
    DateTime dataCriacao,
    ConfigAcblResponseModel? configAcessibilidadeEntity,
    List<Roles> roles,
    String? token,
    String? firebaseToken,
    CursoRequestModel curso,
  });

  @override
  $ConfigAcblResponseModelCopyWith<$Res>? get configAcessibilidadeEntity;
  $CursoRequestModelCopyWith<$Res> get curso;
}

/// @nodoc
class __$$AlunoResponseModelImplCopyWithImpl<$Res>
    extends _$UsuarioResponseModelCopyWithImpl<$Res, _$AlunoResponseModelImpl>
    implements _$$AlunoResponseModelImplCopyWith<$Res> {
  __$$AlunoResponseModelImplCopyWithImpl(
    _$AlunoResponseModelImpl _value,
    $Res Function(_$AlunoResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UsuarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? login = null,
    Object? matricula = null,
    Object? biografia = freezed,
    Object? dataCriacao = null,
    Object? configAcessibilidadeEntity = freezed,
    Object? roles = null,
    Object? token = freezed,
    Object? firebaseToken = freezed,
    Object? curso = null,
  }) {
    return _then(
      _$AlunoResponseModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        nome:
            null == nome
                ? _value.nome
                : nome // ignore: cast_nullable_to_non_nullable
                    as String,
        login:
            null == login
                ? _value.login
                : login // ignore: cast_nullable_to_non_nullable
                    as String,
        matricula:
            null == matricula
                ? _value.matricula
                : matricula // ignore: cast_nullable_to_non_nullable
                    as int,
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
        configAcessibilidadeEntity:
            freezed == configAcessibilidadeEntity
                ? _value.configAcessibilidadeEntity
                : configAcessibilidadeEntity // ignore: cast_nullable_to_non_nullable
                    as ConfigAcblResponseModel?,
        roles:
            null == roles
                ? _value._roles
                : roles // ignore: cast_nullable_to_non_nullable
                    as List<Roles>,
        token:
            freezed == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                    as String?,
        firebaseToken:
            freezed == firebaseToken
                ? _value.firebaseToken
                : firebaseToken // ignore: cast_nullable_to_non_nullable
                    as String?,
        curso:
            null == curso
                ? _value.curso
                : curso // ignore: cast_nullable_to_non_nullable
                    as CursoRequestModel,
      ),
    );
  }

  /// Create a copy of UsuarioResponseModel
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
class _$AlunoResponseModelImpl implements _AlunoResponseModel {
  const _$AlunoResponseModelImpl({
    required this.id,
    required this.nome,
    required this.login,
    required this.matricula,
    this.biografia,
    required this.dataCriacao,
    this.configAcessibilidadeEntity,
    required final List<Roles> roles,
    this.token,
    this.firebaseToken,
    required this.curso,
    final String? $type,
  }) : _roles = roles,
       $type = $type ?? 'aluno';

  factory _$AlunoResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlunoResponseModelImplFromJson(json);

  @override
  final int id;
  @override
  final String nome;
  @override
  final String login;
  @override
  final int matricula;
  @override
  final String? biografia;
  @override
  final DateTime dataCriacao;
  @override
  final ConfigAcblResponseModel? configAcessibilidadeEntity;
  final List<Roles> _roles;
  @override
  List<Roles> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  final String? token;
  @override
  final String? firebaseToken;
  @override
  final CursoRequestModel curso;

  @JsonKey(name: 'userType')
  final String $type;

  @override
  String toString() {
    return 'UsuarioResponseModel.aluno(id: $id, nome: $nome, login: $login, matricula: $matricula, biografia: $biografia, dataCriacao: $dataCriacao, configAcessibilidadeEntity: $configAcessibilidadeEntity, roles: $roles, token: $token, firebaseToken: $firebaseToken, curso: $curso)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlunoResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.matricula, matricula) ||
                other.matricula == matricula) &&
            (identical(other.biografia, biografia) ||
                other.biografia == biografia) &&
            (identical(other.dataCriacao, dataCriacao) ||
                other.dataCriacao == dataCriacao) &&
            (identical(
                  other.configAcessibilidadeEntity,
                  configAcessibilidadeEntity,
                ) ||
                other.configAcessibilidadeEntity ==
                    configAcessibilidadeEntity) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.firebaseToken, firebaseToken) ||
                other.firebaseToken == firebaseToken) &&
            (identical(other.curso, curso) || other.curso == curso));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    nome,
    login,
    matricula,
    biografia,
    dataCriacao,
    configAcessibilidadeEntity,
    const DeepCollectionEquality().hash(_roles),
    token,
    firebaseToken,
    curso,
  );

  /// Create a copy of UsuarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlunoResponseModelImplCopyWith<_$AlunoResponseModelImpl> get copyWith =>
      __$$AlunoResponseModelImplCopyWithImpl<_$AlunoResponseModelImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
    )
    aluno,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
      String condicao,
      String laudo,
      String necessidadeEspecial,
      String necessidadeEscolar,
      String acompanhamento,
      String situacao,
    )
    alunoNapne,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String formacao,
      List<SimpleTopicoModel> topicos,
    )
    professor,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
    )
    tutor,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
      double salary,
      List<SimpleLibrasModel> libras,
    )
    interprete,
  }) {
    return aluno(
      id,
      nome,
      login,
      matricula,
      biografia,
      dataCriacao,
      configAcessibilidadeEntity,
      roles,
      token,
      firebaseToken,
      curso,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
    )?
    aluno,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
      String condicao,
      String laudo,
      String necessidadeEspecial,
      String necessidadeEscolar,
      String acompanhamento,
      String situacao,
    )?
    alunoNapne,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String formacao,
      List<SimpleTopicoModel> topicos,
    )?
    professor,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
    )?
    tutor,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
      double salary,
      List<SimpleLibrasModel> libras,
    )?
    interprete,
  }) {
    return aluno?.call(
      id,
      nome,
      login,
      matricula,
      biografia,
      dataCriacao,
      configAcessibilidadeEntity,
      roles,
      token,
      firebaseToken,
      curso,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
    )?
    aluno,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
      String condicao,
      String laudo,
      String necessidadeEspecial,
      String necessidadeEscolar,
      String acompanhamento,
      String situacao,
    )?
    alunoNapne,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String formacao,
      List<SimpleTopicoModel> topicos,
    )?
    professor,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
    )?
    tutor,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
      double salary,
      List<SimpleLibrasModel> libras,
    )?
    interprete,
    required TResult orElse(),
  }) {
    if (aluno != null) {
      return aluno(
        id,
        nome,
        login,
        matricula,
        biografia,
        dataCriacao,
        configAcessibilidadeEntity,
        roles,
        token,
        firebaseToken,
        curso,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AlunoResponseModel value) aluno,
    required TResult Function(_AlunoNapneResponseModel value) alunoNapne,
    required TResult Function(_ProfessorResponseModel value) professor,
    required TResult Function(_TutorResponseModel value) tutor,
    required TResult Function(_InterpreteResponseModel value) interprete,
  }) {
    return aluno(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AlunoResponseModel value)? aluno,
    TResult? Function(_AlunoNapneResponseModel value)? alunoNapne,
    TResult? Function(_ProfessorResponseModel value)? professor,
    TResult? Function(_TutorResponseModel value)? tutor,
    TResult? Function(_InterpreteResponseModel value)? interprete,
  }) {
    return aluno?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AlunoResponseModel value)? aluno,
    TResult Function(_AlunoNapneResponseModel value)? alunoNapne,
    TResult Function(_ProfessorResponseModel value)? professor,
    TResult Function(_TutorResponseModel value)? tutor,
    TResult Function(_InterpreteResponseModel value)? interprete,
    required TResult orElse(),
  }) {
    if (aluno != null) {
      return aluno(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AlunoResponseModelImplToJson(this);
  }
}

abstract class _AlunoResponseModel implements UsuarioResponseModel {
  const factory _AlunoResponseModel({
    required final int id,
    required final String nome,
    required final String login,
    required final int matricula,
    final String? biografia,
    required final DateTime dataCriacao,
    final ConfigAcblResponseModel? configAcessibilidadeEntity,
    required final List<Roles> roles,
    final String? token,
    final String? firebaseToken,
    required final CursoRequestModel curso,
  }) = _$AlunoResponseModelImpl;

  factory _AlunoResponseModel.fromJson(Map<String, dynamic> json) =
      _$AlunoResponseModelImpl.fromJson;

  @override
  int get id;
  @override
  String get nome;
  @override
  String get login;
  @override
  int get matricula;
  @override
  String? get biografia;
  @override
  DateTime get dataCriacao;
  @override
  ConfigAcblResponseModel? get configAcessibilidadeEntity;
  @override
  List<Roles> get roles;
  @override
  String? get token;
  @override
  String? get firebaseToken;
  CursoRequestModel get curso;

  /// Create a copy of UsuarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlunoResponseModelImplCopyWith<_$AlunoResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AlunoNapneResponseModelImplCopyWith<$Res>
    implements $UsuarioResponseModelCopyWith<$Res> {
  factory _$$AlunoNapneResponseModelImplCopyWith(
    _$AlunoNapneResponseModelImpl value,
    $Res Function(_$AlunoNapneResponseModelImpl) then,
  ) = __$$AlunoNapneResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String nome,
    String login,
    int matricula,
    String? biografia,
    DateTime dataCriacao,
    ConfigAcblResponseModel? configAcessibilidadeEntity,
    List<Roles> roles,
    String? token,
    String? firebaseToken,
    CursoRequestModel curso,
    String condicao,
    String laudo,
    String necessidadeEspecial,
    String necessidadeEscolar,
    String acompanhamento,
    String situacao,
  });

  @override
  $ConfigAcblResponseModelCopyWith<$Res>? get configAcessibilidadeEntity;
  $CursoRequestModelCopyWith<$Res> get curso;
}

/// @nodoc
class __$$AlunoNapneResponseModelImplCopyWithImpl<$Res>
    extends
        _$UsuarioResponseModelCopyWithImpl<$Res, _$AlunoNapneResponseModelImpl>
    implements _$$AlunoNapneResponseModelImplCopyWith<$Res> {
  __$$AlunoNapneResponseModelImplCopyWithImpl(
    _$AlunoNapneResponseModelImpl _value,
    $Res Function(_$AlunoNapneResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UsuarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? login = null,
    Object? matricula = null,
    Object? biografia = freezed,
    Object? dataCriacao = null,
    Object? configAcessibilidadeEntity = freezed,
    Object? roles = null,
    Object? token = freezed,
    Object? firebaseToken = freezed,
    Object? curso = null,
    Object? condicao = null,
    Object? laudo = null,
    Object? necessidadeEspecial = null,
    Object? necessidadeEscolar = null,
    Object? acompanhamento = null,
    Object? situacao = null,
  }) {
    return _then(
      _$AlunoNapneResponseModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        nome:
            null == nome
                ? _value.nome
                : nome // ignore: cast_nullable_to_non_nullable
                    as String,
        login:
            null == login
                ? _value.login
                : login // ignore: cast_nullable_to_non_nullable
                    as String,
        matricula:
            null == matricula
                ? _value.matricula
                : matricula // ignore: cast_nullable_to_non_nullable
                    as int,
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
        configAcessibilidadeEntity:
            freezed == configAcessibilidadeEntity
                ? _value.configAcessibilidadeEntity
                : configAcessibilidadeEntity // ignore: cast_nullable_to_non_nullable
                    as ConfigAcblResponseModel?,
        roles:
            null == roles
                ? _value._roles
                : roles // ignore: cast_nullable_to_non_nullable
                    as List<Roles>,
        token:
            freezed == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                    as String?,
        firebaseToken:
            freezed == firebaseToken
                ? _value.firebaseToken
                : firebaseToken // ignore: cast_nullable_to_non_nullable
                    as String?,
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
        laudo:
            null == laudo
                ? _value.laudo
                : laudo // ignore: cast_nullable_to_non_nullable
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
        acompanhamento:
            null == acompanhamento
                ? _value.acompanhamento
                : acompanhamento // ignore: cast_nullable_to_non_nullable
                    as String,
        situacao:
            null == situacao
                ? _value.situacao
                : situacao // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }

  /// Create a copy of UsuarioResponseModel
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
class _$AlunoNapneResponseModelImpl implements _AlunoNapneResponseModel {
  const _$AlunoNapneResponseModelImpl({
    required this.id,
    required this.nome,
    required this.login,
    required this.matricula,
    this.biografia,
    required this.dataCriacao,
    this.configAcessibilidadeEntity,
    required final List<Roles> roles,
    this.token,
    this.firebaseToken,
    required this.curso,
    required this.condicao,
    required this.laudo,
    required this.necessidadeEspecial,
    required this.necessidadeEscolar,
    required this.acompanhamento,
    required this.situacao,
    final String? $type,
  }) : _roles = roles,
       $type = $type ?? 'alunoNapne';

  factory _$AlunoNapneResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlunoNapneResponseModelImplFromJson(json);

  @override
  final int id;
  @override
  final String nome;
  @override
  final String login;
  @override
  final int matricula;
  @override
  final String? biografia;
  @override
  final DateTime dataCriacao;
  @override
  final ConfigAcblResponseModel? configAcessibilidadeEntity;
  final List<Roles> _roles;
  @override
  List<Roles> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  final String? token;
  @override
  final String? firebaseToken;
  @override
  final CursoRequestModel curso;
  @override
  final String condicao;
  @override
  final String laudo;
  @override
  final String necessidadeEspecial;
  @override
  final String necessidadeEscolar;
  @override
  final String acompanhamento;
  @override
  final String situacao;

  @JsonKey(name: 'userType')
  final String $type;

  @override
  String toString() {
    return 'UsuarioResponseModel.alunoNapne(id: $id, nome: $nome, login: $login, matricula: $matricula, biografia: $biografia, dataCriacao: $dataCriacao, configAcessibilidadeEntity: $configAcessibilidadeEntity, roles: $roles, token: $token, firebaseToken: $firebaseToken, curso: $curso, condicao: $condicao, laudo: $laudo, necessidadeEspecial: $necessidadeEspecial, necessidadeEscolar: $necessidadeEscolar, acompanhamento: $acompanhamento, situacao: $situacao)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlunoNapneResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.matricula, matricula) ||
                other.matricula == matricula) &&
            (identical(other.biografia, biografia) ||
                other.biografia == biografia) &&
            (identical(other.dataCriacao, dataCriacao) ||
                other.dataCriacao == dataCriacao) &&
            (identical(
                  other.configAcessibilidadeEntity,
                  configAcessibilidadeEntity,
                ) ||
                other.configAcessibilidadeEntity ==
                    configAcessibilidadeEntity) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.firebaseToken, firebaseToken) ||
                other.firebaseToken == firebaseToken) &&
            (identical(other.curso, curso) || other.curso == curso) &&
            (identical(other.condicao, condicao) ||
                other.condicao == condicao) &&
            (identical(other.laudo, laudo) || other.laudo == laudo) &&
            (identical(other.necessidadeEspecial, necessidadeEspecial) ||
                other.necessidadeEspecial == necessidadeEspecial) &&
            (identical(other.necessidadeEscolar, necessidadeEscolar) ||
                other.necessidadeEscolar == necessidadeEscolar) &&
            (identical(other.acompanhamento, acompanhamento) ||
                other.acompanhamento == acompanhamento) &&
            (identical(other.situacao, situacao) ||
                other.situacao == situacao));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    nome,
    login,
    matricula,
    biografia,
    dataCriacao,
    configAcessibilidadeEntity,
    const DeepCollectionEquality().hash(_roles),
    token,
    firebaseToken,
    curso,
    condicao,
    laudo,
    necessidadeEspecial,
    necessidadeEscolar,
    acompanhamento,
    situacao,
  );

  /// Create a copy of UsuarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlunoNapneResponseModelImplCopyWith<_$AlunoNapneResponseModelImpl>
  get copyWith => __$$AlunoNapneResponseModelImplCopyWithImpl<
    _$AlunoNapneResponseModelImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
    )
    aluno,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
      String condicao,
      String laudo,
      String necessidadeEspecial,
      String necessidadeEscolar,
      String acompanhamento,
      String situacao,
    )
    alunoNapne,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String formacao,
      List<SimpleTopicoModel> topicos,
    )
    professor,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
    )
    tutor,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
      double salary,
      List<SimpleLibrasModel> libras,
    )
    interprete,
  }) {
    return alunoNapne(
      id,
      nome,
      login,
      matricula,
      biografia,
      dataCriacao,
      configAcessibilidadeEntity,
      roles,
      token,
      firebaseToken,
      curso,
      condicao,
      laudo,
      necessidadeEspecial,
      necessidadeEscolar,
      acompanhamento,
      situacao,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
    )?
    aluno,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
      String condicao,
      String laudo,
      String necessidadeEspecial,
      String necessidadeEscolar,
      String acompanhamento,
      String situacao,
    )?
    alunoNapne,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String formacao,
      List<SimpleTopicoModel> topicos,
    )?
    professor,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
    )?
    tutor,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
      double salary,
      List<SimpleLibrasModel> libras,
    )?
    interprete,
  }) {
    return alunoNapne?.call(
      id,
      nome,
      login,
      matricula,
      biografia,
      dataCriacao,
      configAcessibilidadeEntity,
      roles,
      token,
      firebaseToken,
      curso,
      condicao,
      laudo,
      necessidadeEspecial,
      necessidadeEscolar,
      acompanhamento,
      situacao,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
    )?
    aluno,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
      String condicao,
      String laudo,
      String necessidadeEspecial,
      String necessidadeEscolar,
      String acompanhamento,
      String situacao,
    )?
    alunoNapne,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String formacao,
      List<SimpleTopicoModel> topicos,
    )?
    professor,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
    )?
    tutor,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
      double salary,
      List<SimpleLibrasModel> libras,
    )?
    interprete,
    required TResult orElse(),
  }) {
    if (alunoNapne != null) {
      return alunoNapne(
        id,
        nome,
        login,
        matricula,
        biografia,
        dataCriacao,
        configAcessibilidadeEntity,
        roles,
        token,
        firebaseToken,
        curso,
        condicao,
        laudo,
        necessidadeEspecial,
        necessidadeEscolar,
        acompanhamento,
        situacao,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AlunoResponseModel value) aluno,
    required TResult Function(_AlunoNapneResponseModel value) alunoNapne,
    required TResult Function(_ProfessorResponseModel value) professor,
    required TResult Function(_TutorResponseModel value) tutor,
    required TResult Function(_InterpreteResponseModel value) interprete,
  }) {
    return alunoNapne(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AlunoResponseModel value)? aluno,
    TResult? Function(_AlunoNapneResponseModel value)? alunoNapne,
    TResult? Function(_ProfessorResponseModel value)? professor,
    TResult? Function(_TutorResponseModel value)? tutor,
    TResult? Function(_InterpreteResponseModel value)? interprete,
  }) {
    return alunoNapne?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AlunoResponseModel value)? aluno,
    TResult Function(_AlunoNapneResponseModel value)? alunoNapne,
    TResult Function(_ProfessorResponseModel value)? professor,
    TResult Function(_TutorResponseModel value)? tutor,
    TResult Function(_InterpreteResponseModel value)? interprete,
    required TResult orElse(),
  }) {
    if (alunoNapne != null) {
      return alunoNapne(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AlunoNapneResponseModelImplToJson(this);
  }
}

abstract class _AlunoNapneResponseModel implements UsuarioResponseModel {
  const factory _AlunoNapneResponseModel({
    required final int id,
    required final String nome,
    required final String login,
    required final int matricula,
    final String? biografia,
    required final DateTime dataCriacao,
    final ConfigAcblResponseModel? configAcessibilidadeEntity,
    required final List<Roles> roles,
    final String? token,
    final String? firebaseToken,
    required final CursoRequestModel curso,
    required final String condicao,
    required final String laudo,
    required final String necessidadeEspecial,
    required final String necessidadeEscolar,
    required final String acompanhamento,
    required final String situacao,
  }) = _$AlunoNapneResponseModelImpl;

  factory _AlunoNapneResponseModel.fromJson(Map<String, dynamic> json) =
      _$AlunoNapneResponseModelImpl.fromJson;

  @override
  int get id;
  @override
  String get nome;
  @override
  String get login;
  @override
  int get matricula;
  @override
  String? get biografia;
  @override
  DateTime get dataCriacao;
  @override
  ConfigAcblResponseModel? get configAcessibilidadeEntity;
  @override
  List<Roles> get roles;
  @override
  String? get token;
  @override
  String? get firebaseToken;
  CursoRequestModel get curso;
  String get condicao;
  String get laudo;
  String get necessidadeEspecial;
  String get necessidadeEscolar;
  String get acompanhamento;
  String get situacao;

  /// Create a copy of UsuarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlunoNapneResponseModelImplCopyWith<_$AlunoNapneResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfessorResponseModelImplCopyWith<$Res>
    implements $UsuarioResponseModelCopyWith<$Res> {
  factory _$$ProfessorResponseModelImplCopyWith(
    _$ProfessorResponseModelImpl value,
    $Res Function(_$ProfessorResponseModelImpl) then,
  ) = __$$ProfessorResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String nome,
    String login,
    int matricula,
    String? biografia,
    DateTime dataCriacao,
    ConfigAcblResponseModel? configAcessibilidadeEntity,
    List<Roles> roles,
    String? token,
    String? firebaseToken,
    String formacao,
    List<SimpleTopicoModel> topicos,
  });

  @override
  $ConfigAcblResponseModelCopyWith<$Res>? get configAcessibilidadeEntity;
}

/// @nodoc
class __$$ProfessorResponseModelImplCopyWithImpl<$Res>
    extends
        _$UsuarioResponseModelCopyWithImpl<$Res, _$ProfessorResponseModelImpl>
    implements _$$ProfessorResponseModelImplCopyWith<$Res> {
  __$$ProfessorResponseModelImplCopyWithImpl(
    _$ProfessorResponseModelImpl _value,
    $Res Function(_$ProfessorResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UsuarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? login = null,
    Object? matricula = null,
    Object? biografia = freezed,
    Object? dataCriacao = null,
    Object? configAcessibilidadeEntity = freezed,
    Object? roles = null,
    Object? token = freezed,
    Object? firebaseToken = freezed,
    Object? formacao = null,
    Object? topicos = null,
  }) {
    return _then(
      _$ProfessorResponseModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        nome:
            null == nome
                ? _value.nome
                : nome // ignore: cast_nullable_to_non_nullable
                    as String,
        login:
            null == login
                ? _value.login
                : login // ignore: cast_nullable_to_non_nullable
                    as String,
        matricula:
            null == matricula
                ? _value.matricula
                : matricula // ignore: cast_nullable_to_non_nullable
                    as int,
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
        configAcessibilidadeEntity:
            freezed == configAcessibilidadeEntity
                ? _value.configAcessibilidadeEntity
                : configAcessibilidadeEntity // ignore: cast_nullable_to_non_nullable
                    as ConfigAcblResponseModel?,
        roles:
            null == roles
                ? _value._roles
                : roles // ignore: cast_nullable_to_non_nullable
                    as List<Roles>,
        token:
            freezed == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                    as String?,
        firebaseToken:
            freezed == firebaseToken
                ? _value.firebaseToken
                : firebaseToken // ignore: cast_nullable_to_non_nullable
                    as String?,
        formacao:
            null == formacao
                ? _value.formacao
                : formacao // ignore: cast_nullable_to_non_nullable
                    as String,
        topicos:
            null == topicos
                ? _value._topicos
                : topicos // ignore: cast_nullable_to_non_nullable
                    as List<SimpleTopicoModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfessorResponseModelImpl implements _ProfessorResponseModel {
  const _$ProfessorResponseModelImpl({
    required this.id,
    required this.nome,
    required this.login,
    required this.matricula,
    this.biografia,
    required this.dataCriacao,
    this.configAcessibilidadeEntity,
    required final List<Roles> roles,
    this.token,
    this.firebaseToken,
    required this.formacao,
    required final List<SimpleTopicoModel> topicos,
    final String? $type,
  }) : _roles = roles,
       _topicos = topicos,
       $type = $type ?? 'professor';

  factory _$ProfessorResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfessorResponseModelImplFromJson(json);

  @override
  final int id;
  @override
  final String nome;
  @override
  final String login;
  @override
  final int matricula;
  @override
  final String? biografia;
  @override
  final DateTime dataCriacao;
  @override
  final ConfigAcblResponseModel? configAcessibilidadeEntity;
  final List<Roles> _roles;
  @override
  List<Roles> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  final String? token;
  @override
  final String? firebaseToken;
  @override
  final String formacao;
  final List<SimpleTopicoModel> _topicos;
  @override
  List<SimpleTopicoModel> get topicos {
    if (_topicos is EqualUnmodifiableListView) return _topicos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topicos);
  }

  @JsonKey(name: 'userType')
  final String $type;

  @override
  String toString() {
    return 'UsuarioResponseModel.professor(id: $id, nome: $nome, login: $login, matricula: $matricula, biografia: $biografia, dataCriacao: $dataCriacao, configAcessibilidadeEntity: $configAcessibilidadeEntity, roles: $roles, token: $token, firebaseToken: $firebaseToken, formacao: $formacao, topicos: $topicos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfessorResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.matricula, matricula) ||
                other.matricula == matricula) &&
            (identical(other.biografia, biografia) ||
                other.biografia == biografia) &&
            (identical(other.dataCriacao, dataCriacao) ||
                other.dataCriacao == dataCriacao) &&
            (identical(
                  other.configAcessibilidadeEntity,
                  configAcessibilidadeEntity,
                ) ||
                other.configAcessibilidadeEntity ==
                    configAcessibilidadeEntity) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.firebaseToken, firebaseToken) ||
                other.firebaseToken == firebaseToken) &&
            (identical(other.formacao, formacao) ||
                other.formacao == formacao) &&
            const DeepCollectionEquality().equals(other._topicos, _topicos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    nome,
    login,
    matricula,
    biografia,
    dataCriacao,
    configAcessibilidadeEntity,
    const DeepCollectionEquality().hash(_roles),
    token,
    firebaseToken,
    formacao,
    const DeepCollectionEquality().hash(_topicos),
  );

  /// Create a copy of UsuarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfessorResponseModelImplCopyWith<_$ProfessorResponseModelImpl>
  get copyWith =>
      __$$ProfessorResponseModelImplCopyWithImpl<_$ProfessorResponseModelImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
    )
    aluno,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
      String condicao,
      String laudo,
      String necessidadeEspecial,
      String necessidadeEscolar,
      String acompanhamento,
      String situacao,
    )
    alunoNapne,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String formacao,
      List<SimpleTopicoModel> topicos,
    )
    professor,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
    )
    tutor,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
      double salary,
      List<SimpleLibrasModel> libras,
    )
    interprete,
  }) {
    return professor(
      id,
      nome,
      login,
      matricula,
      biografia,
      dataCriacao,
      configAcessibilidadeEntity,
      roles,
      token,
      firebaseToken,
      formacao,
      topicos,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
    )?
    aluno,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
      String condicao,
      String laudo,
      String necessidadeEspecial,
      String necessidadeEscolar,
      String acompanhamento,
      String situacao,
    )?
    alunoNapne,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String formacao,
      List<SimpleTopicoModel> topicos,
    )?
    professor,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
    )?
    tutor,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
      double salary,
      List<SimpleLibrasModel> libras,
    )?
    interprete,
  }) {
    return professor?.call(
      id,
      nome,
      login,
      matricula,
      biografia,
      dataCriacao,
      configAcessibilidadeEntity,
      roles,
      token,
      firebaseToken,
      formacao,
      topicos,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
    )?
    aluno,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
      String condicao,
      String laudo,
      String necessidadeEspecial,
      String necessidadeEscolar,
      String acompanhamento,
      String situacao,
    )?
    alunoNapne,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String formacao,
      List<SimpleTopicoModel> topicos,
    )?
    professor,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
    )?
    tutor,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
      double salary,
      List<SimpleLibrasModel> libras,
    )?
    interprete,
    required TResult orElse(),
  }) {
    if (professor != null) {
      return professor(
        id,
        nome,
        login,
        matricula,
        biografia,
        dataCriacao,
        configAcessibilidadeEntity,
        roles,
        token,
        firebaseToken,
        formacao,
        topicos,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AlunoResponseModel value) aluno,
    required TResult Function(_AlunoNapneResponseModel value) alunoNapne,
    required TResult Function(_ProfessorResponseModel value) professor,
    required TResult Function(_TutorResponseModel value) tutor,
    required TResult Function(_InterpreteResponseModel value) interprete,
  }) {
    return professor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AlunoResponseModel value)? aluno,
    TResult? Function(_AlunoNapneResponseModel value)? alunoNapne,
    TResult? Function(_ProfessorResponseModel value)? professor,
    TResult? Function(_TutorResponseModel value)? tutor,
    TResult? Function(_InterpreteResponseModel value)? interprete,
  }) {
    return professor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AlunoResponseModel value)? aluno,
    TResult Function(_AlunoNapneResponseModel value)? alunoNapne,
    TResult Function(_ProfessorResponseModel value)? professor,
    TResult Function(_TutorResponseModel value)? tutor,
    TResult Function(_InterpreteResponseModel value)? interprete,
    required TResult orElse(),
  }) {
    if (professor != null) {
      return professor(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfessorResponseModelImplToJson(this);
  }
}

abstract class _ProfessorResponseModel implements UsuarioResponseModel {
  const factory _ProfessorResponseModel({
    required final int id,
    required final String nome,
    required final String login,
    required final int matricula,
    final String? biografia,
    required final DateTime dataCriacao,
    final ConfigAcblResponseModel? configAcessibilidadeEntity,
    required final List<Roles> roles,
    final String? token,
    final String? firebaseToken,
    required final String formacao,
    required final List<SimpleTopicoModel> topicos,
  }) = _$ProfessorResponseModelImpl;

  factory _ProfessorResponseModel.fromJson(Map<String, dynamic> json) =
      _$ProfessorResponseModelImpl.fromJson;

  @override
  int get id;
  @override
  String get nome;
  @override
  String get login;
  @override
  int get matricula;
  @override
  String? get biografia;
  @override
  DateTime get dataCriacao;
  @override
  ConfigAcblResponseModel? get configAcessibilidadeEntity;
  @override
  List<Roles> get roles;
  @override
  String? get token;
  @override
  String? get firebaseToken;
  String get formacao;
  List<SimpleTopicoModel> get topicos;

  /// Create a copy of UsuarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfessorResponseModelImplCopyWith<_$ProfessorResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TutorResponseModelImplCopyWith<$Res>
    implements $UsuarioResponseModelCopyWith<$Res> {
  factory _$$TutorResponseModelImplCopyWith(
    _$TutorResponseModelImpl value,
    $Res Function(_$TutorResponseModelImpl) then,
  ) = __$$TutorResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String nome,
    String login,
    int matricula,
    String? biografia,
    DateTime dataCriacao,
    ConfigAcblResponseModel? configAcessibilidadeEntity,
    List<Roles> roles,
    String? token,
    String? firebaseToken,
    String especialidade,
  });

  @override
  $ConfigAcblResponseModelCopyWith<$Res>? get configAcessibilidadeEntity;
}

/// @nodoc
class __$$TutorResponseModelImplCopyWithImpl<$Res>
    extends _$UsuarioResponseModelCopyWithImpl<$Res, _$TutorResponseModelImpl>
    implements _$$TutorResponseModelImplCopyWith<$Res> {
  __$$TutorResponseModelImplCopyWithImpl(
    _$TutorResponseModelImpl _value,
    $Res Function(_$TutorResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UsuarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? login = null,
    Object? matricula = null,
    Object? biografia = freezed,
    Object? dataCriacao = null,
    Object? configAcessibilidadeEntity = freezed,
    Object? roles = null,
    Object? token = freezed,
    Object? firebaseToken = freezed,
    Object? especialidade = null,
  }) {
    return _then(
      _$TutorResponseModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        nome:
            null == nome
                ? _value.nome
                : nome // ignore: cast_nullable_to_non_nullable
                    as String,
        login:
            null == login
                ? _value.login
                : login // ignore: cast_nullable_to_non_nullable
                    as String,
        matricula:
            null == matricula
                ? _value.matricula
                : matricula // ignore: cast_nullable_to_non_nullable
                    as int,
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
        configAcessibilidadeEntity:
            freezed == configAcessibilidadeEntity
                ? _value.configAcessibilidadeEntity
                : configAcessibilidadeEntity // ignore: cast_nullable_to_non_nullable
                    as ConfigAcblResponseModel?,
        roles:
            null == roles
                ? _value._roles
                : roles // ignore: cast_nullable_to_non_nullable
                    as List<Roles>,
        token:
            freezed == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                    as String?,
        firebaseToken:
            freezed == firebaseToken
                ? _value.firebaseToken
                : firebaseToken // ignore: cast_nullable_to_non_nullable
                    as String?,
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
class _$TutorResponseModelImpl implements _TutorResponseModel {
  const _$TutorResponseModelImpl({
    required this.id,
    required this.nome,
    required this.login,
    required this.matricula,
    this.biografia,
    required this.dataCriacao,
    this.configAcessibilidadeEntity,
    required final List<Roles> roles,
    this.token,
    this.firebaseToken,
    required this.especialidade,
    final String? $type,
  }) : _roles = roles,
       $type = $type ?? 'tutor';

  factory _$TutorResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TutorResponseModelImplFromJson(json);

  @override
  final int id;
  @override
  final String nome;
  @override
  final String login;
  @override
  final int matricula;
  @override
  final String? biografia;
  @override
  final DateTime dataCriacao;
  @override
  final ConfigAcblResponseModel? configAcessibilidadeEntity;
  final List<Roles> _roles;
  @override
  List<Roles> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  final String? token;
  @override
  final String? firebaseToken;
  @override
  final String especialidade;

  @JsonKey(name: 'userType')
  final String $type;

  @override
  String toString() {
    return 'UsuarioResponseModel.tutor(id: $id, nome: $nome, login: $login, matricula: $matricula, biografia: $biografia, dataCriacao: $dataCriacao, configAcessibilidadeEntity: $configAcessibilidadeEntity, roles: $roles, token: $token, firebaseToken: $firebaseToken, especialidade: $especialidade)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TutorResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.matricula, matricula) ||
                other.matricula == matricula) &&
            (identical(other.biografia, biografia) ||
                other.biografia == biografia) &&
            (identical(other.dataCriacao, dataCriacao) ||
                other.dataCriacao == dataCriacao) &&
            (identical(
                  other.configAcessibilidadeEntity,
                  configAcessibilidadeEntity,
                ) ||
                other.configAcessibilidadeEntity ==
                    configAcessibilidadeEntity) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.firebaseToken, firebaseToken) ||
                other.firebaseToken == firebaseToken) &&
            (identical(other.especialidade, especialidade) ||
                other.especialidade == especialidade));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    nome,
    login,
    matricula,
    biografia,
    dataCriacao,
    configAcessibilidadeEntity,
    const DeepCollectionEquality().hash(_roles),
    token,
    firebaseToken,
    especialidade,
  );

  /// Create a copy of UsuarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TutorResponseModelImplCopyWith<_$TutorResponseModelImpl> get copyWith =>
      __$$TutorResponseModelImplCopyWithImpl<_$TutorResponseModelImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
    )
    aluno,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
      String condicao,
      String laudo,
      String necessidadeEspecial,
      String necessidadeEscolar,
      String acompanhamento,
      String situacao,
    )
    alunoNapne,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String formacao,
      List<SimpleTopicoModel> topicos,
    )
    professor,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
    )
    tutor,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
      double salary,
      List<SimpleLibrasModel> libras,
    )
    interprete,
  }) {
    return tutor(
      id,
      nome,
      login,
      matricula,
      biografia,
      dataCriacao,
      configAcessibilidadeEntity,
      roles,
      token,
      firebaseToken,
      especialidade,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
    )?
    aluno,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
      String condicao,
      String laudo,
      String necessidadeEspecial,
      String necessidadeEscolar,
      String acompanhamento,
      String situacao,
    )?
    alunoNapne,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String formacao,
      List<SimpleTopicoModel> topicos,
    )?
    professor,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
    )?
    tutor,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
      double salary,
      List<SimpleLibrasModel> libras,
    )?
    interprete,
  }) {
    return tutor?.call(
      id,
      nome,
      login,
      matricula,
      biografia,
      dataCriacao,
      configAcessibilidadeEntity,
      roles,
      token,
      firebaseToken,
      especialidade,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
    )?
    aluno,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
      String condicao,
      String laudo,
      String necessidadeEspecial,
      String necessidadeEscolar,
      String acompanhamento,
      String situacao,
    )?
    alunoNapne,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String formacao,
      List<SimpleTopicoModel> topicos,
    )?
    professor,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
    )?
    tutor,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
      double salary,
      List<SimpleLibrasModel> libras,
    )?
    interprete,
    required TResult orElse(),
  }) {
    if (tutor != null) {
      return tutor(
        id,
        nome,
        login,
        matricula,
        biografia,
        dataCriacao,
        configAcessibilidadeEntity,
        roles,
        token,
        firebaseToken,
        especialidade,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AlunoResponseModel value) aluno,
    required TResult Function(_AlunoNapneResponseModel value) alunoNapne,
    required TResult Function(_ProfessorResponseModel value) professor,
    required TResult Function(_TutorResponseModel value) tutor,
    required TResult Function(_InterpreteResponseModel value) interprete,
  }) {
    return tutor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AlunoResponseModel value)? aluno,
    TResult? Function(_AlunoNapneResponseModel value)? alunoNapne,
    TResult? Function(_ProfessorResponseModel value)? professor,
    TResult? Function(_TutorResponseModel value)? tutor,
    TResult? Function(_InterpreteResponseModel value)? interprete,
  }) {
    return tutor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AlunoResponseModel value)? aluno,
    TResult Function(_AlunoNapneResponseModel value)? alunoNapne,
    TResult Function(_ProfessorResponseModel value)? professor,
    TResult Function(_TutorResponseModel value)? tutor,
    TResult Function(_InterpreteResponseModel value)? interprete,
    required TResult orElse(),
  }) {
    if (tutor != null) {
      return tutor(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TutorResponseModelImplToJson(this);
  }
}

abstract class _TutorResponseModel implements UsuarioResponseModel {
  const factory _TutorResponseModel({
    required final int id,
    required final String nome,
    required final String login,
    required final int matricula,
    final String? biografia,
    required final DateTime dataCriacao,
    final ConfigAcblResponseModel? configAcessibilidadeEntity,
    required final List<Roles> roles,
    final String? token,
    final String? firebaseToken,
    required final String especialidade,
  }) = _$TutorResponseModelImpl;

  factory _TutorResponseModel.fromJson(Map<String, dynamic> json) =
      _$TutorResponseModelImpl.fromJson;

  @override
  int get id;
  @override
  String get nome;
  @override
  String get login;
  @override
  int get matricula;
  @override
  String? get biografia;
  @override
  DateTime get dataCriacao;
  @override
  ConfigAcblResponseModel? get configAcessibilidadeEntity;
  @override
  List<Roles> get roles;
  @override
  String? get token;
  @override
  String? get firebaseToken;
  String get especialidade;

  /// Create a copy of UsuarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TutorResponseModelImplCopyWith<_$TutorResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InterpreteResponseModelImplCopyWith<$Res>
    implements $UsuarioResponseModelCopyWith<$Res> {
  factory _$$InterpreteResponseModelImplCopyWith(
    _$InterpreteResponseModelImpl value,
    $Res Function(_$InterpreteResponseModelImpl) then,
  ) = __$$InterpreteResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String nome,
    String login,
    int matricula,
    String? biografia,
    DateTime dataCriacao,
    ConfigAcblResponseModel? configAcessibilidadeEntity,
    List<Roles> roles,
    String? token,
    String? firebaseToken,
    String especialidade,
    double salary,
    List<SimpleLibrasModel> libras,
  });

  @override
  $ConfigAcblResponseModelCopyWith<$Res>? get configAcessibilidadeEntity;
}

/// @nodoc
class __$$InterpreteResponseModelImplCopyWithImpl<$Res>
    extends
        _$UsuarioResponseModelCopyWithImpl<$Res, _$InterpreteResponseModelImpl>
    implements _$$InterpreteResponseModelImplCopyWith<$Res> {
  __$$InterpreteResponseModelImplCopyWithImpl(
    _$InterpreteResponseModelImpl _value,
    $Res Function(_$InterpreteResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UsuarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? login = null,
    Object? matricula = null,
    Object? biografia = freezed,
    Object? dataCriacao = null,
    Object? configAcessibilidadeEntity = freezed,
    Object? roles = null,
    Object? token = freezed,
    Object? firebaseToken = freezed,
    Object? especialidade = null,
    Object? salary = null,
    Object? libras = null,
  }) {
    return _then(
      _$InterpreteResponseModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        nome:
            null == nome
                ? _value.nome
                : nome // ignore: cast_nullable_to_non_nullable
                    as String,
        login:
            null == login
                ? _value.login
                : login // ignore: cast_nullable_to_non_nullable
                    as String,
        matricula:
            null == matricula
                ? _value.matricula
                : matricula // ignore: cast_nullable_to_non_nullable
                    as int,
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
        configAcessibilidadeEntity:
            freezed == configAcessibilidadeEntity
                ? _value.configAcessibilidadeEntity
                : configAcessibilidadeEntity // ignore: cast_nullable_to_non_nullable
                    as ConfigAcblResponseModel?,
        roles:
            null == roles
                ? _value._roles
                : roles // ignore: cast_nullable_to_non_nullable
                    as List<Roles>,
        token:
            freezed == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                    as String?,
        firebaseToken:
            freezed == firebaseToken
                ? _value.firebaseToken
                : firebaseToken // ignore: cast_nullable_to_non_nullable
                    as String?,
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
        libras:
            null == libras
                ? _value._libras
                : libras // ignore: cast_nullable_to_non_nullable
                    as List<SimpleLibrasModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InterpreteResponseModelImpl implements _InterpreteResponseModel {
  const _$InterpreteResponseModelImpl({
    required this.id,
    required this.nome,
    required this.login,
    required this.matricula,
    this.biografia,
    required this.dataCriacao,
    this.configAcessibilidadeEntity,
    required final List<Roles> roles,
    this.token,
    this.firebaseToken,
    required this.especialidade,
    required this.salary,
    required final List<SimpleLibrasModel> libras,
    final String? $type,
  }) : _roles = roles,
       _libras = libras,
       $type = $type ?? 'interprete';

  factory _$InterpreteResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InterpreteResponseModelImplFromJson(json);

  @override
  final int id;
  @override
  final String nome;
  @override
  final String login;
  @override
  final int matricula;
  @override
  final String? biografia;
  @override
  final DateTime dataCriacao;
  @override
  final ConfigAcblResponseModel? configAcessibilidadeEntity;
  final List<Roles> _roles;
  @override
  List<Roles> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  final String? token;
  @override
  final String? firebaseToken;
  @override
  final String especialidade;
  @override
  final double salary;
  final List<SimpleLibrasModel> _libras;
  @override
  List<SimpleLibrasModel> get libras {
    if (_libras is EqualUnmodifiableListView) return _libras;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_libras);
  }

  @JsonKey(name: 'userType')
  final String $type;

  @override
  String toString() {
    return 'UsuarioResponseModel.interprete(id: $id, nome: $nome, login: $login, matricula: $matricula, biografia: $biografia, dataCriacao: $dataCriacao, configAcessibilidadeEntity: $configAcessibilidadeEntity, roles: $roles, token: $token, firebaseToken: $firebaseToken, especialidade: $especialidade, salary: $salary, libras: $libras)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterpreteResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.matricula, matricula) ||
                other.matricula == matricula) &&
            (identical(other.biografia, biografia) ||
                other.biografia == biografia) &&
            (identical(other.dataCriacao, dataCriacao) ||
                other.dataCriacao == dataCriacao) &&
            (identical(
                  other.configAcessibilidadeEntity,
                  configAcessibilidadeEntity,
                ) ||
                other.configAcessibilidadeEntity ==
                    configAcessibilidadeEntity) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.firebaseToken, firebaseToken) ||
                other.firebaseToken == firebaseToken) &&
            (identical(other.especialidade, especialidade) ||
                other.especialidade == especialidade) &&
            (identical(other.salary, salary) || other.salary == salary) &&
            const DeepCollectionEquality().equals(other._libras, _libras));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    nome,
    login,
    matricula,
    biografia,
    dataCriacao,
    configAcessibilidadeEntity,
    const DeepCollectionEquality().hash(_roles),
    token,
    firebaseToken,
    especialidade,
    salary,
    const DeepCollectionEquality().hash(_libras),
  );

  /// Create a copy of UsuarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InterpreteResponseModelImplCopyWith<_$InterpreteResponseModelImpl>
  get copyWith => __$$InterpreteResponseModelImplCopyWithImpl<
    _$InterpreteResponseModelImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
    )
    aluno,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
      String condicao,
      String laudo,
      String necessidadeEspecial,
      String necessidadeEscolar,
      String acompanhamento,
      String situacao,
    )
    alunoNapne,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String formacao,
      List<SimpleTopicoModel> topicos,
    )
    professor,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
    )
    tutor,
    required TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
      double salary,
      List<SimpleLibrasModel> libras,
    )
    interprete,
  }) {
    return interprete(
      id,
      nome,
      login,
      matricula,
      biografia,
      dataCriacao,
      configAcessibilidadeEntity,
      roles,
      token,
      firebaseToken,
      especialidade,
      salary,
      libras,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
    )?
    aluno,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
      String condicao,
      String laudo,
      String necessidadeEspecial,
      String necessidadeEscolar,
      String acompanhamento,
      String situacao,
    )?
    alunoNapne,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String formacao,
      List<SimpleTopicoModel> topicos,
    )?
    professor,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
    )?
    tutor,
    TResult? Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
      double salary,
      List<SimpleLibrasModel> libras,
    )?
    interprete,
  }) {
    return interprete?.call(
      id,
      nome,
      login,
      matricula,
      biografia,
      dataCriacao,
      configAcessibilidadeEntity,
      roles,
      token,
      firebaseToken,
      especialidade,
      salary,
      libras,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
    )?
    aluno,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      CursoRequestModel curso,
      String condicao,
      String laudo,
      String necessidadeEspecial,
      String necessidadeEscolar,
      String acompanhamento,
      String situacao,
    )?
    alunoNapne,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String formacao,
      List<SimpleTopicoModel> topicos,
    )?
    professor,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
    )?
    tutor,
    TResult Function(
      int id,
      String nome,
      String login,
      int matricula,
      String? biografia,
      DateTime dataCriacao,
      ConfigAcblResponseModel? configAcessibilidadeEntity,
      List<Roles> roles,
      String? token,
      String? firebaseToken,
      String especialidade,
      double salary,
      List<SimpleLibrasModel> libras,
    )?
    interprete,
    required TResult orElse(),
  }) {
    if (interprete != null) {
      return interprete(
        id,
        nome,
        login,
        matricula,
        biografia,
        dataCriacao,
        configAcessibilidadeEntity,
        roles,
        token,
        firebaseToken,
        especialidade,
        salary,
        libras,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AlunoResponseModel value) aluno,
    required TResult Function(_AlunoNapneResponseModel value) alunoNapne,
    required TResult Function(_ProfessorResponseModel value) professor,
    required TResult Function(_TutorResponseModel value) tutor,
    required TResult Function(_InterpreteResponseModel value) interprete,
  }) {
    return interprete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AlunoResponseModel value)? aluno,
    TResult? Function(_AlunoNapneResponseModel value)? alunoNapne,
    TResult? Function(_ProfessorResponseModel value)? professor,
    TResult? Function(_TutorResponseModel value)? tutor,
    TResult? Function(_InterpreteResponseModel value)? interprete,
  }) {
    return interprete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AlunoResponseModel value)? aluno,
    TResult Function(_AlunoNapneResponseModel value)? alunoNapne,
    TResult Function(_ProfessorResponseModel value)? professor,
    TResult Function(_TutorResponseModel value)? tutor,
    TResult Function(_InterpreteResponseModel value)? interprete,
    required TResult orElse(),
  }) {
    if (interprete != null) {
      return interprete(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InterpreteResponseModelImplToJson(this);
  }
}

abstract class _InterpreteResponseModel implements UsuarioResponseModel {
  const factory _InterpreteResponseModel({
    required final int id,
    required final String nome,
    required final String login,
    required final int matricula,
    final String? biografia,
    required final DateTime dataCriacao,
    final ConfigAcblResponseModel? configAcessibilidadeEntity,
    required final List<Roles> roles,
    final String? token,
    final String? firebaseToken,
    required final String especialidade,
    required final double salary,
    required final List<SimpleLibrasModel> libras,
  }) = _$InterpreteResponseModelImpl;

  factory _InterpreteResponseModel.fromJson(Map<String, dynamic> json) =
      _$InterpreteResponseModelImpl.fromJson;

  @override
  int get id;
  @override
  String get nome;
  @override
  String get login;
  @override
  int get matricula;
  @override
  String? get biografia;
  @override
  DateTime get dataCriacao;
  @override
  ConfigAcblResponseModel? get configAcessibilidadeEntity;
  @override
  List<Roles> get roles;
  @override
  String? get token;
  @override
  String? get firebaseToken;
  String get especialidade;
  double get salary;
  List<SimpleLibrasModel> get libras;

  /// Create a copy of UsuarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InterpreteResponseModelImplCopyWith<_$InterpreteResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

TopicoResponseModel _$TopicoResponseModelFromJson(Map<String, dynamic> json) {
  return _TopicoResponseModel.fromJson(json);
}

/// @nodoc
mixin _$TopicoResponseModel {
  String get id => throw _privateConstructorUsedError;
  String get titulo => throw _privateConstructorUsedError;
  String get descricao => throw _privateConstructorUsedError;
  Categorias get categoria => throw _privateConstructorUsedError;
  DateTime get dataCriacao => throw _privateConstructorUsedError;
  SimpleUsuarioModel get professor =>
      throw _privateConstructorUsedError; // Usando a union SimpleUsuarioModel
  List<SimplePublicacaoModel> get publicacoes =>
      throw _privateConstructorUsedError;

  /// Serializes this TopicoResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopicoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopicoResponseModelCopyWith<TopicoResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicoResponseModelCopyWith<$Res> {
  factory $TopicoResponseModelCopyWith(
    TopicoResponseModel value,
    $Res Function(TopicoResponseModel) then,
  ) = _$TopicoResponseModelCopyWithImpl<$Res, TopicoResponseModel>;
  @useResult
  $Res call({
    String id,
    String titulo,
    String descricao,
    Categorias categoria,
    DateTime dataCriacao,
    SimpleUsuarioModel professor,
    List<SimplePublicacaoModel> publicacoes,
  });

  $SimpleUsuarioModelCopyWith<$Res> get professor;
}

/// @nodoc
class _$TopicoResponseModelCopyWithImpl<$Res, $Val extends TopicoResponseModel>
    implements $TopicoResponseModelCopyWith<$Res> {
  _$TopicoResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopicoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titulo = null,
    Object? descricao = null,
    Object? categoria = null,
    Object? dataCriacao = null,
    Object? professor = null,
    Object? publicacoes = null,
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
            categoria:
                null == categoria
                    ? _value.categoria
                    : categoria // ignore: cast_nullable_to_non_nullable
                        as Categorias,
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
            publicacoes:
                null == publicacoes
                    ? _value.publicacoes
                    : publicacoes // ignore: cast_nullable_to_non_nullable
                        as List<SimplePublicacaoModel>,
          )
          as $Val,
    );
  }

  /// Create a copy of TopicoResponseModel
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
abstract class _$$TopicoResponseModelImplCopyWith<$Res>
    implements $TopicoResponseModelCopyWith<$Res> {
  factory _$$TopicoResponseModelImplCopyWith(
    _$TopicoResponseModelImpl value,
    $Res Function(_$TopicoResponseModelImpl) then,
  ) = __$$TopicoResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String titulo,
    String descricao,
    Categorias categoria,
    DateTime dataCriacao,
    SimpleUsuarioModel professor,
    List<SimplePublicacaoModel> publicacoes,
  });

  @override
  $SimpleUsuarioModelCopyWith<$Res> get professor;
}

/// @nodoc
class __$$TopicoResponseModelImplCopyWithImpl<$Res>
    extends _$TopicoResponseModelCopyWithImpl<$Res, _$TopicoResponseModelImpl>
    implements _$$TopicoResponseModelImplCopyWith<$Res> {
  __$$TopicoResponseModelImplCopyWithImpl(
    _$TopicoResponseModelImpl _value,
    $Res Function(_$TopicoResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TopicoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titulo = null,
    Object? descricao = null,
    Object? categoria = null,
    Object? dataCriacao = null,
    Object? professor = null,
    Object? publicacoes = null,
  }) {
    return _then(
      _$TopicoResponseModelImpl(
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
        categoria:
            null == categoria
                ? _value.categoria
                : categoria // ignore: cast_nullable_to_non_nullable
                    as Categorias,
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
        publicacoes:
            null == publicacoes
                ? _value._publicacoes
                : publicacoes // ignore: cast_nullable_to_non_nullable
                    as List<SimplePublicacaoModel>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$TopicoResponseModelImpl implements _TopicoResponseModel {
  const _$TopicoResponseModelImpl({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.categoria,
    required this.dataCriacao,
    required this.professor,
    required final List<SimplePublicacaoModel> publicacoes,
  }) : _publicacoes = publicacoes;

  factory _$TopicoResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopicoResponseModelImplFromJson(json);

  @override
  final String id;
  @override
  final String titulo;
  @override
  final String descricao;
  @override
  final Categorias categoria;
  @override
  final DateTime dataCriacao;
  @override
  final SimpleUsuarioModel professor;
  // Usando a union SimpleUsuarioModel
  final List<SimplePublicacaoModel> _publicacoes;
  // Usando a union SimpleUsuarioModel
  @override
  List<SimplePublicacaoModel> get publicacoes {
    if (_publicacoes is EqualUnmodifiableListView) return _publicacoes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_publicacoes);
  }

  @override
  String toString() {
    return 'TopicoResponseModel(id: $id, titulo: $titulo, descricao: $descricao, categoria: $categoria, dataCriacao: $dataCriacao, professor: $professor, publicacoes: $publicacoes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopicoResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.titulo, titulo) || other.titulo == titulo) &&
            (identical(other.descricao, descricao) ||
                other.descricao == descricao) &&
            (identical(other.categoria, categoria) ||
                other.categoria == categoria) &&
            (identical(other.dataCriacao, dataCriacao) ||
                other.dataCriacao == dataCriacao) &&
            (identical(other.professor, professor) ||
                other.professor == professor) &&
            const DeepCollectionEquality().equals(
              other._publicacoes,
              _publicacoes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    titulo,
    descricao,
    categoria,
    dataCriacao,
    professor,
    const DeepCollectionEquality().hash(_publicacoes),
  );

  /// Create a copy of TopicoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopicoResponseModelImplCopyWith<_$TopicoResponseModelImpl> get copyWith =>
      __$$TopicoResponseModelImplCopyWithImpl<_$TopicoResponseModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TopicoResponseModelImplToJson(this);
  }
}

abstract class _TopicoResponseModel implements TopicoResponseModel {
  const factory _TopicoResponseModel({
    required final String id,
    required final String titulo,
    required final String descricao,
    required final Categorias categoria,
    required final DateTime dataCriacao,
    required final SimpleUsuarioModel professor,
    required final List<SimplePublicacaoModel> publicacoes,
  }) = _$TopicoResponseModelImpl;

  factory _TopicoResponseModel.fromJson(Map<String, dynamic> json) =
      _$TopicoResponseModelImpl.fromJson;

  @override
  String get id;
  @override
  String get titulo;
  @override
  String get descricao;
  @override
  Categorias get categoria;
  @override
  DateTime get dataCriacao;
  @override
  SimpleUsuarioModel get professor; // Usando a union SimpleUsuarioModel
  @override
  List<SimplePublicacaoModel> get publicacoes;

  /// Create a copy of TopicoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopicoResponseModelImplCopyWith<_$TopicoResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PublicacaoResponseModel _$PublicacaoResponseModelFromJson(
  Map<String, dynamic> json,
) {
  return _PublicacaoResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PublicacaoResponseModel {
  String get id => throw _privateConstructorUsedError;
  String get titulo => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String? get urlVideo => throw _privateConstructorUsedError;
  String? get urlFoto => throw _privateConstructorUsedError;
  DateTime get dataCriacao => throw _privateConstructorUsedError;
  SimpleUsuarioModel get usuario => throw _privateConstructorUsedError;
  SimpleTopicoModel get topico => throw _privateConstructorUsedError;
  List<SimpleComentarioModel> get comentarios =>
      throw _privateConstructorUsedError;
  List<SimpleUsuarioModel> get likeBy => throw _privateConstructorUsedError;

  /// Serializes this PublicacaoResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PublicacaoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PublicacaoResponseModelCopyWith<PublicacaoResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicacaoResponseModelCopyWith<$Res> {
  factory $PublicacaoResponseModelCopyWith(
    PublicacaoResponseModel value,
    $Res Function(PublicacaoResponseModel) then,
  ) = _$PublicacaoResponseModelCopyWithImpl<$Res, PublicacaoResponseModel>;
  @useResult
  $Res call({
    String id,
    String titulo,
    String text,
    String? urlVideo,
    String? urlFoto,
    DateTime dataCriacao,
    SimpleUsuarioModel usuario,
    SimpleTopicoModel topico,
    List<SimpleComentarioModel> comentarios,
    List<SimpleUsuarioModel> likeBy,
  });

  $SimpleUsuarioModelCopyWith<$Res> get usuario;
  $SimpleTopicoModelCopyWith<$Res> get topico;
}

/// @nodoc
class _$PublicacaoResponseModelCopyWithImpl<
  $Res,
  $Val extends PublicacaoResponseModel
>
    implements $PublicacaoResponseModelCopyWith<$Res> {
  _$PublicacaoResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PublicacaoResponseModel
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
    Object? topico = null,
    Object? comentarios = null,
    Object? likeBy = null,
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
            topico:
                null == topico
                    ? _value.topico
                    : topico // ignore: cast_nullable_to_non_nullable
                        as SimpleTopicoModel,
            comentarios:
                null == comentarios
                    ? _value.comentarios
                    : comentarios // ignore: cast_nullable_to_non_nullable
                        as List<SimpleComentarioModel>,
            likeBy:
                null == likeBy
                    ? _value.likeBy
                    : likeBy // ignore: cast_nullable_to_non_nullable
                        as List<SimpleUsuarioModel>,
          )
          as $Val,
    );
  }

  /// Create a copy of PublicacaoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SimpleUsuarioModelCopyWith<$Res> get usuario {
    return $SimpleUsuarioModelCopyWith<$Res>(_value.usuario, (value) {
      return _then(_value.copyWith(usuario: value) as $Val);
    });
  }

  /// Create a copy of PublicacaoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SimpleTopicoModelCopyWith<$Res> get topico {
    return $SimpleTopicoModelCopyWith<$Res>(_value.topico, (value) {
      return _then(_value.copyWith(topico: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PublicacaoResponseModelImplCopyWith<$Res>
    implements $PublicacaoResponseModelCopyWith<$Res> {
  factory _$$PublicacaoResponseModelImplCopyWith(
    _$PublicacaoResponseModelImpl value,
    $Res Function(_$PublicacaoResponseModelImpl) then,
  ) = __$$PublicacaoResponseModelImplCopyWithImpl<$Res>;
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
    SimpleTopicoModel topico,
    List<SimpleComentarioModel> comentarios,
    List<SimpleUsuarioModel> likeBy,
  });

  @override
  $SimpleUsuarioModelCopyWith<$Res> get usuario;
  @override
  $SimpleTopicoModelCopyWith<$Res> get topico;
}

/// @nodoc
class __$$PublicacaoResponseModelImplCopyWithImpl<$Res>
    extends
        _$PublicacaoResponseModelCopyWithImpl<
          $Res,
          _$PublicacaoResponseModelImpl
        >
    implements _$$PublicacaoResponseModelImplCopyWith<$Res> {
  __$$PublicacaoResponseModelImplCopyWithImpl(
    _$PublicacaoResponseModelImpl _value,
    $Res Function(_$PublicacaoResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PublicacaoResponseModel
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
    Object? topico = null,
    Object? comentarios = null,
    Object? likeBy = null,
  }) {
    return _then(
      _$PublicacaoResponseModelImpl(
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
        topico:
            null == topico
                ? _value.topico
                : topico // ignore: cast_nullable_to_non_nullable
                    as SimpleTopicoModel,
        comentarios:
            null == comentarios
                ? _value._comentarios
                : comentarios // ignore: cast_nullable_to_non_nullable
                    as List<SimpleComentarioModel>,
        likeBy:
            null == likeBy
                ? _value._likeBy
                : likeBy // ignore: cast_nullable_to_non_nullable
                    as List<SimpleUsuarioModel>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PublicacaoResponseModelImpl implements _PublicacaoResponseModel {
  const _$PublicacaoResponseModelImpl({
    required this.id,
    required this.titulo,
    required this.text,
    this.urlVideo,
    this.urlFoto,
    required this.dataCriacao,
    required this.usuario,
    required this.topico,
    required final List<SimpleComentarioModel> comentarios,
    required final List<SimpleUsuarioModel> likeBy,
  }) : _comentarios = comentarios,
       _likeBy = likeBy;

  factory _$PublicacaoResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublicacaoResponseModelImplFromJson(json);

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
  final SimpleTopicoModel topico;
  final List<SimpleComentarioModel> _comentarios;
  @override
  List<SimpleComentarioModel> get comentarios {
    if (_comentarios is EqualUnmodifiableListView) return _comentarios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comentarios);
  }

  final List<SimpleUsuarioModel> _likeBy;
  @override
  List<SimpleUsuarioModel> get likeBy {
    if (_likeBy is EqualUnmodifiableListView) return _likeBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likeBy);
  }

  @override
  String toString() {
    return 'PublicacaoResponseModel(id: $id, titulo: $titulo, text: $text, urlVideo: $urlVideo, urlFoto: $urlFoto, dataCriacao: $dataCriacao, usuario: $usuario, topico: $topico, comentarios: $comentarios, likeBy: $likeBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicacaoResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.titulo, titulo) || other.titulo == titulo) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.urlVideo, urlVideo) ||
                other.urlVideo == urlVideo) &&
            (identical(other.urlFoto, urlFoto) || other.urlFoto == urlFoto) &&
            (identical(other.dataCriacao, dataCriacao) ||
                other.dataCriacao == dataCriacao) &&
            (identical(other.usuario, usuario) || other.usuario == usuario) &&
            (identical(other.topico, topico) || other.topico == topico) &&
            const DeepCollectionEquality().equals(
              other._comentarios,
              _comentarios,
            ) &&
            const DeepCollectionEquality().equals(other._likeBy, _likeBy));
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
    topico,
    const DeepCollectionEquality().hash(_comentarios),
    const DeepCollectionEquality().hash(_likeBy),
  );

  /// Create a copy of PublicacaoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PublicacaoResponseModelImplCopyWith<_$PublicacaoResponseModelImpl>
  get copyWith => __$$PublicacaoResponseModelImplCopyWithImpl<
    _$PublicacaoResponseModelImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublicacaoResponseModelImplToJson(this);
  }
}

abstract class _PublicacaoResponseModel implements PublicacaoResponseModel {
  const factory _PublicacaoResponseModel({
    required final String id,
    required final String titulo,
    required final String text,
    final String? urlVideo,
    final String? urlFoto,
    required final DateTime dataCriacao,
    required final SimpleUsuarioModel usuario,
    required final SimpleTopicoModel topico,
    required final List<SimpleComentarioModel> comentarios,
    required final List<SimpleUsuarioModel> likeBy,
  }) = _$PublicacaoResponseModelImpl;

  factory _PublicacaoResponseModel.fromJson(Map<String, dynamic> json) =
      _$PublicacaoResponseModelImpl.fromJson;

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
  @override
  SimpleTopicoModel get topico;
  @override
  List<SimpleComentarioModel> get comentarios;
  @override
  List<SimpleUsuarioModel> get likeBy;

  /// Create a copy of PublicacaoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PublicacaoResponseModelImplCopyWith<_$PublicacaoResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ComentarioResponseModel _$ComentarioResponseModelFromJson(
  Map<String, dynamic> json,
) {
  return _ComentarioResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ComentarioResponseModel {
  String get id => throw _privateConstructorUsedError;
  SimpleUsuarioModel get usuario => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get dataCriacao => throw _privateConstructorUsedError;
  SimpleComentarioModel? get comentarioPai =>
      throw _privateConstructorUsedError; // Mapeia o getter `getQuantidadeComentariosfilhos` para um campo
  @JsonKey(name: 'quantidadeComentariosfilhos')
  int get quantidadeComentariosFilhos => throw _privateConstructorUsedError; // Mapeia o getter `getQuantidadeUseFulBy` para um campo
  @JsonKey(name: 'quantidadeUseFulBy')
  int get quantidadeUseFulBy => throw _privateConstructorUsedError; // Ignora campos que não devem ser parseados do JSON
  @JsonKey(includeFromJson: false, includeToJson: false)
  SimplePublicacaoModel? get publicacao => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<SimpleComentarioModel>? get comentariosFilhos =>
      throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<SimpleUsuarioModel>? get usefulBy => throw _privateConstructorUsedError;

  /// Serializes this ComentarioResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ComentarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ComentarioResponseModelCopyWith<ComentarioResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComentarioResponseModelCopyWith<$Res> {
  factory $ComentarioResponseModelCopyWith(
    ComentarioResponseModel value,
    $Res Function(ComentarioResponseModel) then,
  ) = _$ComentarioResponseModelCopyWithImpl<$Res, ComentarioResponseModel>;
  @useResult
  $Res call({
    String id,
    SimpleUsuarioModel usuario,
    String content,
    DateTime dataCriacao,
    SimpleComentarioModel? comentarioPai,
    @JsonKey(name: 'quantidadeComentariosfilhos')
    int quantidadeComentariosFilhos,
    @JsonKey(name: 'quantidadeUseFulBy') int quantidadeUseFulBy,
    @JsonKey(includeFromJson: false, includeToJson: false)
    SimplePublicacaoModel? publicacao,
    @JsonKey(includeFromJson: false, includeToJson: false)
    List<SimpleComentarioModel>? comentariosFilhos,
    @JsonKey(includeFromJson: false, includeToJson: false)
    List<SimpleUsuarioModel>? usefulBy,
  });

  $SimpleUsuarioModelCopyWith<$Res> get usuario;
  $SimpleComentarioModelCopyWith<$Res>? get comentarioPai;
  $SimplePublicacaoModelCopyWith<$Res>? get publicacao;
}

/// @nodoc
class _$ComentarioResponseModelCopyWithImpl<
  $Res,
  $Val extends ComentarioResponseModel
>
    implements $ComentarioResponseModelCopyWith<$Res> {
  _$ComentarioResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ComentarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? usuario = null,
    Object? content = null,
    Object? dataCriacao = null,
    Object? comentarioPai = freezed,
    Object? quantidadeComentariosFilhos = null,
    Object? quantidadeUseFulBy = null,
    Object? publicacao = freezed,
    Object? comentariosFilhos = freezed,
    Object? usefulBy = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            usuario:
                null == usuario
                    ? _value.usuario
                    : usuario // ignore: cast_nullable_to_non_nullable
                        as SimpleUsuarioModel,
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
            comentarioPai:
                freezed == comentarioPai
                    ? _value.comentarioPai
                    : comentarioPai // ignore: cast_nullable_to_non_nullable
                        as SimpleComentarioModel?,
            quantidadeComentariosFilhos:
                null == quantidadeComentariosFilhos
                    ? _value.quantidadeComentariosFilhos
                    : quantidadeComentariosFilhos // ignore: cast_nullable_to_non_nullable
                        as int,
            quantidadeUseFulBy:
                null == quantidadeUseFulBy
                    ? _value.quantidadeUseFulBy
                    : quantidadeUseFulBy // ignore: cast_nullable_to_non_nullable
                        as int,
            publicacao:
                freezed == publicacao
                    ? _value.publicacao
                    : publicacao // ignore: cast_nullable_to_non_nullable
                        as SimplePublicacaoModel?,
            comentariosFilhos:
                freezed == comentariosFilhos
                    ? _value.comentariosFilhos
                    : comentariosFilhos // ignore: cast_nullable_to_non_nullable
                        as List<SimpleComentarioModel>?,
            usefulBy:
                freezed == usefulBy
                    ? _value.usefulBy
                    : usefulBy // ignore: cast_nullable_to_non_nullable
                        as List<SimpleUsuarioModel>?,
          )
          as $Val,
    );
  }

  /// Create a copy of ComentarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SimpleUsuarioModelCopyWith<$Res> get usuario {
    return $SimpleUsuarioModelCopyWith<$Res>(_value.usuario, (value) {
      return _then(_value.copyWith(usuario: value) as $Val);
    });
  }

  /// Create a copy of ComentarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SimpleComentarioModelCopyWith<$Res>? get comentarioPai {
    if (_value.comentarioPai == null) {
      return null;
    }

    return $SimpleComentarioModelCopyWith<$Res>(_value.comentarioPai!, (value) {
      return _then(_value.copyWith(comentarioPai: value) as $Val);
    });
  }

  /// Create a copy of ComentarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SimplePublicacaoModelCopyWith<$Res>? get publicacao {
    if (_value.publicacao == null) {
      return null;
    }

    return $SimplePublicacaoModelCopyWith<$Res>(_value.publicacao!, (value) {
      return _then(_value.copyWith(publicacao: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ComentarioResponseModelImplCopyWith<$Res>
    implements $ComentarioResponseModelCopyWith<$Res> {
  factory _$$ComentarioResponseModelImplCopyWith(
    _$ComentarioResponseModelImpl value,
    $Res Function(_$ComentarioResponseModelImpl) then,
  ) = __$$ComentarioResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    SimpleUsuarioModel usuario,
    String content,
    DateTime dataCriacao,
    SimpleComentarioModel? comentarioPai,
    @JsonKey(name: 'quantidadeComentariosfilhos')
    int quantidadeComentariosFilhos,
    @JsonKey(name: 'quantidadeUseFulBy') int quantidadeUseFulBy,
    @JsonKey(includeFromJson: false, includeToJson: false)
    SimplePublicacaoModel? publicacao,
    @JsonKey(includeFromJson: false, includeToJson: false)
    List<SimpleComentarioModel>? comentariosFilhos,
    @JsonKey(includeFromJson: false, includeToJson: false)
    List<SimpleUsuarioModel>? usefulBy,
  });

  @override
  $SimpleUsuarioModelCopyWith<$Res> get usuario;
  @override
  $SimpleComentarioModelCopyWith<$Res>? get comentarioPai;
  @override
  $SimplePublicacaoModelCopyWith<$Res>? get publicacao;
}

/// @nodoc
class __$$ComentarioResponseModelImplCopyWithImpl<$Res>
    extends
        _$ComentarioResponseModelCopyWithImpl<
          $Res,
          _$ComentarioResponseModelImpl
        >
    implements _$$ComentarioResponseModelImplCopyWith<$Res> {
  __$$ComentarioResponseModelImplCopyWithImpl(
    _$ComentarioResponseModelImpl _value,
    $Res Function(_$ComentarioResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ComentarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? usuario = null,
    Object? content = null,
    Object? dataCriacao = null,
    Object? comentarioPai = freezed,
    Object? quantidadeComentariosFilhos = null,
    Object? quantidadeUseFulBy = null,
    Object? publicacao = freezed,
    Object? comentariosFilhos = freezed,
    Object? usefulBy = freezed,
  }) {
    return _then(
      _$ComentarioResponseModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        usuario:
            null == usuario
                ? _value.usuario
                : usuario // ignore: cast_nullable_to_non_nullable
                    as SimpleUsuarioModel,
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
        comentarioPai:
            freezed == comentarioPai
                ? _value.comentarioPai
                : comentarioPai // ignore: cast_nullable_to_non_nullable
                    as SimpleComentarioModel?,
        quantidadeComentariosFilhos:
            null == quantidadeComentariosFilhos
                ? _value.quantidadeComentariosFilhos
                : quantidadeComentariosFilhos // ignore: cast_nullable_to_non_nullable
                    as int,
        quantidadeUseFulBy:
            null == quantidadeUseFulBy
                ? _value.quantidadeUseFulBy
                : quantidadeUseFulBy // ignore: cast_nullable_to_non_nullable
                    as int,
        publicacao:
            freezed == publicacao
                ? _value.publicacao
                : publicacao // ignore: cast_nullable_to_non_nullable
                    as SimplePublicacaoModel?,
        comentariosFilhos:
            freezed == comentariosFilhos
                ? _value._comentariosFilhos
                : comentariosFilhos // ignore: cast_nullable_to_non_nullable
                    as List<SimpleComentarioModel>?,
        usefulBy:
            freezed == usefulBy
                ? _value._usefulBy
                : usefulBy // ignore: cast_nullable_to_non_nullable
                    as List<SimpleUsuarioModel>?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ComentarioResponseModelImpl implements _ComentarioResponseModel {
  const _$ComentarioResponseModelImpl({
    required this.id,
    required this.usuario,
    required this.content,
    required this.dataCriacao,
    this.comentarioPai,
    @JsonKey(name: 'quantidadeComentariosfilhos')
    required this.quantidadeComentariosFilhos,
    @JsonKey(name: 'quantidadeUseFulBy') required this.quantidadeUseFulBy,
    @JsonKey(includeFromJson: false, includeToJson: false) this.publicacao,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final List<SimpleComentarioModel>? comentariosFilhos,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final List<SimpleUsuarioModel>? usefulBy,
  }) : _comentariosFilhos = comentariosFilhos,
       _usefulBy = usefulBy;

  factory _$ComentarioResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComentarioResponseModelImplFromJson(json);

  @override
  final String id;
  @override
  final SimpleUsuarioModel usuario;
  @override
  final String content;
  @override
  final DateTime dataCriacao;
  @override
  final SimpleComentarioModel? comentarioPai;
  // Mapeia o getter `getQuantidadeComentariosfilhos` para um campo
  @override
  @JsonKey(name: 'quantidadeComentariosfilhos')
  final int quantidadeComentariosFilhos;
  // Mapeia o getter `getQuantidadeUseFulBy` para um campo
  @override
  @JsonKey(name: 'quantidadeUseFulBy')
  final int quantidadeUseFulBy;
  // Ignora campos que não devem ser parseados do JSON
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final SimplePublicacaoModel? publicacao;
  final List<SimpleComentarioModel>? _comentariosFilhos;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<SimpleComentarioModel>? get comentariosFilhos {
    final value = _comentariosFilhos;
    if (value == null) return null;
    if (_comentariosFilhos is EqualUnmodifiableListView)
      return _comentariosFilhos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SimpleUsuarioModel>? _usefulBy;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<SimpleUsuarioModel>? get usefulBy {
    final value = _usefulBy;
    if (value == null) return null;
    if (_usefulBy is EqualUnmodifiableListView) return _usefulBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ComentarioResponseModel(id: $id, usuario: $usuario, content: $content, dataCriacao: $dataCriacao, comentarioPai: $comentarioPai, quantidadeComentariosFilhos: $quantidadeComentariosFilhos, quantidadeUseFulBy: $quantidadeUseFulBy, publicacao: $publicacao, comentariosFilhos: $comentariosFilhos, usefulBy: $usefulBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComentarioResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.usuario, usuario) || other.usuario == usuario) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.dataCriacao, dataCriacao) ||
                other.dataCriacao == dataCriacao) &&
            (identical(other.comentarioPai, comentarioPai) ||
                other.comentarioPai == comentarioPai) &&
            (identical(
                  other.quantidadeComentariosFilhos,
                  quantidadeComentariosFilhos,
                ) ||
                other.quantidadeComentariosFilhos ==
                    quantidadeComentariosFilhos) &&
            (identical(other.quantidadeUseFulBy, quantidadeUseFulBy) ||
                other.quantidadeUseFulBy == quantidadeUseFulBy) &&
            (identical(other.publicacao, publicacao) ||
                other.publicacao == publicacao) &&
            const DeepCollectionEquality().equals(
              other._comentariosFilhos,
              _comentariosFilhos,
            ) &&
            const DeepCollectionEquality().equals(other._usefulBy, _usefulBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    usuario,
    content,
    dataCriacao,
    comentarioPai,
    quantidadeComentariosFilhos,
    quantidadeUseFulBy,
    publicacao,
    const DeepCollectionEquality().hash(_comentariosFilhos),
    const DeepCollectionEquality().hash(_usefulBy),
  );

  /// Create a copy of ComentarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComentarioResponseModelImplCopyWith<_$ComentarioResponseModelImpl>
  get copyWith => __$$ComentarioResponseModelImplCopyWithImpl<
    _$ComentarioResponseModelImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComentarioResponseModelImplToJson(this);
  }
}

abstract class _ComentarioResponseModel implements ComentarioResponseModel {
  const factory _ComentarioResponseModel({
    required final String id,
    required final SimpleUsuarioModel usuario,
    required final String content,
    required final DateTime dataCriacao,
    final SimpleComentarioModel? comentarioPai,
    @JsonKey(name: 'quantidadeComentariosfilhos')
    required final int quantidadeComentariosFilhos,
    @JsonKey(name: 'quantidadeUseFulBy') required final int quantidadeUseFulBy,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final SimplePublicacaoModel? publicacao,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final List<SimpleComentarioModel>? comentariosFilhos,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final List<SimpleUsuarioModel>? usefulBy,
  }) = _$ComentarioResponseModelImpl;

  factory _ComentarioResponseModel.fromJson(Map<String, dynamic> json) =
      _$ComentarioResponseModelImpl.fromJson;

  @override
  String get id;
  @override
  SimpleUsuarioModel get usuario;
  @override
  String get content;
  @override
  DateTime get dataCriacao;
  @override
  SimpleComentarioModel? get comentarioPai; // Mapeia o getter `getQuantidadeComentariosfilhos` para um campo
  @override
  @JsonKey(name: 'quantidadeComentariosfilhos')
  int get quantidadeComentariosFilhos; // Mapeia o getter `getQuantidadeUseFulBy` para um campo
  @override
  @JsonKey(name: 'quantidadeUseFulBy')
  int get quantidadeUseFulBy; // Ignora campos que não devem ser parseados do JSON
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  SimplePublicacaoModel? get publicacao;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<SimpleComentarioModel>? get comentariosFilhos;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<SimpleUsuarioModel>? get usefulBy;

  /// Create a copy of ComentarioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComentarioResponseModelImplCopyWith<_$ComentarioResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

LibrasResponseModel _$LibrasResponseModelFromJson(Map<String, dynamic> json) {
  return _LibrasResponseModel.fromJson(json);
}

/// @nodoc
mixin _$LibrasResponseModel {
  String get id => throw _privateConstructorUsedError;
  String get palavra => throw _privateConstructorUsedError;
  String get descricao => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get video => throw _privateConstructorUsedError;
  String? get foto => throw _privateConstructorUsedError;
  String? get justificativa => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  Categorias get categorias => throw _privateConstructorUsedError;
  List<SimpleUsuarioModel> get sugeriu => throw _privateConstructorUsedError;
  List<SimpleUsuarioModel> get interprete => throw _privateConstructorUsedError;

  /// Serializes this LibrasResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LibrasResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LibrasResponseModelCopyWith<LibrasResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibrasResponseModelCopyWith<$Res> {
  factory $LibrasResponseModelCopyWith(
    LibrasResponseModel value,
    $Res Function(LibrasResponseModel) then,
  ) = _$LibrasResponseModelCopyWithImpl<$Res, LibrasResponseModel>;
  @useResult
  $Res call({
    String id,
    String palavra,
    String descricao,
    String? url,
    String? video,
    String? foto,
    String? justificativa,
    Status status,
    Categorias categorias,
    List<SimpleUsuarioModel> sugeriu,
    List<SimpleUsuarioModel> interprete,
  });
}

/// @nodoc
class _$LibrasResponseModelCopyWithImpl<$Res, $Val extends LibrasResponseModel>
    implements $LibrasResponseModelCopyWith<$Res> {
  _$LibrasResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LibrasResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? palavra = null,
    Object? descricao = null,
    Object? url = freezed,
    Object? video = freezed,
    Object? foto = freezed,
    Object? justificativa = freezed,
    Object? status = null,
    Object? categorias = null,
    Object? sugeriu = null,
    Object? interprete = null,
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
            descricao:
                null == descricao
                    ? _value.descricao
                    : descricao // ignore: cast_nullable_to_non_nullable
                        as String,
            url:
                freezed == url
                    ? _value.url
                    : url // ignore: cast_nullable_to_non_nullable
                        as String?,
            video:
                freezed == video
                    ? _value.video
                    : video // ignore: cast_nullable_to_non_nullable
                        as String?,
            foto:
                freezed == foto
                    ? _value.foto
                    : foto // ignore: cast_nullable_to_non_nullable
                        as String?,
            justificativa:
                freezed == justificativa
                    ? _value.justificativa
                    : justificativa // ignore: cast_nullable_to_non_nullable
                        as String?,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as Status,
            categorias:
                null == categorias
                    ? _value.categorias
                    : categorias // ignore: cast_nullable_to_non_nullable
                        as Categorias,
            sugeriu:
                null == sugeriu
                    ? _value.sugeriu
                    : sugeriu // ignore: cast_nullable_to_non_nullable
                        as List<SimpleUsuarioModel>,
            interprete:
                null == interprete
                    ? _value.interprete
                    : interprete // ignore: cast_nullable_to_non_nullable
                        as List<SimpleUsuarioModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LibrasResponseModelImplCopyWith<$Res>
    implements $LibrasResponseModelCopyWith<$Res> {
  factory _$$LibrasResponseModelImplCopyWith(
    _$LibrasResponseModelImpl value,
    $Res Function(_$LibrasResponseModelImpl) then,
  ) = __$$LibrasResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String palavra,
    String descricao,
    String? url,
    String? video,
    String? foto,
    String? justificativa,
    Status status,
    Categorias categorias,
    List<SimpleUsuarioModel> sugeriu,
    List<SimpleUsuarioModel> interprete,
  });
}

/// @nodoc
class __$$LibrasResponseModelImplCopyWithImpl<$Res>
    extends _$LibrasResponseModelCopyWithImpl<$Res, _$LibrasResponseModelImpl>
    implements _$$LibrasResponseModelImplCopyWith<$Res> {
  __$$LibrasResponseModelImplCopyWithImpl(
    _$LibrasResponseModelImpl _value,
    $Res Function(_$LibrasResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LibrasResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? palavra = null,
    Object? descricao = null,
    Object? url = freezed,
    Object? video = freezed,
    Object? foto = freezed,
    Object? justificativa = freezed,
    Object? status = null,
    Object? categorias = null,
    Object? sugeriu = null,
    Object? interprete = null,
  }) {
    return _then(
      _$LibrasResponseModelImpl(
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
        descricao:
            null == descricao
                ? _value.descricao
                : descricao // ignore: cast_nullable_to_non_nullable
                    as String,
        url:
            freezed == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                    as String?,
        video:
            freezed == video
                ? _value.video
                : video // ignore: cast_nullable_to_non_nullable
                    as String?,
        foto:
            freezed == foto
                ? _value.foto
                : foto // ignore: cast_nullable_to_non_nullable
                    as String?,
        justificativa:
            freezed == justificativa
                ? _value.justificativa
                : justificativa // ignore: cast_nullable_to_non_nullable
                    as String?,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as Status,
        categorias:
            null == categorias
                ? _value.categorias
                : categorias // ignore: cast_nullable_to_non_nullable
                    as Categorias,
        sugeriu:
            null == sugeriu
                ? _value._sugeriu
                : sugeriu // ignore: cast_nullable_to_non_nullable
                    as List<SimpleUsuarioModel>,
        interprete:
            null == interprete
                ? _value._interprete
                : interprete // ignore: cast_nullable_to_non_nullable
                    as List<SimpleUsuarioModel>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LibrasResponseModelImpl implements _LibrasResponseModel {
  const _$LibrasResponseModelImpl({
    required this.id,
    required this.palavra,
    required this.descricao,
    this.url,
    this.video,
    this.foto,
    this.justificativa,
    required this.status,
    required this.categorias,
    required final List<SimpleUsuarioModel> sugeriu,
    required final List<SimpleUsuarioModel> interprete,
  }) : _sugeriu = sugeriu,
       _interprete = interprete;

  factory _$LibrasResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LibrasResponseModelImplFromJson(json);

  @override
  final String id;
  @override
  final String palavra;
  @override
  final String descricao;
  @override
  final String? url;
  @override
  final String? video;
  @override
  final String? foto;
  @override
  final String? justificativa;
  @override
  final Status status;
  @override
  final Categorias categorias;
  final List<SimpleUsuarioModel> _sugeriu;
  @override
  List<SimpleUsuarioModel> get sugeriu {
    if (_sugeriu is EqualUnmodifiableListView) return _sugeriu;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sugeriu);
  }

  final List<SimpleUsuarioModel> _interprete;
  @override
  List<SimpleUsuarioModel> get interprete {
    if (_interprete is EqualUnmodifiableListView) return _interprete;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interprete);
  }

  @override
  String toString() {
    return 'LibrasResponseModel(id: $id, palavra: $palavra, descricao: $descricao, url: $url, video: $video, foto: $foto, justificativa: $justificativa, status: $status, categorias: $categorias, sugeriu: $sugeriu, interprete: $interprete)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibrasResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.palavra, palavra) || other.palavra == palavra) &&
            (identical(other.descricao, descricao) ||
                other.descricao == descricao) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.foto, foto) || other.foto == foto) &&
            (identical(other.justificativa, justificativa) ||
                other.justificativa == justificativa) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.categorias, categorias) ||
                other.categorias == categorias) &&
            const DeepCollectionEquality().equals(other._sugeriu, _sugeriu) &&
            const DeepCollectionEquality().equals(
              other._interprete,
              _interprete,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    palavra,
    descricao,
    url,
    video,
    foto,
    justificativa,
    status,
    categorias,
    const DeepCollectionEquality().hash(_sugeriu),
    const DeepCollectionEquality().hash(_interprete),
  );

  /// Create a copy of LibrasResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LibrasResponseModelImplCopyWith<_$LibrasResponseModelImpl> get copyWith =>
      __$$LibrasResponseModelImplCopyWithImpl<_$LibrasResponseModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LibrasResponseModelImplToJson(this);
  }
}

abstract class _LibrasResponseModel implements LibrasResponseModel {
  const factory _LibrasResponseModel({
    required final String id,
    required final String palavra,
    required final String descricao,
    final String? url,
    final String? video,
    final String? foto,
    final String? justificativa,
    required final Status status,
    required final Categorias categorias,
    required final List<SimpleUsuarioModel> sugeriu,
    required final List<SimpleUsuarioModel> interprete,
  }) = _$LibrasResponseModelImpl;

  factory _LibrasResponseModel.fromJson(Map<String, dynamic> json) =
      _$LibrasResponseModelImpl.fromJson;

  @override
  String get id;
  @override
  String get palavra;
  @override
  String get descricao;
  @override
  String? get url;
  @override
  String? get video;
  @override
  String? get foto;
  @override
  String? get justificativa;
  @override
  Status get status;
  @override
  Categorias get categorias;
  @override
  List<SimpleUsuarioModel> get sugeriu;
  @override
  List<SimpleUsuarioModel> get interprete;

  /// Create a copy of LibrasResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LibrasResponseModelImplCopyWith<_$LibrasResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageResponseModel _$MessageResponseModelFromJson(Map<String, dynamic> json) {
  return _MessageResponseModel.fromJson(json);
}

/// @nodoc
mixin _$MessageResponseModel {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  DateTime get dataCriacao => throw _privateConstructorUsedError;
  bool get visualizado => throw _privateConstructorUsedError;
  SimpleUsuarioModel get userEnvia => throw _privateConstructorUsedError;
  SimpleUsuarioModel get userRecebe => throw _privateConstructorUsedError;

  /// Serializes this MessageResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageResponseModelCopyWith<MessageResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageResponseModelCopyWith<$Res> {
  factory $MessageResponseModelCopyWith(
    MessageResponseModel value,
    $Res Function(MessageResponseModel) then,
  ) = _$MessageResponseModelCopyWithImpl<$Res, MessageResponseModel>;
  @useResult
  $Res call({
    String id,
    String text,
    DateTime dataCriacao,
    bool visualizado,
    SimpleUsuarioModel userEnvia,
    SimpleUsuarioModel userRecebe,
  });

  $SimpleUsuarioModelCopyWith<$Res> get userEnvia;
  $SimpleUsuarioModelCopyWith<$Res> get userRecebe;
}

/// @nodoc
class _$MessageResponseModelCopyWithImpl<
  $Res,
  $Val extends MessageResponseModel
>
    implements $MessageResponseModelCopyWith<$Res> {
  _$MessageResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? dataCriacao = null,
    Object? visualizado = null,
    Object? userEnvia = null,
    Object? userRecebe = null,
  }) {
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
            dataCriacao:
                null == dataCriacao
                    ? _value.dataCriacao
                    : dataCriacao // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            visualizado:
                null == visualizado
                    ? _value.visualizado
                    : visualizado // ignore: cast_nullable_to_non_nullable
                        as bool,
            userEnvia:
                null == userEnvia
                    ? _value.userEnvia
                    : userEnvia // ignore: cast_nullable_to_non_nullable
                        as SimpleUsuarioModel,
            userRecebe:
                null == userRecebe
                    ? _value.userRecebe
                    : userRecebe // ignore: cast_nullable_to_non_nullable
                        as SimpleUsuarioModel,
          )
          as $Val,
    );
  }

  /// Create a copy of MessageResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SimpleUsuarioModelCopyWith<$Res> get userEnvia {
    return $SimpleUsuarioModelCopyWith<$Res>(_value.userEnvia, (value) {
      return _then(_value.copyWith(userEnvia: value) as $Val);
    });
  }

  /// Create a copy of MessageResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SimpleUsuarioModelCopyWith<$Res> get userRecebe {
    return $SimpleUsuarioModelCopyWith<$Res>(_value.userRecebe, (value) {
      return _then(_value.copyWith(userRecebe: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageResponseModelImplCopyWith<$Res>
    implements $MessageResponseModelCopyWith<$Res> {
  factory _$$MessageResponseModelImplCopyWith(
    _$MessageResponseModelImpl value,
    $Res Function(_$MessageResponseModelImpl) then,
  ) = __$$MessageResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String text,
    DateTime dataCriacao,
    bool visualizado,
    SimpleUsuarioModel userEnvia,
    SimpleUsuarioModel userRecebe,
  });

  @override
  $SimpleUsuarioModelCopyWith<$Res> get userEnvia;
  @override
  $SimpleUsuarioModelCopyWith<$Res> get userRecebe;
}

/// @nodoc
class __$$MessageResponseModelImplCopyWithImpl<$Res>
    extends _$MessageResponseModelCopyWithImpl<$Res, _$MessageResponseModelImpl>
    implements _$$MessageResponseModelImplCopyWith<$Res> {
  __$$MessageResponseModelImplCopyWithImpl(
    _$MessageResponseModelImpl _value,
    $Res Function(_$MessageResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MessageResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? dataCriacao = null,
    Object? visualizado = null,
    Object? userEnvia = null,
    Object? userRecebe = null,
  }) {
    return _then(
      _$MessageResponseModelImpl(
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
        dataCriacao:
            null == dataCriacao
                ? _value.dataCriacao
                : dataCriacao // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        visualizado:
            null == visualizado
                ? _value.visualizado
                : visualizado // ignore: cast_nullable_to_non_nullable
                    as bool,
        userEnvia:
            null == userEnvia
                ? _value.userEnvia
                : userEnvia // ignore: cast_nullable_to_non_nullable
                    as SimpleUsuarioModel,
        userRecebe:
            null == userRecebe
                ? _value.userRecebe
                : userRecebe // ignore: cast_nullable_to_non_nullable
                    as SimpleUsuarioModel,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$MessageResponseModelImpl implements _MessageResponseModel {
  const _$MessageResponseModelImpl({
    required this.id,
    required this.text,
    required this.dataCriacao,
    required this.visualizado,
    required this.userEnvia,
    required this.userRecebe,
  });

  factory _$MessageResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageResponseModelImplFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final DateTime dataCriacao;
  @override
  final bool visualizado;
  @override
  final SimpleUsuarioModel userEnvia;
  @override
  final SimpleUsuarioModel userRecebe;

  @override
  String toString() {
    return 'MessageResponseModel(id: $id, text: $text, dataCriacao: $dataCriacao, visualizado: $visualizado, userEnvia: $userEnvia, userRecebe: $userRecebe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.dataCriacao, dataCriacao) ||
                other.dataCriacao == dataCriacao) &&
            (identical(other.visualizado, visualizado) ||
                other.visualizado == visualizado) &&
            (identical(other.userEnvia, userEnvia) ||
                other.userEnvia == userEnvia) &&
            (identical(other.userRecebe, userRecebe) ||
                other.userRecebe == userRecebe));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    text,
    dataCriacao,
    visualizado,
    userEnvia,
    userRecebe,
  );

  /// Create a copy of MessageResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageResponseModelImplCopyWith<_$MessageResponseModelImpl>
  get copyWith =>
      __$$MessageResponseModelImplCopyWithImpl<_$MessageResponseModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageResponseModelImplToJson(this);
  }
}

abstract class _MessageResponseModel implements MessageResponseModel {
  const factory _MessageResponseModel({
    required final String id,
    required final String text,
    required final DateTime dataCriacao,
    required final bool visualizado,
    required final SimpleUsuarioModel userEnvia,
    required final SimpleUsuarioModel userRecebe,
  }) = _$MessageResponseModelImpl;

  factory _MessageResponseModel.fromJson(Map<String, dynamic> json) =
      _$MessageResponseModelImpl.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  DateTime get dataCriacao;
  @override
  bool get visualizado;
  @override
  SimpleUsuarioModel get userEnvia;
  @override
  SimpleUsuarioModel get userRecebe;

  /// Create a copy of MessageResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageResponseModelImplCopyWith<_$MessageResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CursoResponseModel _$CursoResponseModelFromJson(Map<String, dynamic> json) {
  return _CursoResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CursoResponseModel {
  String get id => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  List<SimpleUsuarioModel> get alunos => throw _privateConstructorUsedError;

  /// Serializes this CursoResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CursoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CursoResponseModelCopyWith<CursoResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CursoResponseModelCopyWith<$Res> {
  factory $CursoResponseModelCopyWith(
    CursoResponseModel value,
    $Res Function(CursoResponseModel) then,
  ) = _$CursoResponseModelCopyWithImpl<$Res, CursoResponseModel>;
  @useResult
  $Res call({String id, String nome, List<SimpleUsuarioModel> alunos});
}

/// @nodoc
class _$CursoResponseModelCopyWithImpl<$Res, $Val extends CursoResponseModel>
    implements $CursoResponseModelCopyWith<$Res> {
  _$CursoResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CursoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? nome = null, Object? alunos = null}) {
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
            alunos:
                null == alunos
                    ? _value.alunos
                    : alunos // ignore: cast_nullable_to_non_nullable
                        as List<SimpleUsuarioModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CursoResponseModelImplCopyWith<$Res>
    implements $CursoResponseModelCopyWith<$Res> {
  factory _$$CursoResponseModelImplCopyWith(
    _$CursoResponseModelImpl value,
    $Res Function(_$CursoResponseModelImpl) then,
  ) = __$$CursoResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String nome, List<SimpleUsuarioModel> alunos});
}

/// @nodoc
class __$$CursoResponseModelImplCopyWithImpl<$Res>
    extends _$CursoResponseModelCopyWithImpl<$Res, _$CursoResponseModelImpl>
    implements _$$CursoResponseModelImplCopyWith<$Res> {
  __$$CursoResponseModelImplCopyWithImpl(
    _$CursoResponseModelImpl _value,
    $Res Function(_$CursoResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CursoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? nome = null, Object? alunos = null}) {
    return _then(
      _$CursoResponseModelImpl(
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
        alunos:
            null == alunos
                ? _value._alunos
                : alunos // ignore: cast_nullable_to_non_nullable
                    as List<SimpleUsuarioModel>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CursoResponseModelImpl implements _CursoResponseModel {
  const _$CursoResponseModelImpl({
    required this.id,
    required this.nome,
    required final List<SimpleUsuarioModel> alunos,
  }) : _alunos = alunos;

  factory _$CursoResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CursoResponseModelImplFromJson(json);

  @override
  final String id;
  @override
  final String nome;
  final List<SimpleUsuarioModel> _alunos;
  @override
  List<SimpleUsuarioModel> get alunos {
    if (_alunos is EqualUnmodifiableListView) return _alunos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alunos);
  }

  @override
  String toString() {
    return 'CursoResponseModel(id: $id, nome: $nome, alunos: $alunos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CursoResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            const DeepCollectionEquality().equals(other._alunos, _alunos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    nome,
    const DeepCollectionEquality().hash(_alunos),
  );

  /// Create a copy of CursoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CursoResponseModelImplCopyWith<_$CursoResponseModelImpl> get copyWith =>
      __$$CursoResponseModelImplCopyWithImpl<_$CursoResponseModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CursoResponseModelImplToJson(this);
  }
}

abstract class _CursoResponseModel implements CursoResponseModel {
  const factory _CursoResponseModel({
    required final String id,
    required final String nome,
    required final List<SimpleUsuarioModel> alunos,
  }) = _$CursoResponseModelImpl;

  factory _CursoResponseModel.fromJson(Map<String, dynamic> json) =
      _$CursoResponseModelImpl.fromJson;

  @override
  String get id;
  @override
  String get nome;
  @override
  List<SimpleUsuarioModel> get alunos;

  /// Create a copy of CursoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CursoResponseModelImplCopyWith<_$CursoResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ConfigAcblResponseModel _$ConfigAcblResponseModelFromJson(
  Map<String, dynamic> json,
) {
  return _ConfigAcblResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ConfigAcblResponseModel {
  String get id => throw _privateConstructorUsedError;
  String? get audicao => throw _privateConstructorUsedError;
  TemaCSS get tema => throw _privateConstructorUsedError;
  String? get zoom => throw _privateConstructorUsedError;

  /// Serializes this ConfigAcblResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConfigAcblResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfigAcblResponseModelCopyWith<ConfigAcblResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigAcblResponseModelCopyWith<$Res> {
  factory $ConfigAcblResponseModelCopyWith(
    ConfigAcblResponseModel value,
    $Res Function(ConfigAcblResponseModel) then,
  ) = _$ConfigAcblResponseModelCopyWithImpl<$Res, ConfigAcblResponseModel>;
  @useResult
  $Res call({String id, String? audicao, TemaCSS tema, String? zoom});
}

/// @nodoc
class _$ConfigAcblResponseModelCopyWithImpl<
  $Res,
  $Val extends ConfigAcblResponseModel
>
    implements $ConfigAcblResponseModelCopyWith<$Res> {
  _$ConfigAcblResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConfigAcblResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? audicao = freezed,
    Object? tema = null,
    Object? zoom = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            audicao:
                freezed == audicao
                    ? _value.audicao
                    : audicao // ignore: cast_nullable_to_non_nullable
                        as String?,
            tema:
                null == tema
                    ? _value.tema
                    : tema // ignore: cast_nullable_to_non_nullable
                        as TemaCSS,
            zoom:
                freezed == zoom
                    ? _value.zoom
                    : zoom // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConfigAcblResponseModelImplCopyWith<$Res>
    implements $ConfigAcblResponseModelCopyWith<$Res> {
  factory _$$ConfigAcblResponseModelImplCopyWith(
    _$ConfigAcblResponseModelImpl value,
    $Res Function(_$ConfigAcblResponseModelImpl) then,
  ) = __$$ConfigAcblResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? audicao, TemaCSS tema, String? zoom});
}

/// @nodoc
class __$$ConfigAcblResponseModelImplCopyWithImpl<$Res>
    extends
        _$ConfigAcblResponseModelCopyWithImpl<
          $Res,
          _$ConfigAcblResponseModelImpl
        >
    implements _$$ConfigAcblResponseModelImplCopyWith<$Res> {
  __$$ConfigAcblResponseModelImplCopyWithImpl(
    _$ConfigAcblResponseModelImpl _value,
    $Res Function(_$ConfigAcblResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConfigAcblResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? audicao = freezed,
    Object? tema = null,
    Object? zoom = freezed,
  }) {
    return _then(
      _$ConfigAcblResponseModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        audicao:
            freezed == audicao
                ? _value.audicao
                : audicao // ignore: cast_nullable_to_non_nullable
                    as String?,
        tema:
            null == tema
                ? _value.tema
                : tema // ignore: cast_nullable_to_non_nullable
                    as TemaCSS,
        zoom:
            freezed == zoom
                ? _value.zoom
                : zoom // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfigAcblResponseModelImpl implements _ConfigAcblResponseModel {
  const _$ConfigAcblResponseModelImpl({
    required this.id,
    this.audicao,
    required this.tema,
    this.zoom,
  });

  factory _$ConfigAcblResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfigAcblResponseModelImplFromJson(json);

  @override
  final String id;
  @override
  final String? audicao;
  @override
  final TemaCSS tema;
  @override
  final String? zoom;

  @override
  String toString() {
    return 'ConfigAcblResponseModel(id: $id, audicao: $audicao, tema: $tema, zoom: $zoom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigAcblResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.audicao, audicao) || other.audicao == audicao) &&
            (identical(other.tema, tema) || other.tema == tema) &&
            (identical(other.zoom, zoom) || other.zoom == zoom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, audicao, tema, zoom);

  /// Create a copy of ConfigAcblResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigAcblResponseModelImplCopyWith<_$ConfigAcblResponseModelImpl>
  get copyWith => __$$ConfigAcblResponseModelImplCopyWithImpl<
    _$ConfigAcblResponseModelImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfigAcblResponseModelImplToJson(this);
  }
}

abstract class _ConfigAcblResponseModel implements ConfigAcblResponseModel {
  const factory _ConfigAcblResponseModel({
    required final String id,
    final String? audicao,
    required final TemaCSS tema,
    final String? zoom,
  }) = _$ConfigAcblResponseModelImpl;

  factory _ConfigAcblResponseModel.fromJson(Map<String, dynamic> json) =
      _$ConfigAcblResponseModelImpl.fromJson;

  @override
  String get id;
  @override
  String? get audicao;
  @override
  TemaCSS get tema;
  @override
  String? get zoom;

  /// Create a copy of ConfigAcblResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfigAcblResponseModelImplCopyWith<_$ConfigAcblResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
