import 'package:rive/rive.dart';

class RiveAssets {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAssets(
    this.src, {
    required this.artboard,
    required this.stateMachineName,
    required this.title,
    this.input,
  });

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAssets> bottomNavs = [
  RiveAssets(
    "assets/rive_assets/icons.riv",
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Chat",
  ),
  RiveAssets(
    "assets/rive_assets/icons.riv",
    artboard: "SEARCH",
    stateMachineName: "SEARCH_Interactivity",
    title: "Search",
  ),
  RiveAssets(
    "assets/rive_assets/icons.riv",
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Chat",
  ),
  RiveAssets(
    "assets/rive_assets/icons.riv",
    artboard: "BELL",
    stateMachineName: "BELL_Interactivity",
    title: "Notification",
  ),
  RiveAssets(
    "assets/rive_assets/icons.riv",
    artboard: "USER",
    stateMachineName: "USER_Interactivity",
    title: "Profile",
  ),
];

List<RiveAssets> sideMenus = [
  RiveAssets(
    "assets/rive_assets/icons.riv",
    artboard: "HOME",
    stateMachineName: "HOME_interactivity",
    title: "Home",
  ),
  RiveAssets(
    "assets/rive_assets/icons.riv",
    artboard: "SEARCH",
    stateMachineName: "SEARCH_Interactivity",
    title: "Search",
  ),
  RiveAssets(
    "assets/rive_assets/icons.riv",
    artboard: "LIKE/STAR",
    stateMachineName: "STAR_Interactivity",
    title: "Favorites",
  ),
  RiveAssets(
    "assets/rive_assets/icons.riv",
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Help",
  ),
];

List<RiveAssets> sideMenu2 = [
  RiveAssets(
    "assets/rive_assets/icons.riv",
    artboard: "TIMER",
    stateMachineName: "TIMER_Interactivity",
    title: "History",
  ),
  RiveAssets(
    "assets/rive_assets/icons.riv",
    artboard: "SETTINGS",
    stateMachineName: "SETTINGS_Interactivity",
    title: "Settings",
  ),
];
