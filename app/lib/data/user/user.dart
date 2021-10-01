import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String uuid;
  final String firstName;
  final String lastName;
  final String email;

  User({
    required this.uuid,
    required this.firstName,
    required this.lastName,
    required this.email
  });
}