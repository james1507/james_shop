import 'package:james_shop/shared/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  UserEntity? user;
  String? message;

  LoginResponse({
    this.user,
    this.message,
  });

  factory LoginResponse.fromJson(json) => _$LoginResponseFromJson(json);

  toJson() => _$LoginResponseToJson(this);

  static List<LoginResponse> fromJsonList(List? json) {
    return json?.map((e) => LoginResponse.fromJson(e)).toList() ?? [];
  }
}