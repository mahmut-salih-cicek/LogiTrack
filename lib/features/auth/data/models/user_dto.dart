import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/user.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  final String id;
  final String email;
  final String name;
  final String role;
  final String? phone;

  UserDto({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    this.phone,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  User toEntity() {
    return User(
      id: id,
      email: email,
      name: name,
      role: role,
      phone: phone,
    );
  }
}

