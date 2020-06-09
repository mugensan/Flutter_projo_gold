
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterstaggeredgridontap/domain/auth/user.dart';
import 'package:flutterstaggeredgridontap/domain/core/value_objects.dart';

///creating an extension function

extension FirebaseUserDomainX on FirebaseUser{
  User toDomain(){
    return User(
        id:UniqueId.fromUniqueString(uid),//uid coming from this. obhect
    );
  }
}