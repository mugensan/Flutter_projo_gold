import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutterstaggeredgridontap/domain/core/value_objects.dart';
part 'user.freezed.dart';


///CREATING AN ENTITY OF USER INSTEAD OF A USER Object
///UNIQUE ID -> ASSIGN A FIRESTORE DOCUMENT UNIQUE ID
///CAN BE ASSIGNED FOR SQLITE, HIVE OBJECTS (STORING USER DATA) !BOUND TO ANY OBJECT

@freezed
abstract class User with _$User {
  const factory User({
    @required UniqueId id,
    //    //creating a unique id value object in ./core
  }) = _User;
}

