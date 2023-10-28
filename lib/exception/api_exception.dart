class ApiException implements Exception {
  String message;
  ApiException([this.message = 'Something went Wrong']) {
    message = 'Api Exception : $message';
  }

  @override
  String toString() {
    return message;
  }
}
