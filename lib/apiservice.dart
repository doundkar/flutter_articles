import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ArticleService extends GetxService {
  String articlesApiUrl = "https://jsonplaceholder.typicode.com/posts";

  @override
  Future<ArticleService> onInit() async {
    super.onInit();
    return this;
  }

  Future<List<dynamic>> fetchData(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        List<dynamic> data = result;
        return data;
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
    return [];
  }
}
