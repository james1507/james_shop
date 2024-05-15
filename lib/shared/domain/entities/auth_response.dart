import 'package:james_shop/shared/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  UserEntity? user;
  String? message;

  AuthResponse({
    this.user,
    this.message,
  });

  factory AuthResponse.fromJson(json) => _$AuthResponseFromJson(json);

  toJson() => _$AuthResponseToJson(this);

  static List<AuthResponse> fromJsonList(List? json) {
    return json?.map((e) => AuthResponse.fromJson(e)).toList() ?? [];
  }
}