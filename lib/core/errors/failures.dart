import 'package:dio/dio.dart';

abstract class Failure {
  final String errorM;

  Failure({required this.errorM});
}

// ignore: camel_case_types
class serverFailure extends Failure {
  serverFailure({required super.errorM});
  factory serverFailure.fromDioException(DioException dioerror) {
    switch (dioerror.type) {
      case DioExceptionType.connectionTimeout:
        return serverFailure(errorM: 'Connection Timeout With Api Server');
      case DioExceptionType.sendTimeout:
        return serverFailure(errorM: 'Send Timeout With Api Server');
      case DioExceptionType.receiveTimeout:
        return serverFailure(errorM: 'Receive Timeout With Api Server');
      case DioExceptionType.badCertificate:
        return serverFailure(errorM: 'Bad Certificate');
      case DioExceptionType.badResponse:
        return serverFailure.fromResponse(
            dioerror.response!.statusCode!, dioerror.response!.data);
      case DioExceptionType.cancel:
        return serverFailure(errorM: 'Cancelled');
      case DioExceptionType.connectionError:
        return serverFailure(errorM: 'Connection Error');
      case DioExceptionType.unknown:
        if (dioerror.message!.contains('SocketException')) {
          return serverFailure(errorM: 'No Internet Connection');
        }
        return serverFailure(errorM: 'UnExpected Error, Try Again');
      default:
        return serverFailure(errorM: 'Opps There Is An Error');
    }
  }
  factory serverFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return serverFailure(errorM: response['error']['message']);
    } else if (statusCode == 404) {
      return serverFailure(
          errorM: 'Your Request Not Found, Please Try Again Later');
    } else if (statusCode == 500) {
      return serverFailure(
          errorM: 'Internal Server Error, Please Try Again Later');
    } else {
      return serverFailure(errorM: 'Opps There Is An Error');
    }
  }
}
