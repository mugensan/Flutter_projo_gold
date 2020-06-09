import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterstaggeredgridontap/domain/core/error.dart';
import 'package:flutterstaggeredgridontap/domain/core/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

//creating a unique value object
class UniqueId extends ValueObject<String> {
  @override
  // TODO: implement value
  final Either<ValueFailure<String>, String> value;

  factory UniqueId(){
    return UniqueId._(
      //checking if the String passed is unique
      right(Uuid().v1()),//Uuid -> package (creates a unique id)
    );
}

  factory UniqueId.fromUniqueString(String uniqueId) {
    assert(uniqueId != null);
    return UniqueId._(
      right(uniqueId),
    );
  }


const UniqueId._(this.value);
}