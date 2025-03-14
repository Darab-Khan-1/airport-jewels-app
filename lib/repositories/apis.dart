class AppUrl {
  //Live
  static const String baseUrl = "https://jat-uk.com/api";
  static const String loginApi = "$baseUrl/users/user_login";

  // Utility Method (Optional)
  static String appendQueryParams(String url, Map<String, String> queryParams) {
    final Uri uri = Uri.parse(url).replace(queryParameters: queryParams);
    return uri.toString();
  }
}
