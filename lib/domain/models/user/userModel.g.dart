// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      nome: json['nome'] as String,
      matricula: json['matricula'] as String,
      login: json['login'] as String,
      senha: json['senha'] as String,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'matricula': instance.matricula,
      'login': instance.login,
      'senha': instance.senha,
    };
