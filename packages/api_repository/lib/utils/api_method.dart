import 'package:dio/dio.dart';

class ApiClient {
  Dio?
      dioClient; // Represents the Dio HTTP client instance used for making API calls

  ApiClient({this.dioClient}); // Constructor that initializes the Dio client

  Response? response; // Represents the HTTP response received from the API

  // Performs a GET request to the specified URL and returns the response

  Future<Response?> get(String url) async {
    try {
      response =
          await dioClient?.get(url); // Send GET request using the Dio client
    } on DioException catch (error) {
      // If an exception occurs, handle it accordingly
      if (error.type == DioExceptionType.connectionTimeout) {
        // If the exception type is connection timeout, create a custom response
        response = Response(
            requestOptions: RequestOptions(path: url),
            statusCode: 408,
            statusMessage: error.message);
      } else if (error.type == DioExceptionType.receiveTimeout) {
        // If the exception type is receive timeout, create a custom response
        response = Response(
            requestOptions: RequestOptions(path: url),
            statusCode: 504,
            statusMessage: error.message);
      }
    }
    return response; // Return the response
  }

  // Performs a POST request to the specified URL with the given body and headers, and returns the response

  Future<Response?> post(String url, Map<String, dynamic> body,
      {Map<String, dynamic>? header}) async {
    try {
      response = await dioClient?.post(url,
          data: body,
          options: Options(
              headers: header)); // Send POST request using the Dio client
    } on DioException catch (error) {
      // If an exception occurs, handle it accordingly
      if (error.type == DioExceptionType.connectionTimeout) {
        // If the exception type is connection timeout, create a custom response
        response = Response(
            requestOptions: RequestOptions(path: url),
            statusCode: 408,
            statusMessage: error.message);
      } else if (error.type == DioExceptionType.receiveTimeout) {
        // If the exception type is receive timeout, create a custom response
        response = Response(
            requestOptions: RequestOptions(path: url),
            statusCode: 504,
            statusMessage: error.message);
      } else {
        response = Response(
            requestOptions: RequestOptions(path: url),
            statusMessage: error.message);
      }
    }
    return response; // Return the response
  }

  // Performs a PUT request to the specified URL with the given body and headers, and returns the response

  Future<Response?> put(String url, Map<String, dynamic> body,
      {Map<String, dynamic>? header}) async {
    try {
      response = await dioClient?.put(url,
          data: body,
          options: Options(
              headers: header)); // Send PUT request using the Dio client
    } on DioException catch (error) {
      // If an exception occurs, handle it accordingly
      if (error.type == DioExceptionType.connectionTimeout) {
        // If the exception type is connection timeout, create a custom response
        response = Response(
            requestOptions: RequestOptions(path: url),
            statusCode: 408,
            statusMessage: error.message);
      } else if (error.type == DioExceptionType.receiveTimeout) {
        // If the exception type is receive timeout, create a custom response
        response = Response(
            requestOptions: RequestOptions(path: url),
            statusCode: 504,
            statusMessage: error.message);
      }
    }
    return response; // Return the response
  }

  Future<Response?> delete(
    String url,
  ) async {
    try {
      // Sending a DELETE request to the specified URL using the dioClient
      response = await dioClient?.delete(url);
    } on DioException catch (error) {
      // Handling DioExceptions if they occur

      if (error.type == DioExceptionType.connectionTimeout) {
        // If the DioException is due to a connection timeout, create a custom response with status code 408 and the error message
        response = Response(
            requestOptions: RequestOptions(path: url),
            statusCode: 408,
            statusMessage: error.message);
      } else if (error.type == DioExceptionType.receiveTimeout) {
        // If the DioException is due to a receive timeout, create a custom response with status code 504 and the error message
        response = Response(
            requestOptions: RequestOptions(path: url),
            statusCode: 504,
            statusMessage: error.message);
      }
    }
    // Return the response, which may be null if no DioExceptions occurred
    return response;
  }
}
