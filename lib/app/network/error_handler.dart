// ignore_for_file: constant_identifier_names

import 'package:booking_app/app/network/failure.dart';
import 'package:dio/dio.dart';

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      // dio error from dio or api
      failure = _handleError(error);
    } else {
      // default error
      failure = DataRes.DEFAULT.getFailure();
    }
  }

  Failure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return DataRes.CONNECT_TIMEOUT.getFailure();
      case DioErrorType.sendTimeout:
        return DataRes.SEND_TIMEOUT.getFailure();
      case DioErrorType.receiveTimeout:
        return DataRes.RECEIVED_TIMEOUT.getFailure();
      case DioErrorType.response:
        return Failure(messages: error.response?.data['status']['title']['en']);
      case DioErrorType.cancel:
        return DataRes.CANCEL.getFailure();

      case DioErrorType.other:
        return DataRes.DEFAULT.getFailure();
    }
  }
}

enum DataRes {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  METHOD_NOT_ALLOWED,
  UNAUTHORIZED,
  FORBIDDEN,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVED_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

extension DataResExtension on DataRes {
  Failure getFailure() {
    return Failure(
        status: ResponseCode.getCode(this),
        messages: ResponseMessage.getMessage(this));
  }
}

class ResponseCode {
  static int getCode(DataRes codeStatus) {
    switch (codeStatus) {
      case DataRes.SUCCESS:
        return 200;
      case DataRes.NO_CONTENT:
        return 201;
      case DataRes.BAD_REQUEST:
        return 400;
      case DataRes.UNAUTHORIZED:
        return 401;
      case DataRes.FORBIDDEN:
        return 403;
      case DataRes.METHOD_NOT_ALLOWED:
        return 405;
      case DataRes.NOT_FOUND:
        return 404;
      case DataRes.INTERNAL_SERVER_ERROR:
        return 500;

      // local
      case DataRes.CONNECT_TIMEOUT:
        return -1;
      case DataRes.CANCEL:
        return -2;
      case DataRes.RECEIVED_TIMEOUT:
        return -3;
      case DataRes.SEND_TIMEOUT:
        return -4;

      case DataRes.CACHE_ERROR:
        return -5;

      case DataRes.NO_INTERNET_CONNECTION:
        return -6;
      default:
        return -7;
    }
  }
}

class ResponseMessage {
  static String get _tryAgainLater => "Try Again Later";
  static String get _timeOut => "Time Out";
  static String get _connectSupport => "Contact Support";
  static String get _someThingWentWrong => "Some Thing Went Wrong";
  static String getMessage(DataRes codeStatus) {
    switch (codeStatus) {
      case DataRes.SUCCESS:
        return "";
      case DataRes.NO_CONTENT:
        return "";
      case DataRes.BAD_REQUEST:
        return "Bad Request";
      case DataRes.UNAUTHORIZED:
        return "Auth Error";
      case DataRes.FORBIDDEN:
        return "Forbidden Request $_tryAgainLater";
      case DataRes.METHOD_NOT_ALLOWED:
        return "Method Not Allowed , $_connectSupport";
      case DataRes.NOT_FOUND:
        return "Page Not Found ,  $_connectSupport";
      case DataRes.INTERNAL_SERVER_ERROR:
        return "$_someThingWentWrong , $_connectSupport";

// local
      case DataRes.CONNECT_TIMEOUT:
        return "$_timeOut  ,  $_tryAgainLater";
      case DataRes.CANCEL:
        return "Request was cancelled , $_tryAgainLater";
      case DataRes.RECEIVED_TIMEOUT:
        return "$_timeOut , $_tryAgainLater";
      case DataRes.SEND_TIMEOUT:
        return "$_timeOut , $_tryAgainLater";

      case DataRes.CACHE_ERROR:
        return "${"cache error"} , $_tryAgainLater";

      case DataRes.NO_INTERNET_CONNECTION:
        return "No internet connection";
      default:
        return "$_someThingWentWrong , $_connectSupport";
    }
  }
}
