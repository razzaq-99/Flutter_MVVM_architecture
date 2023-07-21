


class AppExceptions implements Exception {
  final _message;
  final _prefix;
  AppExceptions([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, 'Error during communication');

}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message])
      : super(message, 'Invalid request');

}

class UnAuthorizedException extends AppExceptions {
  UnAuthorizedException ([String? message])
      : super(message, 'UnAuthorized request');

}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message])
      : super(message, 'Invalid input');

}
