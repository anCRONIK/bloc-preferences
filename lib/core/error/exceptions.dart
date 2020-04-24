import 'package:equatable/equatable.dart';

/// Class which represents errors that can occur in features.application_preferences.data layer.
class Exception with EquatableMixin {
  String msg;

  Exception({this.msg});

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [msg];
}

// GENERAL ERRORS

class InternalException extends Exception {}

class InvalidArgumentException extends Exception {}

class UnsupportedException extends Exception {}

class UnsupportedValueException extends Exception {}

// STORAGE ERRORS

class ReadException extends Exception {}

class WriteException extends Exception {}

class KeyDoesNotExistsException extends Exception{}
