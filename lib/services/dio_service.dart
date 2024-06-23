import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../app/app.logger.dart';
import '../exceptions/calpal_exceptions.dart';
import '../interceptors/app_interceptors.dart';

class DioService {
  late final Dio _dio;
  final _logger = getLogger('DioService');

  DioService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "",
        connectTimeout: const Duration(seconds: 50),
      ),
    );
    if (kDebugMode) {
      _dio.interceptors.addAll([
        LogInterceptor(
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
          request: false,
          requestBody: true,
        ),
        AppInterceptor(),
      ]);
    }
    _dio.interceptors.add(AppInterceptor());
  }

  Future post({
    required String path,
    Map<String, dynamic>? data,
    final formData,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final Response response = await _dio.post(
        path,
        data: formData ?? data,
        queryParameters: queryParameters,
        options: options,
      );

      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    } catch (e, s) {
      _logger.wtf('Could not make a request to this path: $path', e, s);
    }
  }

  Future get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      _logger.e('Could not make a request to this path: $path', e);
      _handleError(e);
    } catch (e, s) {
      _logger.wtf('Could not make a request to this path: $path', e, s);
    }
  }

  Future put({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    } catch (e, s) {
      _logger.wtf('Could not make a request to this path: $path', e, s);
    }
  }

  Future patch({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    } catch (e, s) {
      _logger.wtf('Could not make a request to this path: $path', e, s);
    }
  }

  Future delete({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    } catch (e, s) {
      _logger.wtf('Could not make a request to this path: $path', e, s);
    }
  }

  void _handleError(DioException e) {
    if (e.type == DioExceptionType.unknown && e.error is SocketException) {
      throw CalpalException(
        message: 'Unknown Error',
      );
    }

    if (e.type == DioExceptionType.connectionTimeout) {
      throw CalpalException(
          message:
              'No Internet Connection. It seems like the connection timed out');
    }

    if (e.type == DioExceptionType.connectionError) {
      throw CalpalException(
        message:
            'Seems like we got a problem connecting to the server. Kindly try again when you have a stronger network',
      );
    }

    if (e.response?.statusCode == 500) {
      throw CalpalException(message: 'Service Unavailable');
    }
    throw CalpalException(
      message: e.response!.data["message"] ?? 'Unknown Error',
    );
  }
}
