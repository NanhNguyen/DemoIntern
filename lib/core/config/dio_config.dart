// import 'package:dio/dio.dart';
// import 'package:logging/logging.dart';
// import 'app_constants.dart';

// class DioConfig {
//   static Dio createDio() {
//     final dio = Dio(
//       BaseOptions(
//         baseUrl: AppConstants.baseUrl,
//         connectTimeout: AppConstants.timeout,
//         receiveTimeout: AppConstants.timeout,
//       ),
//     );

//     dio.interceptors.add(
//       LogInterceptor(request: true, responseBody: true, error: true),
//     );

//     return dio;
//   }
// }
