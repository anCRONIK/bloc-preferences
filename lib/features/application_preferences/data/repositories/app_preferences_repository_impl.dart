import 'package:either_option/either_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/app_preferences_repository.dart';
import '../datasources/preferences_datasource.dart';


/// Concrete implementation of [AppPreferencesRepository].
@RegisterAs(AppPreferencesRepository)
@injectable
class AppPreferencesRepositoryImpl implements AppPreferencesRepository {
  final PreferencesDataSource _dataSource;

  AppPreferencesRepositoryImpl(this._dataSource);

  final Logger log = Logger('AppPreferencesRepositoryImpl');

  @override
  Either<Object, Failure> getValue({@required String preference, @required Object type}) {
    log.finer("Preference $preference and type $type");
    try {
      if(type == bool){
        return Left(_dataSource.getBool(preference));
      }else if(type == String){
        return Left(_dataSource.getString(preference));
      }else if(type == num){
        return Left(_dataSource.getNum(preference));
      }else{
        throw KeyDoesNotExistsException();
      }
    } on KeyDoesNotExistsException {
      return Right(KeyDoesNotExistsFailure());
    } catch (e) {
      return Right(ReadFailure());
    }
  }

  @override
  Future<Failure> storeValue({@required String preference, @required Object value}) async {
    log.finer("Preference $preference and value $value");
    try {
      if (value is num) {
        _checkResult(await storeNum(preference, value));
      } else if (value is String) {
        _checkResult(await storeString(preference, value));
      } else if (value is bool) {
        _checkResult(await storeBool(preference, value));
      } else {
        return UnsupportedValueFailure();
      }
      return Future.value(null);
    } catch (e) {
      log.severe("storeValue error for key $preference", e);
      return Future.value(WriteFailure());
    }
  }

  void _checkResult(Failure result) {
    if (result != null) {
      throw "Error while writing";
    }
  }

  // ignore: avoid_positional_boolean_parameters
  Future<Failure> storeBool(String key, bool object) async {
    final bool result = await _dataSource.storeBool(key, object).catchError((e) {
      log.severe("Error while storing bool $key", e);
      return Future.value(false);
    });
    return result ? Future.value(null) : Future.value(WriteFailure());
  }

  Future<Failure> storeNum(String key, num object) async {
    final bool result = await _dataSource.storeNum(key, object).catchError((e) {
      log.severe("Error while storing num $key", e);
      return Future.value(false);
    });
    return result ? Future.value(null) : Future.value(WriteFailure());
  }

  Future<Failure> storeString(String key, String object) async {
    final bool result = await _dataSource.storeString(key, object).catchError((e) {
      log.severe("Error while storing string $key", e);
      return Future.value(false);
    });
    return result ? Future.value(null) : Future.value(WriteFailure());
  }
}
