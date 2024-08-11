class VideoModel{
  String id = "";
  String title = "";
  String image = "";
  String channel = "";

  VideoModel(this.id, this.title, this.image, this.channel);

  // ao inves de instanciar um novo objeto toda vez, retorna apenas um
  factory VideoModel.fromJson(Map<String, dynamic> core){
    return VideoModel(
      core["id"]["videoId"],
      core["snippet"]["title"],
      core["snippet"]["thumbnails"]["default"]["url"],
      core["snippet"]["channelTitle"]
    );
  }
}