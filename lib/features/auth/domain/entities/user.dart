import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String role; // 'dispatcher' or 'driver'
  final String? phone;

  const User({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    this.phone,
  });

  bool get isDispatcher => role == 'dispatcher';
  bool get isDriver => role == 'driver';

  @override
  List<Object?> get props => [id, email, name, role, phone];
}

