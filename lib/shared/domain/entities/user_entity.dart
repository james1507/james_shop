import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserEntity {
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? role;
  DateTime? createdDate;
  String? token;
  String? refreshToken;
  bool? rememberMe;

  UserEntity({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.role,
    this.createdDate,
    this.token,
    this.refreshToken,
    this.rememberMe,
  });

  factory UserEntity.fromJson(json) => _$UserEntityFromJson(json);

  toJson() => _$UserEntityToJson(this);

  static List<UserEntity> fromJsonList(List? json) {
    return json?.map((e) => UserEntity.fromJson(e)).toList() ?? [];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'role': role,
      'createdDate': createdDate,
      'token': token,
      'refreshToken': refreshToken,
      'rememberMe': rememberMe,
    };
  }

  UserEntity copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? role,
    DateTime? createdDate,
    String? token,
    String? refreshToken,
    bool? rememberMe,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      role: role ?? this.role,
      createdDate: createdDate ?? this.createdDate,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }
}
