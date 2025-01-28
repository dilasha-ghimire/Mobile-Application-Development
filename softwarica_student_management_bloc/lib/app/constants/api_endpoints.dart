class ApiEndpoints {
  //private constructor - not allowing its instances to be created 
  //because everything is static here, so can be accessed without creating instance
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  
  //Base url
  static const String baseUrl = "http://10.0.2.2:3001/api/v1/";

  //Batch routes
  static const String createBatch = "batch/createBatch";
  static const String getAllBatch = "batch/getAllBatches";

  //Course routes
  static const String createCourse = "course/createCourse";
  static const String getAllCourse = "course/getAllCourse";

  //Student routes
  static const String register = "auth/register";
  static const String login = "auth/login";
}