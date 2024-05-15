import 'package:james_shop/shared/domain/enum/social_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_body.g.dart';

@JsonSerializable()
class AuthBody {
  String? email;
  String? password;
  String? socialAuthId;
  String? socialToken;
  SocialEnum? socialType;
  String? firstName;
  String? lastName;
  String? role;

  AuthBody({
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.socialAuthId,
    this.socialToken,
    this.socialType,
    this.role,
  });

  factory AuthBody.fromJson(json) => _$AuthBodyFromJson(json);

  Map<String, dynamic> toJson() {
    final json = _$AuthBodyToJson(this);
    json.removeWhere((key, value) => value == null);
    return json;
  }

  static List<AuthBody> fromJsonList(List? json) {
    return json?.map((e) => AuthBody.fromJson(e)).toList() ?? [];
  }

  AuthBody copyWith({
    String? email,
    String? password,
    String? socialAuthId,
    String? socialToken,
    SocialEnum? socialType,
    String? firstName,
    String? lastName,
    String? role,
  }) {
    return AuthBody(
      email: email ?? this.email,
      password: password ?? this.password,
      socialAuthId: socialAuthId ?? this.socialAuthId,
      socialToken: socialToken ?? this.socialToken,
      socialType: socialType ?? this.socialType,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      role: role ?? this.role,
    );
  }
}
