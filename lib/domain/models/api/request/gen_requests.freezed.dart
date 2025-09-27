// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gen_requests.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AlunoRequestModel _$AlunoRequestModelFromJson(Map<String, dynamic> json) {
  return _AlunoRequestModel.fromJson(json);
}

/// @nodoc
mixin _$AlunoRequestModel {
  String get nome => throw _privateConstructorUsedError;
  String get login => throw _privateConstructorUsedError;
  String get senha => throw _privateConstructorUsedError;
  int get matricula => throw _privateConstructorUsedError; // Long -> String
  String? get biografia => throw _privateConstructorUsedError;

  /// Serializes this AlunoRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AlunoRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlunoRequestModelCopyWith<AlunoRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlunoRequestModelCopyWith<$Res> {
  factory $AlunoRequestModelCopyWith(
    AlunoRequestModel value,
    $Res Function(AlunoRequestModel) then,
  ) = _$AlunoRequestModelCopyWithImpl<$Res, AlunoRequestModel>;
  @useResult
  $Res call({
    String nome,
    String login,
    String senha,
    int matricula,
    String? biografia,
  });
}

/// @nodoc
class _$AlunoRequestModelCopyWithImpl<$Res, $Val extends AlunoRequestModel>
    implements $AlunoRequestModelCopyWith<$Res> {
  _$AlunoRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlunoRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? login = null,
    Object? senha = null,
    Object? matricula = null,
    Object? biografia = freezed,
  }) {
    return _then(
      _value.copyWith(
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
            senha:
                null == senha
                    ? _value.senha
                    : senha // ignore: cast_nullable_to_non_nullable
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AlunoRequestModelImplCopyWith<$Res>
    implements $AlunoRequestModelCopyWith<$Res> {
  factory _$$AlunoRequestModelImplCopyWith(
    _$AlunoRequestModelImpl value,
    $Res Function(_$AlunoRequestModelImpl) then,
  ) = __$$AlunoRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String nome,
    String login,
    String senha,
    int matricula,
    String? biografia,
  });
}

/// @nodoc
class __$$AlunoRequestModelImplCopyWithImpl<$Res>
    extends _$AlunoRequestModelCopyWithImpl<$Res, _$AlunoRequestModelImpl>
    implements _$$AlunoRequestModelImplCopyWith<$Res> {
  __$$AlunoRequestModelImplCopyWithImpl(
    _$AlunoRequestModelImpl _value,
    $Res Function(_$AlunoRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AlunoRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? login = null,
    Object? senha = null,
    Object? matricula = null,
    Object? biografia = freezed,
  }) {
    return _then(
      _$AlunoRequestModelImpl(
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
        senha:
            null == senha
                ? _value.senha
                : senha // ignore: cast_nullable_to_non_nullable
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AlunoRequestModelImpl implements _AlunoRequestModel {
  const _$AlunoRequestModelImpl({
    required this.nome,
    required this.login,
    required this.senha,
    required this.matricula,
    this.biografia,
  });

  factory _$AlunoRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlunoRequestModelImplFromJson(json);

  @override
  final String nome;
  @override
  final String login;
  @override
  final String senha;
  @override
  final int matricula;
  // Long -> String
  @override
  final String? biografia;

  @override
  String toString() {
    return 'AlunoRequestModel(nome: $nome, login: $login, senha: $senha, matricula: $matricula, biografia: $biografia)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlunoRequestModelImpl &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.senha, senha) || other.senha == senha) &&
            (identical(other.matricula, matricula) ||
                other.matricula == matricula) &&
            (identical(other.biografia, biografia) ||
                other.biografia == biografia));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, nome, login, senha, matricula, biografia);

  /// Create a copy of AlunoRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlunoRequestModelImplCopyWith<_$AlunoRequestModelImpl> get copyWith =>
      __$$AlunoRequestModelImplCopyWithImpl<_$AlunoRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AlunoRequestModelImplToJson(this);
  }
}

abstract class _AlunoRequestModel implements AlunoRequestModel {
  const factory _AlunoRequestModel({
    required final String nome,
    required final String login,
    required final String senha,
    required final int matricula,
    final String? biografia,
  }) = _$AlunoRequestModelImpl;

  factory _AlunoRequestModel.fromJson(Map<String, dynamic> json) =
      _$AlunoRequestModelImpl.fromJson;

  @override
  String get nome;
  @override
  String get login;
  @override
  String get senha;
  @override
  int get matricula; // Long -> String
  @override
  String? get biografia;

  /// Create a copy of AlunoRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlunoRequestModelImplCopyWith<_$AlunoRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AlunoNapneRequestModel _$AlunoNapneRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _AlunoNapneRequestModel.fromJson(json);
}

/// @nodoc
mixin _$AlunoNapneRequestModel {
  String get nome => throw _privateConstructorUsedError;
  String get login => throw _privateConstructorUsedError;
  String get senha => throw _privateConstructorUsedError;
  int get matricula => throw _privateConstructorUsedError;
  String? get biografia => throw _privateConstructorUsedError;
  String get condicao => throw _privateConstructorUsedError;
  String get laudo => throw _privateConstructorUsedError;
  String get necessidadeEspecial => throw _privateConstructorUsedError;
  String get necessidadeEscolar => throw _privateConstructorUsedError;
  String get acompanhamento => throw _privateConstructorUsedError;
  String get situacao => throw _privateConstructorUsedError;

  /// Serializes this AlunoNapneRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AlunoNapneRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlunoNapneRequestModelCopyWith<AlunoNapneRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlunoNapneRequestModelCopyWith<$Res> {
  factory $AlunoNapneRequestModelCopyWith(
    AlunoNapneRequestModel value,
    $Res Function(AlunoNapneRequestModel) then,
  ) = _$AlunoNapneRequestModelCopyWithImpl<$Res, AlunoNapneRequestModel>;
  @useResult
  $Res call({
    String nome,
    String login,
    String senha,
    int matricula,
    String? biografia,
    String condicao,
    String laudo,
    String necessidadeEspecial,
    String necessidadeEscolar,
    String acompanhamento,
    String situacao,
  });
}

/// @nodoc
class _$AlunoNapneRequestModelCopyWithImpl<
  $Res,
  $Val extends AlunoNapneRequestModel
>
    implements $AlunoNapneRequestModelCopyWith<$Res> {
  _$AlunoNapneRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlunoNapneRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? login = null,
    Object? senha = null,
    Object? matricula = null,
    Object? biografia = freezed,
    Object? condicao = null,
    Object? laudo = null,
    Object? necessidadeEspecial = null,
    Object? necessidadeEscolar = null,
    Object? acompanhamento = null,
    Object? situacao = null,
  }) {
    return _then(
      _value.copyWith(
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
            senha:
                null == senha
                    ? _value.senha
                    : senha // ignore: cast_nullable_to_non_nullable
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AlunoNapneRequestModelImplCopyWith<$Res>
    implements $AlunoNapneRequestModelCopyWith<$Res> {
  factory _$$AlunoNapneRequestModelImplCopyWith(
    _$AlunoNapneRequestModelImpl value,
    $Res Function(_$AlunoNapneRequestModelImpl) then,
  ) = __$$AlunoNapneRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String nome,
    String login,
    String senha,
    int matricula,
    String? biografia,
    String condicao,
    String laudo,
    String necessidadeEspecial,
    String necessidadeEscolar,
    String acompanhamento,
    String situacao,
  });
}

/// @nodoc
class __$$AlunoNapneRequestModelImplCopyWithImpl<$Res>
    extends
        _$AlunoNapneRequestModelCopyWithImpl<$Res, _$AlunoNapneRequestModelImpl>
    implements _$$AlunoNapneRequestModelImplCopyWith<$Res> {
  __$$AlunoNapneRequestModelImplCopyWithImpl(
    _$AlunoNapneRequestModelImpl _value,
    $Res Function(_$AlunoNapneRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AlunoNapneRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? login = null,
    Object? senha = null,
    Object? matricula = null,
    Object? biografia = freezed,
    Object? condicao = null,
    Object? laudo = null,
    Object? necessidadeEspecial = null,
    Object? necessidadeEscolar = null,
    Object? acompanhamento = null,
    Object? situacao = null,
  }) {
    return _then(
      _$AlunoNapneRequestModelImpl(
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
        senha:
            null == senha
                ? _value.senha
                : senha // ignore: cast_nullable_to_non_nullable
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
}

/// @nodoc
@JsonSerializable()
class _$AlunoNapneRequestModelImpl implements _AlunoNapneRequestModel {
  const _$AlunoNapneRequestModelImpl({
    required this.nome,
    required this.login,
    required this.senha,
    required this.matricula,
    this.biografia,
    required this.condicao,
    required this.laudo,
    required this.necessidadeEspecial,
    required this.necessidadeEscolar,
    required this.acompanhamento,
    required this.situacao,
  });

  factory _$AlunoNapneRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlunoNapneRequestModelImplFromJson(json);

  @override
  final String nome;
  @override
  final String login;
  @override
  final String senha;
  @override
  final int matricula;
  @override
  final String? biografia;
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

  @override
  String toString() {
    return 'AlunoNapneRequestModel(nome: $nome, login: $login, senha: $senha, matricula: $matricula, biografia: $biografia, condicao: $condicao, laudo: $laudo, necessidadeEspecial: $necessidadeEspecial, necessidadeEscolar: $necessidadeEscolar, acompanhamento: $acompanhamento, situacao: $situacao)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlunoNapneRequestModelImpl &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.senha, senha) || other.senha == senha) &&
            (identical(other.matricula, matricula) ||
                other.matricula == matricula) &&
            (identical(other.biografia, biografia) ||
                other.biografia == biografia) &&
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
    nome,
    login,
    senha,
    matricula,
    biografia,
    condicao,
    laudo,
    necessidadeEspecial,
    necessidadeEscolar,
    acompanhamento,
    situacao,
  );

  /// Create a copy of AlunoNapneRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlunoNapneRequestModelImplCopyWith<_$AlunoNapneRequestModelImpl>
  get copyWith =>
      __$$AlunoNapneRequestModelImplCopyWithImpl<_$AlunoNapneRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AlunoNapneRequestModelImplToJson(this);
  }
}

abstract class _AlunoNapneRequestModel implements AlunoNapneRequestModel {
  const factory _AlunoNapneRequestModel({
    required final String nome,
    required final String login,
    required final String senha,
    required final int matricula,
    final String? biografia,
    required final String condicao,
    required final String laudo,
    required final String necessidadeEspecial,
    required final String necessidadeEscolar,
    required final String acompanhamento,
    required final String situacao,
  }) = _$AlunoNapneRequestModelImpl;

  factory _AlunoNapneRequestModel.fromJson(Map<String, dynamic> json) =
      _$AlunoNapneRequestModelImpl.fromJson;

  @override
  String get nome;
  @override
  String get login;
  @override
  String get senha;
  @override
  int get matricula;
  @override
  String? get biografia;
  @override
  String get condicao;
  @override
  String get laudo;
  @override
  String get necessidadeEspecial;
  @override
  String get necessidadeEscolar;
  @override
  String get acompanhamento;
  @override
  String get situacao;

  /// Create a copy of AlunoNapneRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlunoNapneRequestModelImplCopyWith<_$AlunoNapneRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ProfessorRequestModel _$ProfessorRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _ProfessorRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ProfessorRequestModel {
  String get nome => throw _privateConstructorUsedError;
  String get login => throw _privateConstructorUsedError;
  String get senha => throw _privateConstructorUsedError;
  int get matricula => throw _privateConstructorUsedError;
  String? get biografia => throw _privateConstructorUsedError;
  String get formacao => throw _privateConstructorUsedError;

  /// Serializes this ProfessorRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfessorRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfessorRequestModelCopyWith<ProfessorRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfessorRequestModelCopyWith<$Res> {
  factory $ProfessorRequestModelCopyWith(
    ProfessorRequestModel value,
    $Res Function(ProfessorRequestModel) then,
  ) = _$ProfessorRequestModelCopyWithImpl<$Res, ProfessorRequestModel>;
  @useResult
  $Res call({
    String nome,
    String login,
    String senha,
    int matricula,
    String? biografia,
    String formacao,
  });
}

/// @nodoc
class _$ProfessorRequestModelCopyWithImpl<
  $Res,
  $Val extends ProfessorRequestModel
>
    implements $ProfessorRequestModelCopyWith<$Res> {
  _$ProfessorRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfessorRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? login = null,
    Object? senha = null,
    Object? matricula = null,
    Object? biografia = freezed,
    Object? formacao = null,
  }) {
    return _then(
      _value.copyWith(
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
            senha:
                null == senha
                    ? _value.senha
                    : senha // ignore: cast_nullable_to_non_nullable
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
            formacao:
                null == formacao
                    ? _value.formacao
                    : formacao // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfessorRequestModelImplCopyWith<$Res>
    implements $ProfessorRequestModelCopyWith<$Res> {
  factory _$$ProfessorRequestModelImplCopyWith(
    _$ProfessorRequestModelImpl value,
    $Res Function(_$ProfessorRequestModelImpl) then,
  ) = __$$ProfessorRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String nome,
    String login,
    String senha,
    int matricula,
    String? biografia,
    String formacao,
  });
}

/// @nodoc
class __$$ProfessorRequestModelImplCopyWithImpl<$Res>
    extends
        _$ProfessorRequestModelCopyWithImpl<$Res, _$ProfessorRequestModelImpl>
    implements _$$ProfessorRequestModelImplCopyWith<$Res> {
  __$$ProfessorRequestModelImplCopyWithImpl(
    _$ProfessorRequestModelImpl _value,
    $Res Function(_$ProfessorRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfessorRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? login = null,
    Object? senha = null,
    Object? matricula = null,
    Object? biografia = freezed,
    Object? formacao = null,
  }) {
    return _then(
      _$ProfessorRequestModelImpl(
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
        senha:
            null == senha
                ? _value.senha
                : senha // ignore: cast_nullable_to_non_nullable
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
class _$ProfessorRequestModelImpl implements _ProfessorRequestModel {
  const _$ProfessorRequestModelImpl({
    required this.nome,
    required this.login,
    required this.senha,
    required this.matricula,
    this.biografia,
    required this.formacao,
  });

  factory _$ProfessorRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfessorRequestModelImplFromJson(json);

  @override
  final String nome;
  @override
  final String login;
  @override
  final String senha;
  @override
  final int matricula;
  @override
  final String? biografia;
  @override
  final String formacao;

  @override
  String toString() {
    return 'ProfessorRequestModel(nome: $nome, login: $login, senha: $senha, matricula: $matricula, biografia: $biografia, formacao: $formacao)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfessorRequestModelImpl &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.senha, senha) || other.senha == senha) &&
            (identical(other.matricula, matricula) ||
                other.matricula == matricula) &&
            (identical(other.biografia, biografia) ||
                other.biografia == biografia) &&
            (identical(other.formacao, formacao) ||
                other.formacao == formacao));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    nome,
    login,
    senha,
    matricula,
    biografia,
    formacao,
  );

  /// Create a copy of ProfessorRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfessorRequestModelImplCopyWith<_$ProfessorRequestModelImpl>
  get copyWith =>
      __$$ProfessorRequestModelImplCopyWithImpl<_$ProfessorRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfessorRequestModelImplToJson(this);
  }
}

abstract class _ProfessorRequestModel implements ProfessorRequestModel {
  const factory _ProfessorRequestModel({
    required final String nome,
    required final String login,
    required final String senha,
    required final int matricula,
    final String? biografia,
    required final String formacao,
  }) = _$ProfessorRequestModelImpl;

  factory _ProfessorRequestModel.fromJson(Map<String, dynamic> json) =
      _$ProfessorRequestModelImpl.fromJson;

  @override
  String get nome;
  @override
  String get login;
  @override
  String get senha;
  @override
  int get matricula;
  @override
  String? get biografia;
  @override
  String get formacao;

  /// Create a copy of ProfessorRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfessorRequestModelImplCopyWith<_$ProfessorRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

TutorRequestModel _$TutorRequestModelFromJson(Map<String, dynamic> json) {
  return _TutorRequestModel.fromJson(json);
}

/// @nodoc
mixin _$TutorRequestModel {
  String get nome => throw _privateConstructorUsedError;
  String get login => throw _privateConstructorUsedError;
  String get senha => throw _privateConstructorUsedError;
  int get matricula => throw _privateConstructorUsedError;
  String? get biografia => throw _privateConstructorUsedError;
  String get especialidade => throw _privateConstructorUsedError;

  /// Serializes this TutorRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TutorRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TutorRequestModelCopyWith<TutorRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TutorRequestModelCopyWith<$Res> {
  factory $TutorRequestModelCopyWith(
    TutorRequestModel value,
    $Res Function(TutorRequestModel) then,
  ) = _$TutorRequestModelCopyWithImpl<$Res, TutorRequestModel>;
  @useResult
  $Res call({
    String nome,
    String login,
    String senha,
    int matricula,
    String? biografia,
    String especialidade,
  });
}

/// @nodoc
class _$TutorRequestModelCopyWithImpl<$Res, $Val extends TutorRequestModel>
    implements $TutorRequestModelCopyWith<$Res> {
  _$TutorRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TutorRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? login = null,
    Object? senha = null,
    Object? matricula = null,
    Object? biografia = freezed,
    Object? especialidade = null,
  }) {
    return _then(
      _value.copyWith(
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
            senha:
                null == senha
                    ? _value.senha
                    : senha // ignore: cast_nullable_to_non_nullable
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
            especialidade:
                null == especialidade
                    ? _value.especialidade
                    : especialidade // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TutorRequestModelImplCopyWith<$Res>
    implements $TutorRequestModelCopyWith<$Res> {
  factory _$$TutorRequestModelImplCopyWith(
    _$TutorRequestModelImpl value,
    $Res Function(_$TutorRequestModelImpl) then,
  ) = __$$TutorRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String nome,
    String login,
    String senha,
    int matricula,
    String? biografia,
    String especialidade,
  });
}

/// @nodoc
class __$$TutorRequestModelImplCopyWithImpl<$Res>
    extends _$TutorRequestModelCopyWithImpl<$Res, _$TutorRequestModelImpl>
    implements _$$TutorRequestModelImplCopyWith<$Res> {
  __$$TutorRequestModelImplCopyWithImpl(
    _$TutorRequestModelImpl _value,
    $Res Function(_$TutorRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TutorRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? login = null,
    Object? senha = null,
    Object? matricula = null,
    Object? biografia = freezed,
    Object? especialidade = null,
  }) {
    return _then(
      _$TutorRequestModelImpl(
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
        senha:
            null == senha
                ? _value.senha
                : senha // ignore: cast_nullable_to_non_nullable
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
class _$TutorRequestModelImpl implements _TutorRequestModel {
  const _$TutorRequestModelImpl({
    required this.nome,
    required this.login,
    required this.senha,
    required this.matricula,
    this.biografia,
    required this.especialidade,
  });

  factory _$TutorRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TutorRequestModelImplFromJson(json);

  @override
  final String nome;
  @override
  final String login;
  @override
  final String senha;
  @override
  final int matricula;
  @override
  final String? biografia;
  @override
  final String especialidade;

  @override
  String toString() {
    return 'TutorRequestModel(nome: $nome, login: $login, senha: $senha, matricula: $matricula, biografia: $biografia, especialidade: $especialidade)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TutorRequestModelImpl &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.senha, senha) || other.senha == senha) &&
            (identical(other.matricula, matricula) ||
                other.matricula == matricula) &&
            (identical(other.biografia, biografia) ||
                other.biografia == biografia) &&
            (identical(other.especialidade, especialidade) ||
                other.especialidade == especialidade));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    nome,
    login,
    senha,
    matricula,
    biografia,
    especialidade,
  );

  /// Create a copy of TutorRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TutorRequestModelImplCopyWith<_$TutorRequestModelImpl> get copyWith =>
      __$$TutorRequestModelImplCopyWithImpl<_$TutorRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TutorRequestModelImplToJson(this);
  }
}

abstract class _TutorRequestModel implements TutorRequestModel {
  const factory _TutorRequestModel({
    required final String nome,
    required final String login,
    required final String senha,
    required final int matricula,
    final String? biografia,
    required final String especialidade,
  }) = _$TutorRequestModelImpl;

  factory _TutorRequestModel.fromJson(Map<String, dynamic> json) =
      _$TutorRequestModelImpl.fromJson;

  @override
  String get nome;
  @override
  String get login;
  @override
  String get senha;
  @override
  int get matricula;
  @override
  String? get biografia;
  @override
  String get especialidade;

  /// Create a copy of TutorRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TutorRequestModelImplCopyWith<_$TutorRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InterpreteRequestModel _$InterpreteRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _InterpreteRequestModel.fromJson(json);
}

/// @nodoc
mixin _$InterpreteRequestModel {
  String get nome => throw _privateConstructorUsedError;
  String get login => throw _privateConstructorUsedError;
  String get senha => throw _privateConstructorUsedError;
  int get matricula => throw _privateConstructorUsedError;
  String? get biografia => throw _privateConstructorUsedError;
  String get especialidade =>
      throw _privateConstructorUsedError; // Campo do Tutor
  double get salary => throw _privateConstructorUsedError;

  /// Serializes this InterpreteRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InterpreteRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InterpreteRequestModelCopyWith<InterpreteRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterpreteRequestModelCopyWith<$Res> {
  factory $InterpreteRequestModelCopyWith(
    InterpreteRequestModel value,
    $Res Function(InterpreteRequestModel) then,
  ) = _$InterpreteRequestModelCopyWithImpl<$Res, InterpreteRequestModel>;
  @useResult
  $Res call({
    String nome,
    String login,
    String senha,
    int matricula,
    String? biografia,
    String especialidade,
    double salary,
  });
}

/// @nodoc
class _$InterpreteRequestModelCopyWithImpl<
  $Res,
  $Val extends InterpreteRequestModel
>
    implements $InterpreteRequestModelCopyWith<$Res> {
  _$InterpreteRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InterpreteRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? login = null,
    Object? senha = null,
    Object? matricula = null,
    Object? biografia = freezed,
    Object? especialidade = null,
    Object? salary = null,
  }) {
    return _then(
      _value.copyWith(
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
            senha:
                null == senha
                    ? _value.senha
                    : senha // ignore: cast_nullable_to_non_nullable
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InterpreteRequestModelImplCopyWith<$Res>
    implements $InterpreteRequestModelCopyWith<$Res> {
  factory _$$InterpreteRequestModelImplCopyWith(
    _$InterpreteRequestModelImpl value,
    $Res Function(_$InterpreteRequestModelImpl) then,
  ) = __$$InterpreteRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String nome,
    String login,
    String senha,
    int matricula,
    String? biografia,
    String especialidade,
    double salary,
  });
}

/// @nodoc
class __$$InterpreteRequestModelImplCopyWithImpl<$Res>
    extends
        _$InterpreteRequestModelCopyWithImpl<$Res, _$InterpreteRequestModelImpl>
    implements _$$InterpreteRequestModelImplCopyWith<$Res> {
  __$$InterpreteRequestModelImplCopyWithImpl(
    _$InterpreteRequestModelImpl _value,
    $Res Function(_$InterpreteRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InterpreteRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? login = null,
    Object? senha = null,
    Object? matricula = null,
    Object? biografia = freezed,
    Object? especialidade = null,
    Object? salary = null,
  }) {
    return _then(
      _$InterpreteRequestModelImpl(
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
        senha:
            null == senha
                ? _value.senha
                : senha // ignore: cast_nullable_to_non_nullable
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
class _$InterpreteRequestModelImpl implements _InterpreteRequestModel {
  const _$InterpreteRequestModelImpl({
    required this.nome,
    required this.login,
    required this.senha,
    required this.matricula,
    this.biografia,
    required this.especialidade,
    required this.salary,
  });

  factory _$InterpreteRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InterpreteRequestModelImplFromJson(json);

  @override
  final String nome;
  @override
  final String login;
  @override
  final String senha;
  @override
  final int matricula;
  @override
  final String? biografia;
  @override
  final String especialidade;
  // Campo do Tutor
  @override
  final double salary;

  @override
  String toString() {
    return 'InterpreteRequestModel(nome: $nome, login: $login, senha: $senha, matricula: $matricula, biografia: $biografia, especialidade: $especialidade, salary: $salary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterpreteRequestModelImpl &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.senha, senha) || other.senha == senha) &&
            (identical(other.matricula, matricula) ||
                other.matricula == matricula) &&
            (identical(other.biografia, biografia) ||
                other.biografia == biografia) &&
            (identical(other.especialidade, especialidade) ||
                other.especialidade == especialidade) &&
            (identical(other.salary, salary) || other.salary == salary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    nome,
    login,
    senha,
    matricula,
    biografia,
    especialidade,
    salary,
  );

  /// Create a copy of InterpreteRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InterpreteRequestModelImplCopyWith<_$InterpreteRequestModelImpl>
  get copyWith =>
      __$$InterpreteRequestModelImplCopyWithImpl<_$InterpreteRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InterpreteRequestModelImplToJson(this);
  }
}

abstract class _InterpreteRequestModel implements InterpreteRequestModel {
  const factory _InterpreteRequestModel({
    required final String nome,
    required final String login,
    required final String senha,
    required final int matricula,
    final String? biografia,
    required final String especialidade,
    required final double salary,
  }) = _$InterpreteRequestModelImpl;

  factory _InterpreteRequestModel.fromJson(Map<String, dynamic> json) =
      _$InterpreteRequestModelImpl.fromJson;

  @override
  String get nome;
  @override
  String get login;
  @override
  String get senha;
  @override
  int get matricula;
  @override
  String? get biografia;
  @override
  String get especialidade; // Campo do Tutor
  @override
  double get salary;

  /// Create a copy of InterpreteRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InterpreteRequestModelImplCopyWith<_$InterpreteRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) {
  return _LoginRequestModel.fromJson(json);
}

/// @nodoc
mixin _$LoginRequestModel {
  String get login => throw _privateConstructorUsedError;
  String get senha => throw _privateConstructorUsedError;

  /// Serializes this LoginRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginRequestModelCopyWith<LoginRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginRequestModelCopyWith<$Res> {
  factory $LoginRequestModelCopyWith(
    LoginRequestModel value,
    $Res Function(LoginRequestModel) then,
  ) = _$LoginRequestModelCopyWithImpl<$Res, LoginRequestModel>;
  @useResult
  $Res call({String login, String senha});
}

/// @nodoc
class _$LoginRequestModelCopyWithImpl<$Res, $Val extends LoginRequestModel>
    implements $LoginRequestModelCopyWith<$Res> {
  _$LoginRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? login = null, Object? senha = null}) {
    return _then(
      _value.copyWith(
            login:
                null == login
                    ? _value.login
                    : login // ignore: cast_nullable_to_non_nullable
                        as String,
            senha:
                null == senha
                    ? _value.senha
                    : senha // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoginRequestModelImplCopyWith<$Res>
    implements $LoginRequestModelCopyWith<$Res> {
  factory _$$LoginRequestModelImplCopyWith(
    _$LoginRequestModelImpl value,
    $Res Function(_$LoginRequestModelImpl) then,
  ) = __$$LoginRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String login, String senha});
}

/// @nodoc
class __$$LoginRequestModelImplCopyWithImpl<$Res>
    extends _$LoginRequestModelCopyWithImpl<$Res, _$LoginRequestModelImpl>
    implements _$$LoginRequestModelImplCopyWith<$Res> {
  __$$LoginRequestModelImplCopyWithImpl(
    _$LoginRequestModelImpl _value,
    $Res Function(_$LoginRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? login = null, Object? senha = null}) {
    return _then(
      _$LoginRequestModelImpl(
        login:
            null == login
                ? _value.login
                : login // ignore: cast_nullable_to_non_nullable
                    as String,
        senha:
            null == senha
                ? _value.senha
                : senha // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginRequestModelImpl implements _LoginRequestModel {
  const _$LoginRequestModelImpl({required this.login, required this.senha});

  factory _$LoginRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginRequestModelImplFromJson(json);

  @override
  final String login;
  @override
  final String senha;

  @override
  String toString() {
    return 'LoginRequestModel(login: $login, senha: $senha)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginRequestModelImpl &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.senha, senha) || other.senha == senha));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, login, senha);

  /// Create a copy of LoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginRequestModelImplCopyWith<_$LoginRequestModelImpl> get copyWith =>
      __$$LoginRequestModelImplCopyWithImpl<_$LoginRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginRequestModelImplToJson(this);
  }
}

abstract class _LoginRequestModel implements LoginRequestModel {
  const factory _LoginRequestModel({
    required final String login,
    required final String senha,
  }) = _$LoginRequestModelImpl;

  factory _LoginRequestModel.fromJson(Map<String, dynamic> json) =
      _$LoginRequestModelImpl.fromJson;

  @override
  String get login;
  @override
  String get senha;

  /// Create a copy of LoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginRequestModelImplCopyWith<_$LoginRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ForgotPasswordRequestModel _$ForgotPasswordRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _ForgotPasswordRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ForgotPasswordRequestModel {
  String get email => throw _privateConstructorUsedError;

  /// Serializes this ForgotPasswordRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForgotPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgotPasswordRequestModelCopyWith<ForgotPasswordRequestModel>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordRequestModelCopyWith<$Res> {
  factory $ForgotPasswordRequestModelCopyWith(
    ForgotPasswordRequestModel value,
    $Res Function(ForgotPasswordRequestModel) then,
  ) =
      _$ForgotPasswordRequestModelCopyWithImpl<
        $Res,
        ForgotPasswordRequestModel
      >;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$ForgotPasswordRequestModelCopyWithImpl<
  $Res,
  $Val extends ForgotPasswordRequestModel
>
    implements $ForgotPasswordRequestModelCopyWith<$Res> {
  _$ForgotPasswordRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _value.copyWith(
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ForgotPasswordRequestModelImplCopyWith<$Res>
    implements $ForgotPasswordRequestModelCopyWith<$Res> {
  factory _$$ForgotPasswordRequestModelImplCopyWith(
    _$ForgotPasswordRequestModelImpl value,
    $Res Function(_$ForgotPasswordRequestModelImpl) then,
  ) = __$$ForgotPasswordRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ForgotPasswordRequestModelImplCopyWithImpl<$Res>
    extends
        _$ForgotPasswordRequestModelCopyWithImpl<
          $Res,
          _$ForgotPasswordRequestModelImpl
        >
    implements _$$ForgotPasswordRequestModelImplCopyWith<$Res> {
  __$$ForgotPasswordRequestModelImplCopyWithImpl(
    _$ForgotPasswordRequestModelImpl _value,
    $Res Function(_$ForgotPasswordRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForgotPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$ForgotPasswordRequestModelImpl(
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ForgotPasswordRequestModelImpl implements _ForgotPasswordRequestModel {
  const _$ForgotPasswordRequestModelImpl({required this.email});

  factory _$ForgotPasswordRequestModelImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$ForgotPasswordRequestModelImplFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'ForgotPasswordRequestModel(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordRequestModelImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of ForgotPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordRequestModelImplCopyWith<_$ForgotPasswordRequestModelImpl>
  get copyWith => __$$ForgotPasswordRequestModelImplCopyWithImpl<
    _$ForgotPasswordRequestModelImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForgotPasswordRequestModelImplToJson(this);
  }
}

abstract class _ForgotPasswordRequestModel
    implements ForgotPasswordRequestModel {
  const factory _ForgotPasswordRequestModel({required final String email}) =
      _$ForgotPasswordRequestModelImpl;

  factory _ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) =
      _$ForgotPasswordRequestModelImpl.fromJson;

  @override
  String get email;

  /// Create a copy of ForgotPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPasswordRequestModelImplCopyWith<_$ForgotPasswordRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ResetPasswordRequestModel _$ResetPasswordRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _ResetPasswordRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ResetPasswordRequestModel {
  String get token => throw _privateConstructorUsedError;
  String get novaSenha => throw _privateConstructorUsedError;

  /// Serializes this ResetPasswordRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResetPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResetPasswordRequestModelCopyWith<ResetPasswordRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordRequestModelCopyWith<$Res> {
  factory $ResetPasswordRequestModelCopyWith(
    ResetPasswordRequestModel value,
    $Res Function(ResetPasswordRequestModel) then,
  ) = _$ResetPasswordRequestModelCopyWithImpl<$Res, ResetPasswordRequestModel>;
  @useResult
  $Res call({String token, String novaSenha});
}

/// @nodoc
class _$ResetPasswordRequestModelCopyWithImpl<
  $Res,
  $Val extends ResetPasswordRequestModel
>
    implements $ResetPasswordRequestModelCopyWith<$Res> {
  _$ResetPasswordRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResetPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? token = null, Object? novaSenha = null}) {
    return _then(
      _value.copyWith(
            token:
                null == token
                    ? _value.token
                    : token // ignore: cast_nullable_to_non_nullable
                        as String,
            novaSenha:
                null == novaSenha
                    ? _value.novaSenha
                    : novaSenha // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResetPasswordRequestModelImplCopyWith<$Res>
    implements $ResetPasswordRequestModelCopyWith<$Res> {
  factory _$$ResetPasswordRequestModelImplCopyWith(
    _$ResetPasswordRequestModelImpl value,
    $Res Function(_$ResetPasswordRequestModelImpl) then,
  ) = __$$ResetPasswordRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String novaSenha});
}

/// @nodoc
class __$$ResetPasswordRequestModelImplCopyWithImpl<$Res>
    extends
        _$ResetPasswordRequestModelCopyWithImpl<
          $Res,
          _$ResetPasswordRequestModelImpl
        >
    implements _$$ResetPasswordRequestModelImplCopyWith<$Res> {
  __$$ResetPasswordRequestModelImplCopyWithImpl(
    _$ResetPasswordRequestModelImpl _value,
    $Res Function(_$ResetPasswordRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResetPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? token = null, Object? novaSenha = null}) {
    return _then(
      _$ResetPasswordRequestModelImpl(
        token:
            null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                    as String,
        novaSenha:
            null == novaSenha
                ? _value.novaSenha
                : novaSenha // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResetPasswordRequestModelImpl implements _ResetPasswordRequestModel {
  const _$ResetPasswordRequestModelImpl({
    required this.token,
    required this.novaSenha,
  });

  factory _$ResetPasswordRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResetPasswordRequestModelImplFromJson(json);

  @override
  final String token;
  @override
  final String novaSenha;

  @override
  String toString() {
    return 'ResetPasswordRequestModel(token: $token, novaSenha: $novaSenha)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordRequestModelImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.novaSenha, novaSenha) ||
                other.novaSenha == novaSenha));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, novaSenha);

  /// Create a copy of ResetPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordRequestModelImplCopyWith<_$ResetPasswordRequestModelImpl>
  get copyWith => __$$ResetPasswordRequestModelImplCopyWithImpl<
    _$ResetPasswordRequestModelImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResetPasswordRequestModelImplToJson(this);
  }
}

abstract class _ResetPasswordRequestModel implements ResetPasswordRequestModel {
  const factory _ResetPasswordRequestModel({
    required final String token,
    required final String novaSenha,
  }) = _$ResetPasswordRequestModelImpl;

  factory _ResetPasswordRequestModel.fromJson(Map<String, dynamic> json) =
      _$ResetPasswordRequestModelImpl.fromJson;

  @override
  String get token;
  @override
  String get novaSenha;

  /// Create a copy of ResetPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPasswordRequestModelImplCopyWith<_$ResetPasswordRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

UpdatePasswordRequestModel _$UpdatePasswordRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _UpdatePasswordRequestModel.fromJson(json);
}

/// @nodoc
mixin _$UpdatePasswordRequestModel {
  String get email => throw _privateConstructorUsedError;
  String get senhaAtual => throw _privateConstructorUsedError;
  String get novaSenha => throw _privateConstructorUsedError;

  /// Serializes this UpdatePasswordRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdatePasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdatePasswordRequestModelCopyWith<UpdatePasswordRequestModel>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePasswordRequestModelCopyWith<$Res> {
  factory $UpdatePasswordRequestModelCopyWith(
    UpdatePasswordRequestModel value,
    $Res Function(UpdatePasswordRequestModel) then,
  ) =
      _$UpdatePasswordRequestModelCopyWithImpl<
        $Res,
        UpdatePasswordRequestModel
      >;
  @useResult
  $Res call({String email, String senhaAtual, String novaSenha});
}

/// @nodoc
class _$UpdatePasswordRequestModelCopyWithImpl<
  $Res,
  $Val extends UpdatePasswordRequestModel
>
    implements $UpdatePasswordRequestModelCopyWith<$Res> {
  _$UpdatePasswordRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdatePasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? senhaAtual = null,
    Object? novaSenha = null,
  }) {
    return _then(
      _value.copyWith(
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            senhaAtual:
                null == senhaAtual
                    ? _value.senhaAtual
                    : senhaAtual // ignore: cast_nullable_to_non_nullable
                        as String,
            novaSenha:
                null == novaSenha
                    ? _value.novaSenha
                    : novaSenha // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdatePasswordRequestModelImplCopyWith<$Res>
    implements $UpdatePasswordRequestModelCopyWith<$Res> {
  factory _$$UpdatePasswordRequestModelImplCopyWith(
    _$UpdatePasswordRequestModelImpl value,
    $Res Function(_$UpdatePasswordRequestModelImpl) then,
  ) = __$$UpdatePasswordRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String senhaAtual, String novaSenha});
}

/// @nodoc
class __$$UpdatePasswordRequestModelImplCopyWithImpl<$Res>
    extends
        _$UpdatePasswordRequestModelCopyWithImpl<
          $Res,
          _$UpdatePasswordRequestModelImpl
        >
    implements _$$UpdatePasswordRequestModelImplCopyWith<$Res> {
  __$$UpdatePasswordRequestModelImplCopyWithImpl(
    _$UpdatePasswordRequestModelImpl _value,
    $Res Function(_$UpdatePasswordRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdatePasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? senhaAtual = null,
    Object? novaSenha = null,
  }) {
    return _then(
      _$UpdatePasswordRequestModelImpl(
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        senhaAtual:
            null == senhaAtual
                ? _value.senhaAtual
                : senhaAtual // ignore: cast_nullable_to_non_nullable
                    as String,
        novaSenha:
            null == novaSenha
                ? _value.novaSenha
                : novaSenha // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePasswordRequestModelImpl implements _UpdatePasswordRequestModel {
  const _$UpdatePasswordRequestModelImpl({
    required this.email,
    required this.senhaAtual,
    required this.novaSenha,
  });

  factory _$UpdatePasswordRequestModelImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$UpdatePasswordRequestModelImplFromJson(json);

  @override
  final String email;
  @override
  final String senhaAtual;
  @override
  final String novaSenha;

  @override
  String toString() {
    return 'UpdatePasswordRequestModel(email: $email, senhaAtual: $senhaAtual, novaSenha: $novaSenha)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePasswordRequestModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.senhaAtual, senhaAtual) ||
                other.senhaAtual == senhaAtual) &&
            (identical(other.novaSenha, novaSenha) ||
                other.novaSenha == novaSenha));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, senhaAtual, novaSenha);

  /// Create a copy of UpdatePasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePasswordRequestModelImplCopyWith<_$UpdatePasswordRequestModelImpl>
  get copyWith => __$$UpdatePasswordRequestModelImplCopyWithImpl<
    _$UpdatePasswordRequestModelImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePasswordRequestModelImplToJson(this);
  }
}

abstract class _UpdatePasswordRequestModel
    implements UpdatePasswordRequestModel {
  const factory _UpdatePasswordRequestModel({
    required final String email,
    required final String senhaAtual,
    required final String novaSenha,
  }) = _$UpdatePasswordRequestModelImpl;

  factory _UpdatePasswordRequestModel.fromJson(Map<String, dynamic> json) =
      _$UpdatePasswordRequestModelImpl.fromJson;

  @override
  String get email;
  @override
  String get senhaAtual;
  @override
  String get novaSenha;

  /// Create a copy of UpdatePasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePasswordRequestModelImplCopyWith<_$UpdatePasswordRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

PublicacaoRequestModel _$PublicacaoRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _PublicacaoRequestModel.fromJson(json);
}

/// @nodoc
mixin _$PublicacaoRequestModel {
  String get titulo => throw _privateConstructorUsedError;
  String get texto => throw _privateConstructorUsedError;
  @JsonKey(toJson: _categoriasToJson, fromJson: _categoriasFromJson)
  Set<Categorias> get categorias => throw _privateConstructorUsedError;
  int? get parentId => throw _privateConstructorUsedError;

  /// Serializes this PublicacaoRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PublicacaoRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PublicacaoRequestModelCopyWith<PublicacaoRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicacaoRequestModelCopyWith<$Res> {
  factory $PublicacaoRequestModelCopyWith(
    PublicacaoRequestModel value,
    $Res Function(PublicacaoRequestModel) then,
  ) = _$PublicacaoRequestModelCopyWithImpl<$Res, PublicacaoRequestModel>;
  @useResult
  $Res call({
    String titulo,
    String texto,
    @JsonKey(toJson: _categoriasToJson, fromJson: _categoriasFromJson)
    Set<Categorias> categorias,
    int? parentId,
  });
}

/// @nodoc
class _$PublicacaoRequestModelCopyWithImpl<
  $Res,
  $Val extends PublicacaoRequestModel
>
    implements $PublicacaoRequestModelCopyWith<$Res> {
  _$PublicacaoRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PublicacaoRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titulo = null,
    Object? texto = null,
    Object? categorias = null,
    Object? parentId = freezed,
  }) {
    return _then(
      _value.copyWith(
            titulo:
                null == titulo
                    ? _value.titulo
                    : titulo // ignore: cast_nullable_to_non_nullable
                        as String,
            texto:
                null == texto
                    ? _value.texto
                    : texto // ignore: cast_nullable_to_non_nullable
                        as String,
            categorias:
                null == categorias
                    ? _value.categorias
                    : categorias // ignore: cast_nullable_to_non_nullable
                        as Set<Categorias>,
            parentId:
                freezed == parentId
                    ? _value.parentId
                    : parentId // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PublicacaoRequestModelImplCopyWith<$Res>
    implements $PublicacaoRequestModelCopyWith<$Res> {
  factory _$$PublicacaoRequestModelImplCopyWith(
    _$PublicacaoRequestModelImpl value,
    $Res Function(_$PublicacaoRequestModelImpl) then,
  ) = __$$PublicacaoRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String titulo,
    String texto,
    @JsonKey(toJson: _categoriasToJson, fromJson: _categoriasFromJson)
    Set<Categorias> categorias,
    int? parentId,
  });
}

/// @nodoc
class __$$PublicacaoRequestModelImplCopyWithImpl<$Res>
    extends
        _$PublicacaoRequestModelCopyWithImpl<$Res, _$PublicacaoRequestModelImpl>
    implements _$$PublicacaoRequestModelImplCopyWith<$Res> {
  __$$PublicacaoRequestModelImplCopyWithImpl(
    _$PublicacaoRequestModelImpl _value,
    $Res Function(_$PublicacaoRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PublicacaoRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titulo = null,
    Object? texto = null,
    Object? categorias = null,
    Object? parentId = freezed,
  }) {
    return _then(
      _$PublicacaoRequestModelImpl(
        titulo:
            null == titulo
                ? _value.titulo
                : titulo // ignore: cast_nullable_to_non_nullable
                    as String,
        texto:
            null == texto
                ? _value.texto
                : texto // ignore: cast_nullable_to_non_nullable
                    as String,
        categorias:
            null == categorias
                ? _value._categorias
                : categorias // ignore: cast_nullable_to_non_nullable
                    as Set<Categorias>,
        parentId:
            freezed == parentId
                ? _value.parentId
                : parentId // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PublicacaoRequestModelImpl implements _PublicacaoRequestModel {
  const _$PublicacaoRequestModelImpl({
    required this.titulo,
    required this.texto,
    @JsonKey(toJson: _categoriasToJson, fromJson: _categoriasFromJson)
    required final Set<Categorias> categorias,
    required this.parentId,
  }) : _categorias = categorias;

  factory _$PublicacaoRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublicacaoRequestModelImplFromJson(json);

  @override
  final String titulo;
  @override
  final String texto;
  final Set<Categorias> _categorias;
  @override
  @JsonKey(toJson: _categoriasToJson, fromJson: _categoriasFromJson)
  Set<Categorias> get categorias {
    if (_categorias is EqualUnmodifiableSetView) return _categorias;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_categorias);
  }

  @override
  final int? parentId;

  @override
  String toString() {
    return 'PublicacaoRequestModel(titulo: $titulo, texto: $texto, categorias: $categorias, parentId: $parentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicacaoRequestModelImpl &&
            (identical(other.titulo, titulo) || other.titulo == titulo) &&
            (identical(other.texto, texto) || other.texto == texto) &&
            const DeepCollectionEquality().equals(
              other._categorias,
              _categorias,
            ) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    titulo,
    texto,
    const DeepCollectionEquality().hash(_categorias),
    parentId,
  );

  /// Create a copy of PublicacaoRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PublicacaoRequestModelImplCopyWith<_$PublicacaoRequestModelImpl>
  get copyWith =>
      __$$PublicacaoRequestModelImplCopyWithImpl<_$PublicacaoRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PublicacaoRequestModelImplToJson(this);
  }
}

abstract class _PublicacaoRequestModel implements PublicacaoRequestModel {
  const factory _PublicacaoRequestModel({
    required final String titulo,
    required final String texto,
    @JsonKey(toJson: _categoriasToJson, fromJson: _categoriasFromJson)
    required final Set<Categorias> categorias,
    required final int? parentId,
  }) = _$PublicacaoRequestModelImpl;

  factory _PublicacaoRequestModel.fromJson(Map<String, dynamic> json) =
      _$PublicacaoRequestModelImpl.fromJson;

  @override
  String get titulo;
  @override
  String get texto;
  @override
  @JsonKey(toJson: _categoriasToJson, fromJson: _categoriasFromJson)
  Set<Categorias> get categorias;
  @override
  int? get parentId;

  /// Create a copy of PublicacaoRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PublicacaoRequestModelImplCopyWith<_$PublicacaoRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

LibrasRequestModel _$LibrasRequestModelFromJson(Map<String, dynamic> json) {
  return _LibrasRequestModel.fromJson(json);
}

/// @nodoc
mixin _$LibrasRequestModel {
  String get palavra => throw _privateConstructorUsedError;
  String get descricao => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get video => throw _privateConstructorUsedError;
  String? get foto => throw _privateConstructorUsedError;
  String? get justificativa => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  Categorias get categorias => throw _privateConstructorUsedError;

  /// Serializes this LibrasRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LibrasRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LibrasRequestModelCopyWith<LibrasRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibrasRequestModelCopyWith<$Res> {
  factory $LibrasRequestModelCopyWith(
    LibrasRequestModel value,
    $Res Function(LibrasRequestModel) then,
  ) = _$LibrasRequestModelCopyWithImpl<$Res, LibrasRequestModel>;
  @useResult
  $Res call({
    String palavra,
    String descricao,
    String? url,
    String? video,
    String? foto,
    String? justificativa,
    Status status,
    Categorias categorias,
  });
}

/// @nodoc
class _$LibrasRequestModelCopyWithImpl<$Res, $Val extends LibrasRequestModel>
    implements $LibrasRequestModelCopyWith<$Res> {
  _$LibrasRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LibrasRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? palavra = null,
    Object? descricao = null,
    Object? url = freezed,
    Object? video = freezed,
    Object? foto = freezed,
    Object? justificativa = freezed,
    Object? status = null,
    Object? categorias = null,
  }) {
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LibrasRequestModelImplCopyWith<$Res>
    implements $LibrasRequestModelCopyWith<$Res> {
  factory _$$LibrasRequestModelImplCopyWith(
    _$LibrasRequestModelImpl value,
    $Res Function(_$LibrasRequestModelImpl) then,
  ) = __$$LibrasRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String palavra,
    String descricao,
    String? url,
    String? video,
    String? foto,
    String? justificativa,
    Status status,
    Categorias categorias,
  });
}

/// @nodoc
class __$$LibrasRequestModelImplCopyWithImpl<$Res>
    extends _$LibrasRequestModelCopyWithImpl<$Res, _$LibrasRequestModelImpl>
    implements _$$LibrasRequestModelImplCopyWith<$Res> {
  __$$LibrasRequestModelImplCopyWithImpl(
    _$LibrasRequestModelImpl _value,
    $Res Function(_$LibrasRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LibrasRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? palavra = null,
    Object? descricao = null,
    Object? url = freezed,
    Object? video = freezed,
    Object? foto = freezed,
    Object? justificativa = freezed,
    Object? status = null,
    Object? categorias = null,
  }) {
    return _then(
      _$LibrasRequestModelImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LibrasRequestModelImpl implements _LibrasRequestModel {
  const _$LibrasRequestModelImpl({
    required this.palavra,
    required this.descricao,
    this.url,
    this.video,
    this.foto,
    this.justificativa,
    required this.status,
    required this.categorias,
  });

  factory _$LibrasRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LibrasRequestModelImplFromJson(json);

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

  @override
  String toString() {
    return 'LibrasRequestModel(palavra: $palavra, descricao: $descricao, url: $url, video: $video, foto: $foto, justificativa: $justificativa, status: $status, categorias: $categorias)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibrasRequestModelImpl &&
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
                other.categorias == categorias));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    palavra,
    descricao,
    url,
    video,
    foto,
    justificativa,
    status,
    categorias,
  );

  /// Create a copy of LibrasRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LibrasRequestModelImplCopyWith<_$LibrasRequestModelImpl> get copyWith =>
      __$$LibrasRequestModelImplCopyWithImpl<_$LibrasRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LibrasRequestModelImplToJson(this);
  }
}

abstract class _LibrasRequestModel implements LibrasRequestModel {
  const factory _LibrasRequestModel({
    required final String palavra,
    required final String descricao,
    final String? url,
    final String? video,
    final String? foto,
    final String? justificativa,
    required final Status status,
    required final Categorias categorias,
  }) = _$LibrasRequestModelImpl;

  factory _LibrasRequestModel.fromJson(Map<String, dynamic> json) =
      _$LibrasRequestModelImpl.fromJson;

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

  /// Create a copy of LibrasRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LibrasRequestModelImplCopyWith<_$LibrasRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalisePalavraRequestModel _$AnalisePalavraRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _AnalisePalavraRequestModel.fromJson(json);
}

/// @nodoc
mixin _$AnalisePalavraRequestModel {
  String get palavra => throw _privateConstructorUsedError;
  Categorias get categorias => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String get Justificativa => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get video => throw _privateConstructorUsedError;
  String? get foto => throw _privateConstructorUsedError;

  /// Serializes this AnalisePalavraRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalisePalavraRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalisePalavraRequestModelCopyWith<AnalisePalavraRequestModel>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalisePalavraRequestModelCopyWith<$Res> {
  factory $AnalisePalavraRequestModelCopyWith(
    AnalisePalavraRequestModel value,
    $Res Function(AnalisePalavraRequestModel) then,
  ) =
      _$AnalisePalavraRequestModelCopyWithImpl<
        $Res,
        AnalisePalavraRequestModel
      >;
  @useResult
  $Res call({
    String palavra,
    Categorias categorias,
    Status status,
    String Justificativa,
    String? url,
    String? video,
    String? foto,
  });
}

/// @nodoc
class _$AnalisePalavraRequestModelCopyWithImpl<
  $Res,
  $Val extends AnalisePalavraRequestModel
>
    implements $AnalisePalavraRequestModelCopyWith<$Res> {
  _$AnalisePalavraRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalisePalavraRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? palavra = null,
    Object? categorias = null,
    Object? status = null,
    Object? Justificativa = null,
    Object? url = freezed,
    Object? video = freezed,
    Object? foto = freezed,
  }) {
    return _then(
      _value.copyWith(
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
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as Status,
            Justificativa:
                null == Justificativa
                    ? _value.Justificativa
                    : Justificativa // ignore: cast_nullable_to_non_nullable
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnalisePalavraRequestModelImplCopyWith<$Res>
    implements $AnalisePalavraRequestModelCopyWith<$Res> {
  factory _$$AnalisePalavraRequestModelImplCopyWith(
    _$AnalisePalavraRequestModelImpl value,
    $Res Function(_$AnalisePalavraRequestModelImpl) then,
  ) = __$$AnalisePalavraRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String palavra,
    Categorias categorias,
    Status status,
    String Justificativa,
    String? url,
    String? video,
    String? foto,
  });
}

/// @nodoc
class __$$AnalisePalavraRequestModelImplCopyWithImpl<$Res>
    extends
        _$AnalisePalavraRequestModelCopyWithImpl<
          $Res,
          _$AnalisePalavraRequestModelImpl
        >
    implements _$$AnalisePalavraRequestModelImplCopyWith<$Res> {
  __$$AnalisePalavraRequestModelImplCopyWithImpl(
    _$AnalisePalavraRequestModelImpl _value,
    $Res Function(_$AnalisePalavraRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnalisePalavraRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? palavra = null,
    Object? categorias = null,
    Object? status = null,
    Object? Justificativa = null,
    Object? url = freezed,
    Object? video = freezed,
    Object? foto = freezed,
  }) {
    return _then(
      _$AnalisePalavraRequestModelImpl(
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
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as Status,
        Justificativa:
            null == Justificativa
                ? _value.Justificativa
                : Justificativa // ignore: cast_nullable_to_non_nullable
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalisePalavraRequestModelImpl implements _AnalisePalavraRequestModel {
  const _$AnalisePalavraRequestModelImpl({
    required this.palavra,
    required this.categorias,
    required this.status,
    required this.Justificativa,
    this.url,
    this.video,
    this.foto,
  });

  factory _$AnalisePalavraRequestModelImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$AnalisePalavraRequestModelImplFromJson(json);

  @override
  final String palavra;
  @override
  final Categorias categorias;
  @override
  final Status status;
  @override
  final String Justificativa;
  @override
  final String? url;
  @override
  final String? video;
  @override
  final String? foto;

  @override
  String toString() {
    return 'AnalisePalavraRequestModel(palavra: $palavra, categorias: $categorias, status: $status, Justificativa: $Justificativa, url: $url, video: $video, foto: $foto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalisePalavraRequestModelImpl &&
            (identical(other.palavra, palavra) || other.palavra == palavra) &&
            (identical(other.categorias, categorias) ||
                other.categorias == categorias) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.Justificativa, Justificativa) ||
                other.Justificativa == Justificativa) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.foto, foto) || other.foto == foto));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    palavra,
    categorias,
    status,
    Justificativa,
    url,
    video,
    foto,
  );

  /// Create a copy of AnalisePalavraRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalisePalavraRequestModelImplCopyWith<_$AnalisePalavraRequestModelImpl>
  get copyWith => __$$AnalisePalavraRequestModelImplCopyWithImpl<
    _$AnalisePalavraRequestModelImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalisePalavraRequestModelImplToJson(this);
  }
}

abstract class _AnalisePalavraRequestModel
    implements AnalisePalavraRequestModel {
  const factory _AnalisePalavraRequestModel({
    required final String palavra,
    required final Categorias categorias,
    required final Status status,
    required final String Justificativa,
    final String? url,
    final String? video,
    final String? foto,
  }) = _$AnalisePalavraRequestModelImpl;

  factory _AnalisePalavraRequestModel.fromJson(Map<String, dynamic> json) =
      _$AnalisePalavraRequestModelImpl.fromJson;

  @override
  String get palavra;
  @override
  Categorias get categorias;
  @override
  Status get status;
  @override
  String get Justificativa;
  @override
  String? get url;
  @override
  String? get video;
  @override
  String? get foto;

  /// Create a copy of AnalisePalavraRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalisePalavraRequestModelImplCopyWith<_$AnalisePalavraRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CursoRequestModel _$CursoRequestModelFromJson(Map<String, dynamic> json) {
  return _CursoRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CursoRequestModel {
  String get nome => throw _privateConstructorUsedError;

  /// Serializes this CursoRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CursoRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CursoRequestModelCopyWith<CursoRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CursoRequestModelCopyWith<$Res> {
  factory $CursoRequestModelCopyWith(
    CursoRequestModel value,
    $Res Function(CursoRequestModel) then,
  ) = _$CursoRequestModelCopyWithImpl<$Res, CursoRequestModel>;
  @useResult
  $Res call({String nome});
}

/// @nodoc
class _$CursoRequestModelCopyWithImpl<$Res, $Val extends CursoRequestModel>
    implements $CursoRequestModelCopyWith<$Res> {
  _$CursoRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CursoRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? nome = null}) {
    return _then(
      _value.copyWith(
            nome:
                null == nome
                    ? _value.nome
                    : nome // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CursoRequestModelImplCopyWith<$Res>
    implements $CursoRequestModelCopyWith<$Res> {
  factory _$$CursoRequestModelImplCopyWith(
    _$CursoRequestModelImpl value,
    $Res Function(_$CursoRequestModelImpl) then,
  ) = __$$CursoRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nome});
}

/// @nodoc
class __$$CursoRequestModelImplCopyWithImpl<$Res>
    extends _$CursoRequestModelCopyWithImpl<$Res, _$CursoRequestModelImpl>
    implements _$$CursoRequestModelImplCopyWith<$Res> {
  __$$CursoRequestModelImplCopyWithImpl(
    _$CursoRequestModelImpl _value,
    $Res Function(_$CursoRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CursoRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? nome = null}) {
    return _then(
      _$CursoRequestModelImpl(
        nome:
            null == nome
                ? _value.nome
                : nome // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CursoRequestModelImpl implements _CursoRequestModel {
  const _$CursoRequestModelImpl({required this.nome});

  factory _$CursoRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CursoRequestModelImplFromJson(json);

  @override
  final String nome;

  @override
  String toString() {
    return 'CursoRequestModel(nome: $nome)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CursoRequestModelImpl &&
            (identical(other.nome, nome) || other.nome == nome));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nome);

  /// Create a copy of CursoRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CursoRequestModelImplCopyWith<_$CursoRequestModelImpl> get copyWith =>
      __$$CursoRequestModelImplCopyWithImpl<_$CursoRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CursoRequestModelImplToJson(this);
  }
}

abstract class _CursoRequestModel implements CursoRequestModel {
  const factory _CursoRequestModel({required final String nome}) =
      _$CursoRequestModelImpl;

  factory _CursoRequestModel.fromJson(Map<String, dynamic> json) =
      _$CursoRequestModelImpl.fromJson;

  @override
  String get nome;

  /// Create a copy of CursoRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CursoRequestModelImplCopyWith<_$CursoRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ConfigAcblRequestModel _$ConfigAcblRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _ConfigAcblRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ConfigAcblRequestModel {
  String? get audicao => throw _privateConstructorUsedError;
  TemaCSS get tema => throw _privateConstructorUsedError;
  String? get zoom => throw _privateConstructorUsedError;

  /// Serializes this ConfigAcblRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConfigAcblRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfigAcblRequestModelCopyWith<ConfigAcblRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigAcblRequestModelCopyWith<$Res> {
  factory $ConfigAcblRequestModelCopyWith(
    ConfigAcblRequestModel value,
    $Res Function(ConfigAcblRequestModel) then,
  ) = _$ConfigAcblRequestModelCopyWithImpl<$Res, ConfigAcblRequestModel>;
  @useResult
  $Res call({String? audicao, TemaCSS tema, String? zoom});
}

/// @nodoc
class _$ConfigAcblRequestModelCopyWithImpl<
  $Res,
  $Val extends ConfigAcblRequestModel
>
    implements $ConfigAcblRequestModelCopyWith<$Res> {
  _$ConfigAcblRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConfigAcblRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audicao = freezed,
    Object? tema = null,
    Object? zoom = freezed,
  }) {
    return _then(
      _value.copyWith(
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
abstract class _$$ConfigAcblRequestModelImplCopyWith<$Res>
    implements $ConfigAcblRequestModelCopyWith<$Res> {
  factory _$$ConfigAcblRequestModelImplCopyWith(
    _$ConfigAcblRequestModelImpl value,
    $Res Function(_$ConfigAcblRequestModelImpl) then,
  ) = __$$ConfigAcblRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? audicao, TemaCSS tema, String? zoom});
}

/// @nodoc
class __$$ConfigAcblRequestModelImplCopyWithImpl<$Res>
    extends
        _$ConfigAcblRequestModelCopyWithImpl<$Res, _$ConfigAcblRequestModelImpl>
    implements _$$ConfigAcblRequestModelImplCopyWith<$Res> {
  __$$ConfigAcblRequestModelImplCopyWithImpl(
    _$ConfigAcblRequestModelImpl _value,
    $Res Function(_$ConfigAcblRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConfigAcblRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audicao = freezed,
    Object? tema = null,
    Object? zoom = freezed,
  }) {
    return _then(
      _$ConfigAcblRequestModelImpl(
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
class _$ConfigAcblRequestModelImpl implements _ConfigAcblRequestModel {
  const _$ConfigAcblRequestModelImpl({
    this.audicao,
    required this.tema,
    this.zoom,
  });

  factory _$ConfigAcblRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfigAcblRequestModelImplFromJson(json);

  @override
  final String? audicao;
  @override
  final TemaCSS tema;
  @override
  final String? zoom;

  @override
  String toString() {
    return 'ConfigAcblRequestModel(audicao: $audicao, tema: $tema, zoom: $zoom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigAcblRequestModelImpl &&
            (identical(other.audicao, audicao) || other.audicao == audicao) &&
            (identical(other.tema, tema) || other.tema == tema) &&
            (identical(other.zoom, zoom) || other.zoom == zoom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, audicao, tema, zoom);

  /// Create a copy of ConfigAcblRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigAcblRequestModelImplCopyWith<_$ConfigAcblRequestModelImpl>
  get copyWith =>
      __$$ConfigAcblRequestModelImplCopyWithImpl<_$ConfigAcblRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfigAcblRequestModelImplToJson(this);
  }
}

abstract class _ConfigAcblRequestModel implements ConfigAcblRequestModel {
  const factory _ConfigAcblRequestModel({
    final String? audicao,
    required final TemaCSS tema,
    final String? zoom,
  }) = _$ConfigAcblRequestModelImpl;

  factory _ConfigAcblRequestModel.fromJson(Map<String, dynamic> json) =
      _$ConfigAcblRequestModelImpl.fromJson;

  @override
  String? get audicao;
  @override
  TemaCSS get tema;
  @override
  String? get zoom;

  /// Create a copy of ConfigAcblRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfigAcblRequestModelImplCopyWith<_$ConfigAcblRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

MessageRequestModel _$MessageRequestModelFromJson(Map<String, dynamic> json) {
  return _MessageRequestModel.fromJson(json);
}

/// @nodoc
mixin _$MessageRequestModel {
  String get IdUserEnvia => throw _privateConstructorUsedError;
  String get IdUserRecebe => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  /// Serializes this MessageRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageRequestModelCopyWith<MessageRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageRequestModelCopyWith<$Res> {
  factory $MessageRequestModelCopyWith(
    MessageRequestModel value,
    $Res Function(MessageRequestModel) then,
  ) = _$MessageRequestModelCopyWithImpl<$Res, MessageRequestModel>;
  @useResult
  $Res call({String IdUserEnvia, String IdUserRecebe, String text});
}

/// @nodoc
class _$MessageRequestModelCopyWithImpl<$Res, $Val extends MessageRequestModel>
    implements $MessageRequestModelCopyWith<$Res> {
  _$MessageRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? IdUserEnvia = null,
    Object? IdUserRecebe = null,
    Object? text = null,
  }) {
    return _then(
      _value.copyWith(
            IdUserEnvia:
                null == IdUserEnvia
                    ? _value.IdUserEnvia
                    : IdUserEnvia // ignore: cast_nullable_to_non_nullable
                        as String,
            IdUserRecebe:
                null == IdUserRecebe
                    ? _value.IdUserRecebe
                    : IdUserRecebe // ignore: cast_nullable_to_non_nullable
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
abstract class _$$MessageRequestModelImplCopyWith<$Res>
    implements $MessageRequestModelCopyWith<$Res> {
  factory _$$MessageRequestModelImplCopyWith(
    _$MessageRequestModelImpl value,
    $Res Function(_$MessageRequestModelImpl) then,
  ) = __$$MessageRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String IdUserEnvia, String IdUserRecebe, String text});
}

/// @nodoc
class __$$MessageRequestModelImplCopyWithImpl<$Res>
    extends _$MessageRequestModelCopyWithImpl<$Res, _$MessageRequestModelImpl>
    implements _$$MessageRequestModelImplCopyWith<$Res> {
  __$$MessageRequestModelImplCopyWithImpl(
    _$MessageRequestModelImpl _value,
    $Res Function(_$MessageRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? IdUserEnvia = null,
    Object? IdUserRecebe = null,
    Object? text = null,
  }) {
    return _then(
      _$MessageRequestModelImpl(
        IdUserEnvia:
            null == IdUserEnvia
                ? _value.IdUserEnvia
                : IdUserEnvia // ignore: cast_nullable_to_non_nullable
                    as String,
        IdUserRecebe:
            null == IdUserRecebe
                ? _value.IdUserRecebe
                : IdUserRecebe // ignore: cast_nullable_to_non_nullable
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
class _$MessageRequestModelImpl implements _MessageRequestModel {
  const _$MessageRequestModelImpl({
    required this.IdUserEnvia,
    required this.IdUserRecebe,
    required this.text,
  });

  factory _$MessageRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageRequestModelImplFromJson(json);

  @override
  final String IdUserEnvia;
  @override
  final String IdUserRecebe;
  @override
  final String text;

  @override
  String toString() {
    return 'MessageRequestModel(IdUserEnvia: $IdUserEnvia, IdUserRecebe: $IdUserRecebe, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageRequestModelImpl &&
            (identical(other.IdUserEnvia, IdUserEnvia) ||
                other.IdUserEnvia == IdUserEnvia) &&
            (identical(other.IdUserRecebe, IdUserRecebe) ||
                other.IdUserRecebe == IdUserRecebe) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, IdUserEnvia, IdUserRecebe, text);

  /// Create a copy of MessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageRequestModelImplCopyWith<_$MessageRequestModelImpl> get copyWith =>
      __$$MessageRequestModelImplCopyWithImpl<_$MessageRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageRequestModelImplToJson(this);
  }
}

abstract class _MessageRequestModel implements MessageRequestModel {
  const factory _MessageRequestModel({
    required final String IdUserEnvia,
    required final String IdUserRecebe,
    required final String text,
  }) = _$MessageRequestModelImpl;

  factory _MessageRequestModel.fromJson(Map<String, dynamic> json) =
      _$MessageRequestModelImpl.fromJson;

  @override
  String get IdUserEnvia;
  @override
  String get IdUserRecebe;
  @override
  String get text;

  /// Create a copy of MessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageRequestModelImplCopyWith<_$MessageRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
