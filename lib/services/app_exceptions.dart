import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wiseki_test/services/base_response.dart';
import 'package:wiseki_test/utils/logger.dart';

class AppException {
  //HANDLE ERROR
  static BaseResponse<T> handleError<T>(
    DioError e, {
    T? data,
  }) {
    if (e.type == DioErrorType.response && e.response != null) {
      if (e.response!.statusCode! >= 500) {
        return BaseResponse(
          success: false,
          message: "A server error occurred",
          data: data,
        );
      }
      if (e.response?.data is Map<String, dynamic>) {
        debugLog(BaseResponse.fromMap(e.response?.data));
        return BaseResponse.fromMap(e.response?.data);
      } else if (e.response?.data is String) {
        debugLog(e.response?.data);
        return BaseResponse(
          success: false,
          message: e.response?.data,
          data: data,
        );
      }
    }
    return BaseResponse(
      success: false,
      data: data,
      message: _mapException(e.type),
    );
  }

  static _mapException(DioErrorType type) {
    if (DioErrorType.connectTimeout == type ||
        DioErrorType.receiveTimeout == type ||
        DioErrorType.sendTimeout == type) {
      return "Your connection timed out";
    } else if (DioErrorType.other == type) {
      return "A network error occurred. Please check your connection";
    }
    return "An error occurred";
  }
}
