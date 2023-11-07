import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/cubit/states.dart';
import 'package:shopapp/modules/favourite/favourite_screen.dart';
import 'package:shopapp/modules/home/home_screen.dart';
import 'package:shopapp/modules/search/search_screen.dart';
import 'package:shopapp/modules/settings/settings_screen.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int curentIndex = 0;

  List<BottomNavigationBarItem> bottomNavItem = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite_border_outlined,
        ),
        label: 'Favourite'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.search,
        ),
        label: 'Search'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
        label: 'Settings'),
  ];

  void changeBottomNavBar(int index) {
    curentIndex = index;
    emit(ShopBottomSheetState());
  }

  List<Widget> screens = [
    const HomeScreen(),
    const FavouriteScreen(),
    const SearchScreen(),
    const SettingsScreen(),
  ];
  List<String> title = [
    'Home',
    'Favourite',
    'Search',
    'Settings',
  ];
}
