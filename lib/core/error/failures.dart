import 'package:equatable/equatable.dart';
import '../i18n/translations.dart';

/// Class which represents failures that are used in features.application_preferences.domain layer.
class Failure with EquatableMixin {
  String msg;

  Failure({this.msg});

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [msg];
}

// GENERAL FAILURES

class InternalFailure extends Failure {}

class InvalidArgumentFailure extends Failure {}

class UnsupportedFailure extends Failure {}

class UnsupportedValueFailure extends Failure {}

class InvalidValueFailure extends Failure {}

class InvalidRouteFailure extends Failure {}

// STORAGE FAILURES

class ReadFailure extends Failure {}

class WriteFailure extends Failure {}

class KeyDoesNotExistsFailure extends Failure {}

// TRANSLATIONS
class LocaleChangeFailure extends Failure {}


/// Method for converting failure to the proper message for the user
String failureToMessage(Failure f){
  final String key = "failures.${f.runtimeType.toString().toLowerCase()}";
  final String translation = translate(key);
  if(translation == key){
    return translate("failures.default");
  }
  return translation;
}