import 'package:james_shop/shared/domain/enum/social_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_social_body.g.dart';

@JsonSerializable()
class LoginSocialBody {
  String? email;
  String? socialAuthId;
  String? socialToken;
  SocialEnum? socialType;
  String? firstName;
  String? lastName;

  LoginSocialBody({
    this.email,
    this.socialAuthId,
    this.socialToken,
    this.firstName,
    this.lastName,
    this.socialType,
  });

  factory LoginSocialBody.fromJson(json) => _$LoginSocialBodyFromJson(json);

  toJson() => _$LoginSocialBodyToJson(this);

  static List<LoginSocialBody> fromJsonList(List? json) {
    return json?.map((e) => LoginSocialBody.fromJson(e)).toList() ?? [];
  }
}
