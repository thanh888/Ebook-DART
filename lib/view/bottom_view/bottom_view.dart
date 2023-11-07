import 'package:ebook_app/view/bottom_view/bottom_favorite.dart';
import 'package:ebook_app/view/bottom_view/bottom_library.dart';
import 'package:ebook_app/view/bottom_view/bottom_profile.dart';
import 'package:ebook_app/view/bottom_view/bottom_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomView extends StatefulWidget {
  BottomView({Key? key}) : super(key: key);

  @override
  State<BottomView> createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  late PersistentTabController _controller;
  int currentIndex = 0;
  // List<Widget> body = [
  //   Home(),
  //   BotttomLibrary(),
  //   BotttomFavorite(),
  //   BotttomProfile()
  // ];
  List<Widget> _buildScreens() {
        return [
          Home(),
          BotttomLibrary(),
          BotttomFavorite(),
          BotttomProfile()
        ];
    }
    List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.home),
                title: ("Home"),
                activeColorPrimary: Color.fromARGB(200, 110, 72, 2),
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.book),
                title: ("Library"),
                activeColorPrimary: Color.fromARGB(200, 110, 72, 2),
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
             PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.square_favorites_alt_fill),
                title: ("Favorite"),
                activeColorPrimary: Color.fromARGB(200, 110, 72, 2),
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.person),
                title: ("Profile"),
                activeColorPrimary: Color.fromARGB(200, 110, 72, 2),
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
        ];
    }
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: Scaffold(
  //        body: body[currentIndex],
  //       bottomNavigationBar: BottomNavigationBar(
  //         onTap: onTapBottomView,
  //         currentIndex: currentIndex,
  //         type: BottomNavigationBarType.fixed,
  //         items: [
  //           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
  //           BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Library'),
  //           BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: 'Favorite'),
  //           BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
  //         ],
          
  //       ),
  //     ),
  //   );
  // }
    @override
      Widget build(BuildContext context) {
        return PersistentTabView(
            context,
            controller: _controller,
            screens: _buildScreens(),
            items: _navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: Color.fromARGB(255, 246, 246, 245), // Default is Colors.white.
            handleAndroidBackButtonPress: true, // Default is true.
            resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true, // Default is true.
            hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
        );
      }
      @override
      void initState(){
        super.initState();
        _controller=PersistentTabController(initialIndex: 0);
      }
  // void onTapBottomView(int index) {
  //   setState(() {
  //     currentIndex = index;
  //   });
  // }
  
}
