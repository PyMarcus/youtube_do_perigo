import 'package:flutter/material.dart';
import 'package:youtube_do_perigo/models/video_model.dart';
import 'package:youtube_do_perigo/services/service.dart';

class MainView extends StatefulWidget {
  String queryResult = "";

  MainView(this.queryResult, {super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    YouTubeService ys = YouTubeService();
    return FutureBuilder<List<VideoModel>>(
        future: ys.search(widget.queryResult),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator(color: Colors.red,),);
            case ConnectionState.active:
            case ConnectionState.done:
              if(snapshot.hasData){
                return ListView.separated(
                    itemBuilder: (context, index){
                      return Column(
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(snapshot.data![index].image)
                              )
                            ),
                          ),
                          ListTile(
                            title: Text(snapshot.data![index].title),
                            subtitle: Text(snapshot.data![index].channel),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => Divider(height: 2, color: Colors.grey,),
                    itemCount: snapshot.data!.length
                );
              }else{
                return const Center(child: Text("Nenhuma informação, verifique a rede!"),);
              }
              break;
          }
        }
    );
  }
}
