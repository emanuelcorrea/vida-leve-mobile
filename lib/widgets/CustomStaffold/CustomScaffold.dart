import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  List<String> hideFloating = ['/help-gpt', '/help-gpt-chat'];

  bool _isFloatingVisible(String location) {
    return !hideFloating.map((e) => location.contains(e)).contains(true);
  }

  bool get isFloatingVisible =>
      _isFloatingVisible(GoRouter.of(context).location);

  int _locationToTabIndex(String location) {
    final index = tabs.indexWhere((t) {
      List<String> splittedLocation = location.split('/');
      List<String> splitted = t.initialLocation.split('/');

      return splittedLocation[1] == splitted[1];
    });

    return index < 0 ? 0 : index;
  }

  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      context.go(tabs[tabIndex].initialLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: tabs,
          fixedColor: const Color(0xFF00588A),
          onTap: (index) => _onItemTapped(context, index),
        ),
        floatingActionButton: isFloatingVisible
            ? FloatingActionButton.extended(
                onPressed: () {
                  context.go('/help-gpt');
                },
                label: Text('Ajuda',
                    style: GoogleFonts.jost(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18)),
                icon: const Icon(Icons.live_help_rounded),
                backgroundColor: const Color(0xFF00588A),
              )
            : null);
  }
}

class NavbarItem extends BottomNavigationBarItem {
  const NavbarItem({
    required this.initialLocation,
    required Widget icon,
    String? label,
  }) : super(icon: icon, label: label);

  final String initialLocation;
}

const tabs = [
  NavbarItem(
    initialLocation: '/home',
    icon: Icon(Icons.home),
    label: '',
  ),
  NavbarItem(
    initialLocation: '/calendar',
    icon: Icon(Icons.calendar_today_outlined),
    label: '',
  ),
  NavbarItem(
    initialLocation: '/patients',
    icon: Icon(Icons.people_outline),
    label: '',
  ),
  NavbarItem(
    initialLocation: '/profile',
    icon: Icon(Icons.person),
    label: '',
  ),
  NavbarItem(
    initialLocation: '/logout',
    icon: Icon(Icons.logout, color: Colors.red),
    label: '',
  ),
];
