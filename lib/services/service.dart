import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube_do_perigo/models/video_model.dart';

class YouTubeService{
  static const String _baseUrl = "https://www.googleapis.com/youtube/v3";

  Future<String> _getApiToken() async{
    await dotenv.load(fileName: "app.env");
    String token = dotenv.env["TOKEN"] ?? "";
    return token;
  }

  Future<List<VideoModel>> search(String queryResult) async {
    List<VideoModel> videos = [];
    http.Response response;

    String token = await _getApiToken();
    if(queryResult != ""){
      response = await http.get(
          Uri.parse("$_baseUrl/search?part=snippet&type=video&maxResults=20&order=date&key=$token&q=$queryResult")
      );
    }
    else{
       response = await http.get(
          Uri.parse("$_baseUrl/search?part=snippet&type=video&maxResults=20&order=date&key=$token")
      );
    }
    if(response.statusCode == 200){
      Map<String, dynamic> responseJson = json.decode(response.body);
        videos = responseJson["items"].map<VideoModel>(
            (map){
              return VideoModel.fromJson(map);
            }
        ).toList();
    }
    return videos;
  }
}