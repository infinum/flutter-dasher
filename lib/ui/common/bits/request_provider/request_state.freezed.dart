// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RequestState<Value, Error extends Exception> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Value? resultMaybe) loading,
    required TResult Function(Value result) success,
    required TResult Function(Error error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Value? resultMaybe)? loading,
    TResult? Function(Value result)? success,
    TResult? Function(Error error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Value? resultMaybe)? loading,
    TResult Function(Value result)? success,
    TResult Function(Error error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestStateInitial<Value, Error> value) initial,
    required TResult Function(RequestStateLoading<Value, Error> value) loading,
    required TResult Function(RequestStateSuccess<Value, Error> value) success,
    required TResult Function(RequestStateFailure<Value, Error> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestStateInitial<Value, Error> value)? initial,
    TResult? Function(RequestStateLoading<Value, Error> value)? loading,
    TResult? Function(RequestStateSuccess<Value, Error> value)? success,
    TResult? Function(RequestStateFailure<Value, Error> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestStateInitial<Value, Error> value)? initial,
    TResult Function(RequestStateLoading<Value, Error> value)? loading,
    TResult Function(RequestStateSuccess<Value, Error> value)? success,
    TResult Function(RequestStateFailure<Value, Error> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestStateCopyWith<Value, Error extends Exception, $Res> {
  factory $RequestStateCopyWith(RequestState<Value, Error> value,
          $Res Function(RequestState<Value, Error>) then) =
      _$RequestStateCopyWithImpl<Value, Error, $Res,
          RequestState<Value, Error>>;
}

/// @nodoc
class _$RequestStateCopyWithImpl<Value, Error extends Exception, $Res,
        $Val extends RequestState<Value, Error>>
    implements $RequestStateCopyWith<Value, Error, $Res> {
  _$RequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RequestStateInitialImplCopyWith<Value,
    Error extends Exception, $Res> {
  factory _$$RequestStateInitialImplCopyWith(
          _$RequestStateInitialImpl<Value, Error> value,
          $Res Function(_$RequestStateInitialImpl<Value, Error>) then) =
      __$$RequestStateInitialImplCopyWithImpl<Value, Error, $Res>;
}

/// @nodoc
class __$$RequestStateInitialImplCopyWithImpl<Value, Error extends Exception,
        $Res>
    extends _$RequestStateCopyWithImpl<Value, Error, $Res,
        _$RequestStateInitialImpl<Value, Error>>
    implements _$$RequestStateInitialImplCopyWith<Value, Error, $Res> {
  __$$RequestStateInitialImplCopyWithImpl(
      _$RequestStateInitialImpl<Value, Error> _value,
      $Res Function(_$RequestStateInitialImpl<Value, Error>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequestStateInitialImpl<Value, Error extends Exception>
    implements RequestStateInitial<Value, Error> {
  const _$RequestStateInitialImpl();

  @override
  String toString() {
    return 'RequestState<$Value, $Error>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestStateInitialImpl<Value, Error>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Value? resultMaybe) loading,
    required TResult Function(Value result) success,
    required TResult Function(Error error) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Value? resultMaybe)? loading,
    TResult? Function(Value result)? success,
    TResult? Function(Error error)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Value? resultMaybe)? loading,
    TResult Function(Value result)? success,
    TResult Function(Error error)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestStateInitial<Value, Error> value) initial,
    required TResult Function(RequestStateLoading<Value, Error> value) loading,
    required TResult Function(RequestStateSuccess<Value, Error> value) success,
    required TResult Function(RequestStateFailure<Value, Error> value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestStateInitial<Value, Error> value)? initial,
    TResult? Function(RequestStateLoading<Value, Error> value)? loading,
    TResult? Function(RequestStateSuccess<Value, Error> value)? success,
    TResult? Function(RequestStateFailure<Value, Error> value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestStateInitial<Value, Error> value)? initial,
    TResult Function(RequestStateLoading<Value, Error> value)? loading,
    TResult Function(RequestStateSuccess<Value, Error> value)? success,
    TResult Function(RequestStateFailure<Value, Error> value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RequestStateInitial<Value, Error extends Exception>
    implements RequestState<Value, Error> {
  const factory RequestStateInitial() = _$RequestStateInitialImpl<Value, Error>;
}

/// @nodoc
abstract class _$$RequestStateLoadingImplCopyWith<Value,
    Error extends Exception, $Res> {
  factory _$$RequestStateLoadingImplCopyWith(
          _$RequestStateLoadingImpl<Value, Error> value,
          $Res Function(_$RequestStateLoadingImpl<Value, Error>) then) =
      __$$RequestStateLoadingImplCopyWithImpl<Value, Error, $Res>;
  @useResult
  $Res call({Value? resultMaybe});
}

/// @nodoc
class __$$RequestStateLoadingImplCopyWithImpl<Value, Error extends Exception,
        $Res>
    extends _$RequestStateCopyWithImpl<Value, Error, $Res,
        _$RequestStateLoadingImpl<Value, Error>>
    implements _$$RequestStateLoadingImplCopyWith<Value, Error, $Res> {
  __$$RequestStateLoadingImplCopyWithImpl(
      _$RequestStateLoadingImpl<Value, Error> _value,
      $Res Function(_$RequestStateLoadingImpl<Value, Error>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resultMaybe = freezed,
  }) {
    return _then(_$RequestStateLoadingImpl<Value, Error>(
      resultMaybe: freezed == resultMaybe
          ? _value.resultMaybe
          : resultMaybe // ignore: cast_nullable_to_non_nullable
              as Value?,
    ));
  }
}

/// @nodoc

class _$RequestStateLoadingImpl<Value, Error extends Exception>
    implements RequestStateLoading<Value, Error> {
  const _$RequestStateLoadingImpl({this.resultMaybe});

  @override
  final Value? resultMaybe;

  @override
  String toString() {
    return 'RequestState<$Value, $Error>.loading(resultMaybe: $resultMaybe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestStateLoadingImpl<Value, Error> &&
            const DeepCollectionEquality()
                .equals(other.resultMaybe, resultMaybe));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(resultMaybe));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestStateLoadingImplCopyWith<Value, Error,
          _$RequestStateLoadingImpl<Value, Error>>
      get copyWith => __$$RequestStateLoadingImplCopyWithImpl<Value, Error,
          _$RequestStateLoadingImpl<Value, Error>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Value? resultMaybe) loading,
    required TResult Function(Value result) success,
    required TResult Function(Error error) failure,
  }) {
    return loading(resultMaybe);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Value? resultMaybe)? loading,
    TResult? Function(Value result)? success,
    TResult? Function(Error error)? failure,
  }) {
    return loading?.call(resultMaybe);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Value? resultMaybe)? loading,
    TResult Function(Value result)? success,
    TResult Function(Error error)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(resultMaybe);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestStateInitial<Value, Error> value) initial,
    required TResult Function(RequestStateLoading<Value, Error> value) loading,
    required TResult Function(RequestStateSuccess<Value, Error> value) success,
    required TResult Function(RequestStateFailure<Value, Error> value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestStateInitial<Value, Error> value)? initial,
    TResult? Function(RequestStateLoading<Value, Error> value)? loading,
    TResult? Function(RequestStateSuccess<Value, Error> value)? success,
    TResult? Function(RequestStateFailure<Value, Error> value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestStateInitial<Value, Error> value)? initial,
    TResult Function(RequestStateLoading<Value, Error> value)? loading,
    TResult Function(RequestStateSuccess<Value, Error> value)? success,
    TResult Function(RequestStateFailure<Value, Error> value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RequestStateLoading<Value, Error extends Exception>
    implements RequestState<Value, Error> {
  const factory RequestStateLoading({final Value? resultMaybe}) =
      _$RequestStateLoadingImpl<Value, Error>;

  Value? get resultMaybe;
  @JsonKey(ignore: true)
  _$$RequestStateLoadingImplCopyWith<Value, Error,
          _$RequestStateLoadingImpl<Value, Error>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestStateSuccessImplCopyWith<Value,
    Error extends Exception, $Res> {
  factory _$$RequestStateSuccessImplCopyWith(
          _$RequestStateSuccessImpl<Value, Error> value,
          $Res Function(_$RequestStateSuccessImpl<Value, Error>) then) =
      __$$RequestStateSuccessImplCopyWithImpl<Value, Error, $Res>;
  @useResult
  $Res call({Value result});
}

/// @nodoc
class __$$RequestStateSuccessImplCopyWithImpl<Value, Error extends Exception,
        $Res>
    extends _$RequestStateCopyWithImpl<Value, Error, $Res,
        _$RequestStateSuccessImpl<Value, Error>>
    implements _$$RequestStateSuccessImplCopyWith<Value, Error, $Res> {
  __$$RequestStateSuccessImplCopyWithImpl(
      _$RequestStateSuccessImpl<Value, Error> _value,
      $Res Function(_$RequestStateSuccessImpl<Value, Error>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_$RequestStateSuccessImpl<Value, Error>(
      freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Value,
    ));
  }
}

/// @nodoc

class _$RequestStateSuccessImpl<Value, Error extends Exception>
    implements RequestStateSuccess<Value, Error> {
  const _$RequestStateSuccessImpl(this.result);

  @override
  final Value result;

  @override
  String toString() {
    return 'RequestState<$Value, $Error>.success(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestStateSuccessImpl<Value, Error> &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestStateSuccessImplCopyWith<Value, Error,
          _$RequestStateSuccessImpl<Value, Error>>
      get copyWith => __$$RequestStateSuccessImplCopyWithImpl<Value, Error,
          _$RequestStateSuccessImpl<Value, Error>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Value? resultMaybe) loading,
    required TResult Function(Value result) success,
    required TResult Function(Error error) failure,
  }) {
    return success(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Value? resultMaybe)? loading,
    TResult? Function(Value result)? success,
    TResult? Function(Error error)? failure,
  }) {
    return success?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Value? resultMaybe)? loading,
    TResult Function(Value result)? success,
    TResult Function(Error error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestStateInitial<Value, Error> value) initial,
    required TResult Function(RequestStateLoading<Value, Error> value) loading,
    required TResult Function(RequestStateSuccess<Value, Error> value) success,
    required TResult Function(RequestStateFailure<Value, Error> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestStateInitial<Value, Error> value)? initial,
    TResult? Function(RequestStateLoading<Value, Error> value)? loading,
    TResult? Function(RequestStateSuccess<Value, Error> value)? success,
    TResult? Function(RequestStateFailure<Value, Error> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestStateInitial<Value, Error> value)? initial,
    TResult Function(RequestStateLoading<Value, Error> value)? loading,
    TResult Function(RequestStateSuccess<Value, Error> value)? success,
    TResult Function(RequestStateFailure<Value, Error> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class RequestStateSuccess<Value, Error extends Exception>
    implements RequestState<Value, Error> {
  const factory RequestStateSuccess(final Value result) =
      _$RequestStateSuccessImpl<Value, Error>;

  Value get result;
  @JsonKey(ignore: true)
  _$$RequestStateSuccessImplCopyWith<Value, Error,
          _$RequestStateSuccessImpl<Value, Error>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestStateFailureImplCopyWith<Value,
    Error extends Exception, $Res> {
  factory _$$RequestStateFailureImplCopyWith(
          _$RequestStateFailureImpl<Value, Error> value,
          $Res Function(_$RequestStateFailureImpl<Value, Error>) then) =
      __$$RequestStateFailureImplCopyWithImpl<Value, Error, $Res>;
  @useResult
  $Res call({Error error});
}

/// @nodoc
class __$$RequestStateFailureImplCopyWithImpl<Value, Error extends Exception,
        $Res>
    extends _$RequestStateCopyWithImpl<Value, Error, $Res,
        _$RequestStateFailureImpl<Value, Error>>
    implements _$$RequestStateFailureImplCopyWith<Value, Error, $Res> {
  __$$RequestStateFailureImplCopyWithImpl(
      _$RequestStateFailureImpl<Value, Error> _value,
      $Res Function(_$RequestStateFailureImpl<Value, Error>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$RequestStateFailureImpl<Value, Error>(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error,
    ));
  }
}

/// @nodoc

class _$RequestStateFailureImpl<Value, Error extends Exception>
    implements RequestStateFailure<Value, Error> {
  const _$RequestStateFailureImpl(this.error);

  @override
  final Error error;

  @override
  String toString() {
    return 'RequestState<$Value, $Error>.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestStateFailureImpl<Value, Error> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestStateFailureImplCopyWith<Value, Error,
          _$RequestStateFailureImpl<Value, Error>>
      get copyWith => __$$RequestStateFailureImplCopyWithImpl<Value, Error,
          _$RequestStateFailureImpl<Value, Error>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Value? resultMaybe) loading,
    required TResult Function(Value result) success,
    required TResult Function(Error error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Value? resultMaybe)? loading,
    TResult? Function(Value result)? success,
    TResult? Function(Error error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Value? resultMaybe)? loading,
    TResult Function(Value result)? success,
    TResult Function(Error error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestStateInitial<Value, Error> value) initial,
    required TResult Function(RequestStateLoading<Value, Error> value) loading,
    required TResult Function(RequestStateSuccess<Value, Error> value) success,
    required TResult Function(RequestStateFailure<Value, Error> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestStateInitial<Value, Error> value)? initial,
    TResult? Function(RequestStateLoading<Value, Error> value)? loading,
    TResult? Function(RequestStateSuccess<Value, Error> value)? success,
    TResult? Function(RequestStateFailure<Value, Error> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestStateInitial<Value, Error> value)? initial,
    TResult Function(RequestStateLoading<Value, Error> value)? loading,
    TResult Function(RequestStateSuccess<Value, Error> value)? success,
    TResult Function(RequestStateFailure<Value, Error> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class RequestStateFailure<Value, Error extends Exception>
    implements RequestState<Value, Error> {
  const factory RequestStateFailure(final Error error) =
      _$RequestStateFailureImpl<Value, Error>;

  Error get error;
  @JsonKey(ignore: true)
  _$$RequestStateFailureImplCopyWith<Value, Error,
          _$RequestStateFailureImpl<Value, Error>>
      get copyWith => throw _privateConstructorUsedError;
}
