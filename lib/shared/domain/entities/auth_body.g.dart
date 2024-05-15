// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthBody _$AuthBodyFromJson(Map<String, dynamic> json) => AuthBody(
      email: json['email'] as String?,
      password: json['password'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      socialAuthId: json['socialAuthId'] as String?,
      socialToken: json['socialToken'] as String?,
      socialType: $enumDecodeNullable(_$SocialEnumEnumMap, json['socialType']),
      role: json['role'] as String?,
    );

Map<String, dynamic> _$AuthBodyToJson(AuthBody instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'socialAuthId': instance.socialAuthId,
      'socialToken': instance.socialToken,
      'socialType': _$SocialEnumEnumMap[instance.socialType],
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'role': instance.role,
    };

const _$SocialEnumEnumMap = {
  SocialEnum.facebook: 'facebook',
  SocialEnum.google: 'google',
};
