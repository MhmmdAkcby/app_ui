import 'dart:io';

import 'package:app_ui/model/photo_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class IPhotoService {
  Future<List<PhotoModel>?> fetchPhotoItemAdvance();
}

class PhotoService implements IPhotoService {
  late final Dio _dio;
  PhotoService() : _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));
  @override
  Future<List<PhotoModel>?> fetchPhotoItemAdvance() async {
    try {
      final response = await _dio.get(_PhotoItemPath.photos.name);
      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;
        if (datas is List) {
          return datas.map((e) => PhotoModel.fromJson(e)).toList();
        }
      }
    } on DioException catch (exception) {
      _ShowDebug()._showError(exception, this);
    }
    return null;
  }
}

class _ShowDebug {
  void _showError<T>(DioException exception, T type) {
    if (kDebugMode) {
      print(exception.message);
      print(type);
      print('-----------------------------');
    }
  }
}

enum _PhotoItemPath { photos }
