abstract class Failure {
  final String message;
  final StackTrace? stackTrace;

  Failure({
    required this.message,
    this.stackTrace,
  });

  @override
  String toString() => message;
}

class NoInternetFailure extends Failure {
  NoInternetFailure()
      : super(
          message: 'No internet connection.',
        );
}

class RemoteFailure extends Failure {
  RemoteFailure({
    required super.message,
  });
}

class FixtureModelParsingFailure extends Failure {
  FixtureModelParsingFailure({
    required super.message,
    required super.stackTrace,
  });
}

class CommentaryModelParsingFailure extends Failure {
  CommentaryModelParsingFailure({
    required super.message,
    required super.stackTrace,
  });
}

class FixtureNotFoundFailure extends Failure {
  FixtureNotFoundFailure() : super(message: 'Team not found.');
}
class TeamModelParsingFailure extends Failure {
  TeamModelParsingFailure({
    required super.message,
    required super.stackTrace,
  });
}

class TeamNotFoundFailure extends Failure {
  TeamNotFoundFailure() : super(message: 'Team not found.');
}

class CommentaryNotFoundFailure extends Failure {
  CommentaryNotFoundFailure() : super(message: 'Commentary not found.');
}
