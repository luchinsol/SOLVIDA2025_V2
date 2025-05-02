import 'package:app2025v2/views/client/inicio.dart';
import 'package:app2025v2/views/client/inicio2.dart';
import 'package:app2025v2/views/client/notificaciones.dart';
import 'package:app2025v2/views/client/ordenes.dart';
import 'package:app2025v2/views/client/perfil.dart';

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BarraNavegacion extends StatefulWidget {
  const BarraNavegacion({Key? key}) : super(key: key);

  @override
  State<BarraNavegacion> createState() => _BarraNavegacionState();
}

class _BarraNavegacionState extends State<BarraNavegacion> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _screens = const [
    Inicio2(),
    Ordenes(),
    Notificaciones(),
    Perfil(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        backgroundColor: const Color.fromRGBO(1, 37, 255, 1),
        color: const Color.fromARGB(255, 255, 255, 255),
        animationDuration: const Duration(milliseconds: 300),
        items: [
          Icon(
            Icons.home_outlined,
            size: 30,
            color: const Color.fromRGBO(1, 37, 255, 1),
          ),
          Icon(Icons.assignment_outlined, size: 30, color: Colors.black),
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: -15, end: -15),
            badgeContent: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                '3',
                style: GoogleFonts.manrope(
                    color: Color.fromRGBO(1, 37, 255, 1),
                    fontWeight: FontWeight.bold),
              ),
            ),
            showBadge: true,
            badgeStyle: badges.BadgeStyle(
                borderRadius: BorderRadius.circular(4),
                borderSide:
                    BorderSide(color: Color.fromRGBO(1, 37, 255, 1), width: 2),
                badgeColor: const Color.fromARGB(255, 255, 255, 255)),
            child: Icon(Icons.notifications_on_outlined,
                size: 30.sp, color: Colors.black),
          ),
          Icon(Icons.person_outline, size: 30, color: Colors.black),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index);
        },
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
    );
  }
}
