import '../models/user_dto.dart';
import '../../domain/entities/user.dart';

class UserMapper {
  static User toEntity(UserDto dto) {
    return dto.toEntity();
  }

  static UserDto toDto(User entity) {
    return UserDto(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      role: entity.role,
      phone: entity.phone,
    );
  }
}

