// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_social_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginSocialBody _$LoginSocialBodyFromJson(Map<String, dynamic> json) =>
    LoginSocialBody(
      email: json['email'] as String?,
      socialAuthId: json['socialAuthId'] as String?,
      socialToken: json['socialToken'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      socialType: $enumDecodeNullable(_$SocialEnumEnumMap, json['socialType']),
    );

Map<String, dynamic> _$LoginSocialBodyToJson(LoginSocialBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'socialAuthId': instance.socialAuthId,
      'socialToken': instance.socialToken,
      'socialType': _$SocialEnumEnumMap[instance.socialType],
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

const _$SocialEnumEnumMap = {
  SocialEnum.facebook: 'facebook',
  SocialEnum.google: 'google',
};
