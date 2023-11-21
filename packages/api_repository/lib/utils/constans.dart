class Const {
  static const String baseUrl = 'https://dummyjson.com/';
}

/// {@template RepositoryException}
/// Generic [Exception] thrown by the [RepositoryException].
/// {@endtemplate}
class RepositoryException implements Exception {
  /// {@macro RepositoryException}
  RepositoryException(this.error, this.stackTrace);

  /// The [Exception] which was thrown.
  final Exception error;

  /// The full [StackTrace].
  final StackTrace stackTrace;
}
