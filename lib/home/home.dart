import 'package:flutter/material.dart';
import 'package:youtube_do_perigo/constants/colors.dart';
import 'package:youtube_do_perigo/constants/dimensions.dart';
import 'package:youtube_do_perigo/constants/strings.dart';

class Home extends StatefulWidget{
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home>{

  int _currentPageIndex = 0;
   final List<Widget> _screens = [
    const Text("TELA A"),
    const Text("TELA B"),
    const Text("TELA C"),
    const Text("TELA D"),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: appBar(),

      body: _screens[_currentPageIndex],

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
        IconButton(onPressed: (){}, icon: const Icon(Icons.search), color: Color(ColorsHex.appBarIconColor),),
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