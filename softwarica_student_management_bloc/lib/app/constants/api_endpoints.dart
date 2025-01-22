class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://10.0.2.2:3001/api/v1/";

  // have used 3001 port in `config.env`

  // static const String baseUrl = "http://localhost:3001/api/v1/";

  // ======================== Batch Apis ==========================
  static const String createBatch = "batch/createBatch";
  static const String getAllBatch = "batch/getAllBatches";

  // ======================== Course Apis =========================
  static const String createCourse = "course/createCourse";
  static const String getAllCourse = "course/getAllCourse";
}
