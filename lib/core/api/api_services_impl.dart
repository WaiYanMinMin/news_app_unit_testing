import 'package:news_app_unit_testing/core/api/api_services.dart';
import 'package:http/http.dart' as http;

class ApiServicesImpl implements ApiServices {
  String baseUrl = "newsapi.org";

  @override
  get(String path, Map<String, String> params) async {
    var response = await http.get(Uri.https(baseUrl, path, params));
    return response;
  }

  @override
  post(String path) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
