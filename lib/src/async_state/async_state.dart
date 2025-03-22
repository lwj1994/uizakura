import 'package:dart_mappable/dart_mappable.dart';

part 'async_state.mapper.dart';

sealed class Async<T> {}

@MappableClass()
class Loading<T> extends Async<T> with LoadingMappable {
  final String message;
  final String code;
  final T? data;
  final List<T>? listData;
  final int listTotal;

  Loading({
    this.message = "",
    this.code = "",
    this.data,
    this.listData,
    this.listTotal = 0,
  });
}

@MappableClass()
class Success<T> extends Async<T> with SuccessMappable {
  final String message;
  final String code;
  final T? data;
  final List<T>? listData;
  final int listTotal;

  Success({
    this.message = "",
    this.code = "",
    this.data,
    this.listData,
    this.listTotal = 0,
  });
}

@MappableClass()
class Error<T> extends Async<T> with ErrorMappable {
  final String message;
  final String code;
  final T? data;
  final List<T>? listData;
  final int listTotal;

  Error({
    this.message = "",
    this.code = "",
    this.data,
    this.listData,
    this.listTotal = 0,
  });
}

extension AsyncExtension on Async<dynamic> {
  bool get isSuccess => this is Success;

  bool get isError => this is Error;

  bool get isLoading => this is Loading;

  bool get isComplete => isSuccess || isError;

  Async<R> copyWith<R>({
    R? data,
    List<R>? listData,
    int? listTotal,
    String? code,
    String? message,
  }) {
    switch (this) {
      case Loading():
        return Loading<R>(
          data: data,
          listData: listData,
          message: message ?? (this as Loading).message,
          code: code ?? (this as Loading).code,
          listTotal: listTotal ?? (this as Loading).listTotal,
        );
      case Success():
        return Success<R>(
          data: data,
          listData: listData,
          message: message ?? (this as Success).message,
          code: code ?? (this as Success).code,
          listTotal: listTotal ?? (this as Success).listTotal,
        );
      case Error():
        return Error<R>(
          message: message ?? (this as Error).message,
          code: code ?? (this as Error).code,
          listTotal: listTotal ?? (this as Error).listTotal,
        );
    }
  }
}
