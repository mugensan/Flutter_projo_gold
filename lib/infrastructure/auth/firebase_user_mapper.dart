
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterstaggeredgridontap/domain/auth/user.dart';
import 'package:flutterstaggeredgridontap/domain/core/value_objects.dart';

///creating an extension

extension FirebaseUserDomainX on FirebaseUser{
  User toDomain(){
    return User(
        id:UniqueId.fromUniqueString(uid),
    );
  }
}