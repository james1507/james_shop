import 'package:json_annotation/json_annotation.dart';

part 'login_body.g.dart';

@JsonSerializable()
class LoginBody {
  String? email;
  String? password;

  LoginBody({
    this.email,
    this.password,
  });

  factory LoginBody.fromJson(json) => _$LoginBodyFromJson(json);

  toJson() => _$LoginBodyToJson(this);

  static List<LoginBody> fromJsonList(List? json) {
    return json?.map((e) => LoginBody.fromJson(e)).toList() ?? [];
  }
}