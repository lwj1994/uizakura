class Async<T> {
  final String message;
  final String code;
  final T? data;
  final bool isRefresh;
  final AsyncStatus status;
  final Map<String, dynamic> extras;

  const Async._({
    required this.status,
    this.message = "",
    this.code = "",
    this.data,
    this.isRefresh = true,
    this.extras = const {},
  });

  factory Async.success({
    String message = "",
    String code = "",
    T? data,
    bool isRefresh = true,
    Map<String, dynamic> extras = const {},
  }) {
    return Async._(
      status: AsyncStatus.success,
      message: message,
      code: code,
      data: data,
      isRefresh: isRefresh,
      extras: extras,
    );
  }

  factory Async.error({
    String message = "",
    String code = "",
    T? data,
    bool isRefresh = true,
    Map<String, dynamic> extras = const {},
  }) {
    return Async._(
      status: AsyncStatus.error,
      message: message,
      code: code,
      data: data,
      isRefresh: isRefresh,
      extras: extras,
    );
  }

  factory Async.loading({
    String message = "",
    String code = "",
    T? data,
    bool isRefresh = true,
    Map<String, dynamic> extras = const {},
  }) {
    return Async._(
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
