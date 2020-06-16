class APIUrl {
  static String host = "https://github.com";
  static String host2 = "https://api.github.com";

  //user
  static String user = "$host2/user";
  static String getUserRepo = "$user/repos";

  //login authorization
  static String login = "$host/login";
  static String oauth = "$login/oauth";
  static String accessToken = "$oauth/access_token";

  static String authorize(clientId) => "$oauth/authorize?client_id=$clientId";
}
