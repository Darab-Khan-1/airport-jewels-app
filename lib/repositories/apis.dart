class AppUrl {
  //Live
  static const String baseUrl = "https://jat-uk.com/api/users";

  static const String loginApi = "$baseUrl/user_login";
  static const String registerUser = "$baseUrl/register_user";
  static const String userLogin = "$baseUrl/user_login";
  static const String editUser = "$baseUrl/edit_user";
  static const String deleteUser = "$baseUrl/delete_user";
  static const String updatePassword = "$baseUrl/update_password";
  static const String addDriver = "$baseUrl/add_driver";
  static const String showProfile = "$baseUrl/show_profile";
  static const String getAllDrivers = "$baseUrl/get_all_drivers";
  static const String journeyDetails = "$baseUrl/journeyDetails";
  static const String bidJob = "$baseUrl/bid_job";
  static const String scheduledJourneyDetails = "$baseUrl/scheduled_journey_details";
  static const String confirmAvailability = "$baseUrl/confirm_availability";
  static const String completedJourneyDetails = "$baseUrl/completed_journey_details";
  static const String availableJobs = "$baseUrl/available_jobs";
  static const String commentInsert = "$baseUrl/comment_insert";
  static const String commentsShow = "$baseUrl/comments_show";
  static const String jobProcess = "$baseUrl/job_process";
  static const String getAllCountries = "$baseUrl/get_all_countries";
  static const String getAllCars = "$baseUrl/get_all_cars";
  static const String getAllPorts = "$baseUrl/get_all_ports";
  static const String logout = "$baseUrl/logout";

  // Utility Method (Optional)
  static String appendQueryParams(String url, Map<String, String> queryParams) {
    final Uri uri = Uri.parse(url).replace(queryParameters: queryParams);
    return uri.toString();
  }
}
