import 'dart:async';

import 'package:app2025v2/views/client/components/curvas_effects/curva_superior/clipper1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;
import 'package:http/http.dart' as http;

class Curva1 extends StatefulWidget {
  const Curva1({super.key});

  @override
  State<Curva1> createState() => _Curva1State();
}

class _Curva1State extends State<Curva1> {
  final List<Map<String, String>> items = [
    {
      "image": "lib/assets/imagenes/bidon.png",
      "portada": "lib/assets/imagenes/azul.jpg",
      "title1": "Llevando vida",
      "title2": "a tu hogar!",
      "subtitle1": "Delivery",
      "subtitle2": "gratis"
    },
    {
      "image": "lib/assets/imagenes/vaso.png",
      "portada": "lib/assets/imagenes/azul2.jpg",
      "title1": "21° C",
      "title2": "que calor!",
      "subtitle1": "Refrescate",
      "subtitle2": "ahora"
    },
    {
      "image": "lib/assets/imagenes/torta.png",
      "portada": "lib/assets/imagenes/yellow1.jpg",
      "title1": "15 años",
      "title2": "aniversario",
      "subtitle1": "Incluye",
      "subtitle2": "envío gratis"
    },
    {
      "image": "lib/assets/imagenes/moto.png",
      "portada": "lib/assets/imagenes/yellow1.jpg",
      "title1": "Delivery",
      "title2": "gratis",
      "subtitle1": "Incluye",
      "subtitle2": "envío gratis"
    },
  ];

  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollController2 = ScrollController();
  late Timer _scrollTimer;
  int _currentIndex = 0;

  @override
  void dispose() {
    _scrollTimer.cancel();
    _scrollController.dispose();
    _scrollController2.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _scrollTimer = Timer.periodic(Duration(seconds: 4), (_) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % items.length;
      });
    });
  }

  Future<dynamic> temperatura() async {
    try {
      var data = http.get(Uri.parse(""));
    } catch (e) {
      throw Exception("Error en la petición $e");
    }
  }

  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(),
      child: Container(
        width: 524.w,
        height: 480.h,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(250, 204, 23, 1),
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(items[_currentIndex]["portada"]!))),

        // STACKEANDO EL FONDO
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 45, left: 12.r, right: 16.r),
              child: Column(
                children: [
                  // BARRA DE ICONO + CARRITO
                  Container(
                      height: 50.h,
                      // color: Colors.grey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 45.w,
                            height: 45.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'lib/assets/imagenes/logo.png')),
                              // color: Colors.white
                            ),
                          ),
                          badges.Badge(
                              position:
                                  badges.BadgePosition.topEnd(top: -1, end: -1),
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
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(1, 37, 255, 1),
                                      width: 2),
                                  badgeColor:
                                      const Color.fromARGB(255, 255, 255, 255)),
                              child: IconButton(
                                onPressed: () {
                                  print("Carrita");
                                },
                                icon: Icon(
                                  Icons.shopping_bag_outlined,
                                  size: 25.sp,
                                  color: Color.fromRGBO(1, 37, 255, 1),
                                ),
                              ))
                        ],
                      )),
                  SizedBox(height: 25.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // MENSAJES
                      Container(
                        height: 200.h,
                        width: 230.w,
                        //color: Colors.green,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: '${items[_currentIndex]["title1"]}\n',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50.sp,
                                      color: Color.fromRGBO(1, 37, 255, 1))),
                              TextSpan(
                                  text: '${items[_currentIndex]["title2"]}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28.sp,
                                      color: Color.fromRGBO(1, 37, 255, 1)))
                            ])),
                            SizedBox(
                              height: 18.h,
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text:
                                      '${items[_currentIndex]["subtitle1"]}\n',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                      color: Color.fromRGBO(255, 255, 255, 1))),
                              TextSpan(
                                  text: '${items[_currentIndex]["subtitle2"]}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                      color: Color.fromRGBO(255, 255, 255, 1)))
                            ]))
                          ],
                        ),
                      ),

                      // IMAGENES
                      Container(
                        height: 235.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          //  color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(items[_currentIndex]["image"]!),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            // PUNTO DE ENTREGA ES FIJO AHORA
            Positioned(
              top: 100.h,
              left: 12.w,
              child: Container(
                height: 50.h,
                width: 230.w,
                decoration: BoxDecoration(
                    // color: Colors.pink,
                    borderRadius: BorderRadius.circular(0.r)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: 'Punto de entrega - ',
                              style: GoogleFonts.manrope(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp)),
                          TextSpan(
                              text: 'CASA',
                              style: GoogleFonts.manrope(
                                  fontSize: 12.sp, fontWeight: FontWeight.bold))
                        ])),
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey.shade600,
                          size: 15.sp,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 0.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Padding(
                        padding: EdgeInsets.all(5.r),
                        child: Row(
                          children: [
                            Container(
                              width: 195.w,
                              child: Text(
                                "Calle las rosas - Sachaca - Pampa de Camarones",
                                style: GoogleFonts.manrope(
                                    color: Colors.black,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.push('/listadirecciones');
                                print("clid direccion");
                              },
                              child: Icon(
                                Icons.arrow_drop_down_circle_outlined,
                                size: 20.sp,
                                color: Color.fromRGBO(1, 37, 255, 1),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
