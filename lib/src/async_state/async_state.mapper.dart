// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'async_state.dart';

class LoadingMapper extends ClassMapperBase<Loading> {
  LoadingMapper._();

  static LoadingMapper? _instance;
  static LoadingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoadingMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Loading';
  @override
  Function get typeFactory => <T>(f) => f<Loading<T>>();

  static String _$message(Loading v) => v.message;
  static const Field<Loading, String> _f$message =
      Field('message', _$message, opt: true, def: "");
  static String _$code(Loading v) => v.code;
  static const Field<Loading, String> _f$code =
      Field('code', _$code, opt: true, def: "");
  static dynamic _$data(Loading v) => v.data;
  static dynamic _arg$data<T>(f) => f<T>();
  static const Field<Loading, dynamic> _f$data =
      Field('data', _$data, opt: true, arg: _arg$data);
  static List<dynamic>? _$listData(Loading v) => v.listData;
  static dynamic _arg$listData<T>(f) => f<List<T>>();
  static const Field<Loading, List<dynamic>> _f$listData =
      Field('listData', _$listData, opt: true, arg: _arg$listData);
  static int _$listTotal(Loading v) => v.listTotal;
  static const Field<Loading, int> _f$listTotal =
      Field('listTotal', _$listTotal, opt: true, def: 0);

  @override
  final MappableFields<Loading> fields = const {
    #message: _f$message,
    #code: _f$code,
    #data: _f$data,
    #listData: _f$listData,
    #listTotal: _f$listTotal,
  };

  static Loading<T> _instantiate<T>(DecodingData data) {
    return Loading(
        message: data.dec(_f$message),
        code: data.dec(_f$code),
        data: data.dec(_f$data),
        listData: data.dec(_f$listData),
        listTotal: data.dec(_f$listTotal));
  }

  @override
  final Function instantiate = _instantiate;

  static Loading<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Loading<T>>(map);
  }

  static Loading<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<Loading<T>>(json);
  }
}

mixin LoadingMappable<T> {
  String toJson() {
    return LoadingMapper.ensureInitialized()
        .encodeJson<Loading<T>>(this as Loading<T>);
  }

  Map<String, dynamic> toMap() {
    return LoadingMapper.ensureInitialized()
        .encodeMap<Loading<T>>(this as Loading<T>);
  }

  LoadingCopyWith<Loading<T>, Loading<T>, Loading<T>, T> get copyWith =>
      _LoadingCopyWithImpl<Loading<T>, Loading<T>, T>(
          this as Loading<T>, $identity, $identity);
  @override
  String toString() {
    return LoadingMapper.ensureInitialized().stringifyValue(this as Loading<T>);
  }

  @override
  bool operator ==(Object other) {
    return LoadingMapper.ensureInitialized()
        .equalsValue(this as Loading<T>, other);
  }

  @override
  int get hashCode {
    return LoadingMapper.ensureInitialized().hashValue(this as Loading<T>);
  }
}

extension LoadingValueCopy<$R, $Out, T>
    on ObjectCopyWith<$R, Loading<T>, $Out> {
  LoadingCopyWith<$R, Loading<T>, $Out, T> get $asLoading =>
      $base.as((v, t, t2) => _LoadingCopyWithImpl<$R, $Out, T>(v, t, t2));
}

abstract class LoadingCopyWith<$R, $In extends Loading<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>>? get listData;
  $R call(
      {String? message,
      String? code,
      T? data,
      List<T>? listData,
      int? listTotal});
  LoadingCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LoadingCopyWithImpl<$R, $Out, T>
    extends ClassCopyWithBase<$R, Loading<T>, $Out>
    implements LoadingCopyWith<$R, Loading<T>, $Out, T> {
  _LoadingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Loading> $mapper =
      LoadingMapper.ensureInitialized();
  @override
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>>? get listData =>
      $value.listData != null
          ? ListCopyWith(
              $value.listData!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(listData: v))
          : null;
  @override
  $R call(
          {String? message,
          String? code,
          Object? data = $none,
          Object? listData = $none,
          int? listTotal}) =>
      $apply(FieldCopyWithData({
        if (message != null) #message: message,
        if (code != null) #code: code,
        if (data != $none) #data: data,
        if (listData != $none) #listData: listData,
        if (listTotal != null) #listTotal: listTotal
      }));
  @override
  Loading<T> $make(CopyWithData data) => Loading(
      message: data.get(#message, or: $value.message),
      code: data.get(#code, or: $value.code),
      data: data.get(#data, or: $value.data),
      listData: data.get(#listData, or: $value.listData),
      listTotal: data.get(#listTotal, or: $value.listTotal));

  @override
  LoadingCopyWith<$R2, Loading<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LoadingCopyWithImpl<$R2, $Out2, T>($value, $cast, t);
}

class SuccessMapper extends ClassMapperBase<Success> {
  SuccessMapper._();

  static SuccessMapper? _instance;
  static SuccessMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SuccessMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Success';
  @override
  Function get typeFactory => <T>(f) => f<Success<T>>();

  static String _$message(Success v) => v.message;
  static const Field<Success, String> _f$message =
      Field('message', _$message, opt: true, def: "");
  static String _$code(Success v) => v.code;
  static const Field<Success, String> _f$code =
      Field('code', _$code, opt: true, def: "");
  static dynamic _$data(Success v) => v.data;
  static dynamic _arg$data<T>(f) => f<T>();
  static const Field<Success, dynamic> _f$data =
      Field('data', _$data, opt: true, arg: _arg$data);
  static List<dynamic>? _$listData(Success v) => v.listData;
  static dynamic _arg$listData<T>(f) => f<List<T>>();
  static const Field<Success, List<dynamic>> _f$listData =
      Field('listData', _$listData, opt: true, arg: _arg$listData);
  static int _$listTotal(Success v) => v.listTotal;
  static const Field<Success, int> _f$listTotal =
      Field('listTotal', _$listTotal, opt: true, def: 0);

  @override
  final MappableFields<Success> fields = const {
    #message: _f$message,
    #code: _f$code,
    #data: _f$data,
    #listData: _f$listData,
    #listTotal: _f$listTotal,
  };

  static Success<T> _instantiate<T>(DecodingData data) {
    return Success(
        message: data.dec(_f$message),
        code: data.dec(_f$code),
        data: data.dec(_f$data),
        listData: data.dec(_f$listData),
        listTotal: data.dec(_f$listTotal));
  }

  @override
  final Function instantiate = _instantiate;

  static Success<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Success<T>>(map);
  }

  static Success<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<Success<T>>(json);
  }
}

mixin SuccessMappable<T> {
  String toJson() {
    return SuccessMapper.ensureInitialized()
        .encodeJson<Success<T>>(this as Success<T>);
  }

  Map<String, dynamic> toMap() {
    return SuccessMapper.ensureInitialized()
        .encodeMap<Success<T>>(this as Success<T>);
  }

  SuccessCopyWith<Success<T>, Success<T>, Success<T>, T> get copyWith =>
      _SuccessCopyWithImpl<Success<T>, Success<T>, T>(
          this as Success<T>, $identity, $identity);
  @override
  String toString() {
    return SuccessMapper.ensureInitialized().stringifyValue(this as Success<T>);
  }

  @override
  bool operator ==(Object other) {
    return SuccessMapper.ensureInitialized()
        .equalsValue(this as Success<T>, other);
  }

  @override
  int get hashCode {
    return SuccessMapper.ensureInitialized().hashValue(this as Success<T>);
  }
}

extension SuccessValueCopy<$R, $Out, T>
    on ObjectCopyWith<$R, Success<T>, $Out> {
  SuccessCopyWith<$R, Success<T>, $Out, T> get $asSuccess =>
      $base.as((v, t, t2) => _SuccessCopyWithImpl<$R, $Out, T>(v, t, t2));
}

abstract class SuccessCopyWith<$R, $In extends Success<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>>? get listData;
  $R call(
      {String? message,
      String? code,
      T? data,
      List<T>? listData,
      int? listTotal});
  SuccessCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SuccessCopyWithImpl<$R, $Out, T>
    extends ClassCopyWithBase<$R, Success<T>, $Out>
    implements SuccessCopyWith<$R, Success<T>, $Out, T> {
  _SuccessCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Success> $mapper =
      SuccessMapper.ensureInitialized();
  @override
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>>? get listData =>
      $value.listData != null
          ? ListCopyWith(
              $value.listData!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(listData: v))
          : null;
  @override
  $R call(
          {String? message,
          String? code,
          Object? data = $none,
          Object? listData = $none,
          int? listTotal}) =>
      $apply(FieldCopyWithData({
        if (message != null) #message: message,
        if (code != null) #code: code,
        if (data != $none) #data: data,
        if (listData != $none) #listData: listData,
        if (listTotal != null) #listTotal: listTotal
      }));
  @override
  Success<T> $make(CopyWithData data) => Success(
      message: data.get(#message, or: $value.message),
      code: data.get(#code, or: $value.code),
      data: data.get(#data, or: $value.data),
      listData: data.get(#listData, or: $value.listData),
      listTotal: data.get(#listTotal, or: $value.listTotal));

  @override
  SuccessCopyWith<$R2, Success<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SuccessCopyWithImpl<$R2, $Out2, T>($value, $cast, t);
}

class ErrorMapper extends ClassMapperBase<Error> {
  ErrorMapper._();

  static ErrorMapper? _instance;
  static ErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ErrorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Error';
  @override
  Function get typeFactory => <T>(f) => f<Error<T>>();

  static String _$message(Error v) => v.message;
  static const Field<Error, String> _f$message =
      Field('message', _$message, opt: true, def: "");
  static String _$code(Error v) => v.code;
  static const Field<Error, String> _f$code =
      Field('code', _$code, opt: true, def: "");
  static dynamic _$data(Error v) => v.data;
  static dynamic _arg$data<T>(f) => f<T>();
  static const Field<Error, dynamic> _f$data =
      Field('data', _$data, opt: true, arg: _arg$data);
  static List<dynamic>? _$listData(Error v) => v.listData;
  static dynamic _arg$listData<T>(f) => f<List<T>>();
  static const Field<Error, List<dynamic>> _f$listData =
      Field('listData', _$listData, opt: true, arg: _arg$listData);
  static int _$listTotal(Error v) => v.listTotal;
  static const Field<Error, int> _f$listTotal =
      Field('listTotal', _$listTotal, opt: true, def: 0);

  @override
  final MappableFields<Error> fields = const {
    #message: _f$message,
    #code: _f$code,
    #data: _f$data,
    #listData: _f$listData,
    #listTotal: _f$listTotal,
  };

  static Error<T> _instantiate<T>(DecodingData data) {
    return Error(
        message: data.dec(_f$message),
        code: data.dec(_f$code),
        data: data.dec(_f$data),
        listData: data.dec(_f$listData),
        listTotal: data.dec(_f$listTotal));
  }

  @override
  final Function instantiate = _instantiate;

  static Error<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Error<T>>(map);
  }

  static Error<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<Error<T>>(json);
  }
}

mixin ErrorMappable<T> {
  String toJson() {
    return ErrorMapper.ensureInitialized()
        .encodeJson<Error<T>>(this as Error<T>);
  }

  Map<String, dynamic> toMap() {
    return ErrorMapper.ensureInitialized()
        .encodeMap<Error<T>>(this as Error<T>);
  }

  ErrorCopyWith<Error<T>, Error<T>, Error<T>, T> get copyWith =>
      _ErrorCopyWithImpl<Error<T>, Error<T>, T>(
          this as Error<T>, $identity, $identity);
  @override
  String toString() {
    return ErrorMapper.ensureInitialized().stringifyValue(this as Error<T>);
  }

  @override
  bool operator ==(Object other) {
    return ErrorMapper.ensureInitialized().equalsValue(this as Error<T>, other);
  }

  @override
  int get hashCode {
    return ErrorMapper.ensureInitialized().hashValue(this as Error<T>);
  }
}

extension ErrorValueCopy<$R, $Out, T> on ObjectCopyWith<$R, Error<T>, $Out> {
  ErrorCopyWith<$R, Error<T>, $Out, T> get $asError =>
      $base.as((v, t, t2) => _ErrorCopyWithImpl<$R, $Out, T>(v, t, t2));
}

abstract class ErrorCopyWith<$R, $In extends Error<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>>? get listData;
  $R call(
      {String? message,
      String? code,
      T? data,
      List<T>? listData,
      int? listTotal});
  ErrorCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ErrorCopyWithImpl<$R, $Out, T>
    extends ClassCopyWithBase<$R, Error<T>, $Out>
    implements ErrorCopyWith<$R, Error<T>, $Out, T> {
  _ErrorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Error> $mapper = ErrorMapper.ensureInitialized();
  @override
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>>? get listData =>
      $value.listData != null
          ? ListCopyWith(
              $value.listData!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(listData: v))
          : null;
  @override
  $R call(
          {String? message,
          String? code,
          Object? data = $none,
          Object? listData = $none,
          int? listTotal}) =>
      $apply(FieldCopyWithData({
        if (message != null) #message: message,
        if (code != null) #code: code,
        if (data != $none) #data: data,
        if (listData != $none) #listData: listData,
        if (listTotal != null) #listTotal: listTotal
      }));
  @override
  Error<T> $make(CopyWithData data) => Error(
      message: data.get(#message, or: $value.message),
      code: data.get(#code, or: $value.code),
      data: data.get(#data, or: $value.data),
      listData: data.get(#listData, or: $value.listData),
      listTotal: data.get(#listTotal, or: $value.listTotal));

  @override
  ErrorCopyWith<$R2, Error<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ErrorCopyWithImpl<$R2, $Out2, T>($value, $cast, t);
}
