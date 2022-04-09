class BaseApi{
  static String base = "10.0.2.2:8080";
  Uri registrationAuth = Uri.http(base, "auth/register");
  Uri loginAuth = Uri.http(base, "auth/login");
  Uri announcementUri = Uri.http(base, "announcement");
  Map<String,String> headers = {"Content-Type": "application/json; charset=UTF-8"};
  Map<String,String> token = {"Content-Type": "application/json; charset=UTF-8" };
}
