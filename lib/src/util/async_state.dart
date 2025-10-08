import 'package:collection/collection.dart';
import 'package:dataforge_annotation/dataforge_annotation.dart';

part 'async_state.data.dart';

@Dataforge(includeFromJson: false, includeToJson: false)
class AsyncResult<T> with _AsyncResult<T>, _AsyncResult<T> {
  @override
  final String message;
  @override
  final String code;
  @override
  final T? data;
  @override
  final bool isRefresh;
  @override
  final AsyncStatus status;
  @override
  final Map<String, dynamic> extras;

  const AsyncResult({
    required this.status,
    this.message = "",
    this.code = "",
    this.data,
    this.isRefresh = true,
    this.extras = const {},
  });

  factory AsyncResult.success({
    String message = "",
    String code = "",
    T? data,
    bool isRefresh = true,
    Map<String, dynamic> extras = const {},
  }) {
    return AsyncResult<T>(
      status: AsyncStatus.success,
      message: message,
      code: code,
      data: data,
      isRefresh: isRefresh,
      extras: extras,
    );
  }

  factory AsyncResult.error({
    String message = "",
    String code = "",
    T? data,
    bool isRefresh = true,
    Map<String, dynamic> extras = const {},
  }) {
    return AsyncResult<T>(
      status: AsyncStatus.error,
      message: message,
      code: code,
      data: data,
      isRefresh: isRefresh,
      extras: extras,
    );
  }

  factory AsyncResult.loading({
    String message = "",
    String code = "",
    T? data,
    bool isRefresh = true,
    Map<String, dynamic> extras = const {},
  }) {
    return AsyncResult<T>(
      status: AsyncStatus.loading,
      message: message,
      code: code,
      data: data,
      isRefresh: isRefresh,
      extras: extras,
    );
  }

  bool get isSuccess => status == AsyncStatus.success;

  bool get isError => status == AsyncStatus.error;

  bool get isLoading => status == AsyncStatus.loading;
}

enum AsyncStatus { success, error, loading }
