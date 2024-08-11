import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class YouTubeService{
  static const String _baseUrl = "https://www.googleapis.com/youtube/v3";

  Future<String> _getApiToken() async{
    await dotenv.load(fileName: "app.env");
    String token = dotenv.env["TOKEN"] ?? "";
    return token;
  }

  search() async {
    String token = await _getApiToken();
    http.Response response = await http.get(
        Uri.parse("$_baseUrl/search?part=snippet&type=video&maxResults=20&order=date&key=$token")
    );
    print("RESP ${response.statusCode}");
  }
}