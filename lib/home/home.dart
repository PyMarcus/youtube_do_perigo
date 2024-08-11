import 'package:flutter/material.dart';
import 'package:youtube_do_perigo/constants/colors.dart';
import 'package:youtube_do_perigo/constants/dimensions.dart';
import 'package:youtube_do_perigo/constants/strings.dart';
import 'package:youtube_do_perigo/tools/custom_search_delegate.dart';
import 'package:youtube_do_perigo/views/booming_view.dart';
import 'package:youtube_do_perigo/views/library_view.dart';
import 'package:youtube_do_perigo/views/main_view.dart';
import 'package:youtube_do_perigo/views/subscriptions_view.dart';

class Home extends StatefulWidget{
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home>{

  String queryResult = "";
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context){
    final List<Widget> _screens = [
      MainView(queryResult),
      const BoomingView(),
      const SubscriptionsView(),
      const LibraryView(),
    ];
    return Scaffold(
      appBar: appBar(),

      body: Container(
        padding: EdgeInsets.all(16),
        child: _screens[_currentPageIndex],
      ),

      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  AppBar appBar(){
    return AppBar(
      title: Image.asset(
        Strings.PATH_LOGO,
        width: Dimensions.LOGO_SIZE_WIDTH,
        height: Dimensions.LOGO_SIZE_HEIGHT,
      ),
      actions:[
        IconButton(onPressed: (){}, icon: const Icon(Icons.videocam), color: Color(ColorsHex.appBarIconColor),),
        IconButton(onPressed: ()async{
          String? result = await showSearch(context: context, delegate: CustomSearchDelegate());
          setState(() {
            if(result != null){
              queryResult = result;
            }
          });
        }, icon: const Icon(Icons.search), color: Color(ColorsHex.appBarIconColor),),
        IconButton(onPressed: (){}, icon: const Icon(Icons.account_circle), color: Color(ColorsHex.appBarIconColor),),
      ],
      backgroundColor: Color(ColorsHex.appBarColor),
    );
  }

  NavigationBar bottomNavigationBar() {
    return NavigationBar(
      onDestinationSelected: (int index){
        setState(() {
          _currentPageIndex = index;
        });
      },
      indicatorColor: Color(ColorsHex.appBarIconColor),
      selectedIndex: _currentPageIndex,
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.home, color: Colors.black,),
          label: Strings.BOTTOM_ICON_TITLE_HOME,
        ),
        NavigationDestination(
          icon: Icon(Icons.whatshot),
          label: Strings.BOTTOM_ICON_TITLE_HOT,
        ),
        NavigationDestination(
          icon: Icon(Icons.subscriptions),
          label: Strings.BOTTOM_ICON_TITLE_SUBSCRIPTIONS,
        ),
        NavigationDestination(
          icon: Icon(Icons.folder),
          label: Strings.BOTTOM_ICON_TITLE_LIBRARY,
        ),
      ],
    );
  }

}