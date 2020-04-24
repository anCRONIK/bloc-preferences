import 'dart:ui';

import 'package:either_option/either_option.dart';
import '../../../../core/error/failures.dart';

/// Repository for reading translations files.
abstract class TranslationFileRepository {

  /// Method for fetching content of the json file which contains data. Method returns content as [Map] or [Failure] in case of any error.
  Future<Either<Map, Failure>> loadJsonFile(Locale locale);

}