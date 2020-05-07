import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterstaggeredgridontap/domain/core/errors.dart';
import 'package:flutterstaggeredgridontap/domain/core/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash(){
    return value.fold((f)=> throw UnexpectedValueError(f),
            id);//identity (return unchanged)(r)=>r
  }

  //CHECKING IF VALUES ARE EQUAL
  @override
  bool operator ==(Object object) {
    if (identical(this, object)) return true;

    return object is ValueObject<T> && object.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  //THIS WILL ACCEPT ANY SORT OF VALUE TO EMAIL ADDRESS
  @override
  String toString() => 'Value($value)';
}
