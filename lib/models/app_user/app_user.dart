import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

enum UserRole {
  tenant,
  owner
}

@freezed
class AppUser with _$AppUser {
  factory AppUser({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'username') required String userName,
    @JsonKey(name: 'email') required String email,
    @Default(UserRole.tenant) @JsonKey(name: 'role') UserRole? role,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

  factory AppUser.fromFirestore(DocumentSnapshot<Map<String, Object?>> document) {
    final data = document.data();
    data!['id'] = document.id;

    return AppUser.fromJson(data);
  }
}
