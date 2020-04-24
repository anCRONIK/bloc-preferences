import 'dart:convert';

import 'package:either_option/either_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/translation_file_repository.dart';

/// Implementation class of [TranslationFileRepository].
@RegisterAs(TranslationFileRepository)
@injectable
class TranslationFileRepositoryImpl extends TranslationFileRepository {

  final String _localeAssetsPath;

  TranslationFileRepositoryImpl(@Named("LocaleAssetsPath") this._localeAssetsPath);

  final Logger log = Logger('TranslationFileRepositoryImpl');
  
  @override
  Future<Either<Map, Failure>> loadJsonFile(Locale locale) async {
    String jsonContent = await _getContent("$_localeAssetsPath${locale.languageCode}.json");
    if (jsonContent == null) {
      jsonContent = await _getContent("$_localeAssetsPath${locale.toString()}.json");
      if(jsonContent == null) {
        return Future.value(Right(ReadFailure()));
      }
    }
    final Map data = json.decode(jsonContent) as Map;
    return Future.value(Left(data));
  }

  Future<String> _getContent(String path){
    return rootBundle.loadString(path).catchError((e) {
      log.severe("Error while fetchin json language data for $path.", e);
      return null;
    });
  }
  

}