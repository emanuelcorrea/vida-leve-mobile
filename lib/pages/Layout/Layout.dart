import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vidaleve/pages/Home/HomePage.dart';
import 'package:vidaleve/pages/PatientList/PatientListPage.dart';
import 'package:vidaleve/utils/authentication_service.dart';
import 'package:vidaleve/widgets/ToastNotification/ToastNotification.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  PageController _myPage = PageController(initialPage: 1);
  var _selectedPage = 0;

  
  @override
  Widget build(BuildContext context) {
    final _authService = AuthenticationService();

    void onItemTapped(int index) {
      setState(() {
        // if (index == 3) {
        //   Navigator.pushNamed(context, '/patient-list');
        // }

        _selectedPage = index;

        if (index == 4) {
          ToastNotification.message(context,
              message: 'Saída efetuada com sucesso!');
          _authService.logout();

          Navigator.pushNamed(context, '/login');
        } else {
          _myPage.jumpToPage(index);
        }
      });
    }

    return Scaffold(
      body: PageView(
        /// [PageView.scrollDirection] defaults to [Axis.horizontal].
        /// Use [Axis.vertical] to scroll vertically.
        controller: _myPage,
        children: const <Widget>[
          HomePage(),
          HomePage(),
          HomePage(),
          PatientListPage(),
          HomePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout, color: Colors.red),
            label: '',
          ),
        ],
        currentIndex: _selectedPage,
        fixedColor: const Color(0xFF00588A),
        onTap: onItemTapped,
      )
    );
  }
}