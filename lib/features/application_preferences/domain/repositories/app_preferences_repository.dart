import 'package:either_option/either_option.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/error/failures.dart';

/// Repository for storing application preferences values and also fetching those values back. This is just an interface describing which methods are needed.
abstract class AppPreferencesRepository {

  /// Stores the value with [value] for the given preference [preference]. In case of error, method will return [Failure].
  Future<Failure> storeValue({@required String preference, @required Object value});

  /// Gets the value for the given preference [preference]. In case of error, method will return [Failure].
  Either<Object, Failure> getValue({@required String preference, @required Object type});
}
