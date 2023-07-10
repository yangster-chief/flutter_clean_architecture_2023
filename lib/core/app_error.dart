///
/// flutter_clean_architecture_2023
/// File Name: app_error
/// Created by sujangmac on 2023/07/10
///
/// Description:
///
enum AppErrorType {
  network,
  server,
  unknown,
}

class AppError implements Exception {
  AppError({
    this.type = AppErrorType.unknown,
    this.error,
  });

  AppErrorType type;

  dynamic error;

  String get message => (error?.toString() ?? '');

  @override
  String toString() {
    var msg = 'AppError [$type]: $message';
    if (error is Error) {
      msg += '\n${(error as Error).stackTrace}';
    }
    return msg;
  }
}
