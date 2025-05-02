import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollController2 = ScrollController();
  late Timer _scrollTimer;
  late Timer _scrollTimer2;
  int _currentIndex = 0;
  int _currentIndex2 = 0;
  @override
  void initState() {
    super.initState();
    _scrollTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_scrollController.hasClients) {
        _currentIndex++;
        if (_currentIndex >= 3) _currentIndex = 0;

        _scrollController.animateTo(
          _currentIndex * 188.w, // ancho del item
          duration: Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    }); /*
    _scrollTimer2 = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_scrollController2.hasClients) {
        _currentIndex2++;
        if (_currentIndex2 >= 3) _currentIndex2 = 0;

        _scrollController2.animateTo(
          _currentIndex2 * 108.w, // ancho del item
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });*/
    _scrollTimer2 = Timer.periodic(Duration(seconds: 3), (_) {
      setState(() {
        _currentIndex2 = (_currentIndex2 + 1) % images.length;
      });
    });
  }

  final List<String> images = [
    'lib/assets/imagenes/bidon.png',
    'lib/assets/imagenes/vaso.png',
    'lib/assets/imagenes/torta.png',
    'lib/assets/imagenes/moto.png',
    'lib/assets/imagenes/logo.png',
    'lib/assets/imagenes/humanbidon.png',
  ];

  @override
  void dispose() {
    _scrollTimer.cancel();
    _scrollTimer2.cancel();
    _scrollController.dispose();
    _scrollController2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                  width: 524.w,
                  height: 490.h,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(250, 204, 23, 1),
                    /*borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),*/
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 55.0, left: 12.r, right: 20.r),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 44.w,
                              height: 44.w,
                              decoration: BoxDecoration(
                                  //color: Colors.grey,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'lib/assets/imagenes/logo.png'))),
                            ),
                            Container(
                              child: Badge(
                                  largeSize: 14,
                                  child: Icon(Icons.shopify_outlined)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 217.w,
                              height: 209.h,
                              //  color: Colors.orange,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Punto de entrega - ",
                                        style: GoogleFonts.manrope(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade600),
                                      ),
                                      Text(
                                        "CASA",
                                        style: GoogleFonts.manrope(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 16.sp,
                                        color: Colors.grey.shade600,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  // DIRECCIÓN
                                  Container(
                                    width: 188.w,
                                    height: 27.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20.r)),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 11.r, right: 11.r),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              width: 133.w,
                                              child: Text(
                                                "Calle las rosas 200-Sachaca",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.manrope(
                                                    fontSize: 12.sp,
                                                    color: Colors.grey.shade600,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          GestureDetector(
                                            onTap: () {
                                              print("LLLLLLLLLLLLLLLLLLLL");
                                            },
                                            child: Icon(
                                              Icons.arrow_drop_down,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 18.h,
                                  ),
                                  Container(
                                      height: 140.5.h,
                                      width: 188.w,
                                      // color: Colors.red,
                                      child: ListView.builder(
                                          controller: _scrollController,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 3,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Llevando vida",
                                                  style: GoogleFonts.manrope(
                                                      fontSize: 28.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromRGBO(
                                                          1, 37, 255, 1)),
                                                ),
                                                Text(
                                                  "a tu hogar!",
                                                  style: GoogleFonts.manrope(
                                                      fontSize: 28.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromRGBO(
                                                          1, 37, 255, 1)),
                                                ),
                                                SizedBox(height: 14.h),
                                                /*Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                            text:
                                                                "Llevando vida\n",
                                                            style: GoogleFonts
                                                                .manrope(
                                                                    fontSize:
                                                                        28.sp,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            1,
                                                                            37,
                                                                            255,
                                                                            1),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                        TextSpan(
                                                            text: "a tu hogar!\n",
                                                            style: GoogleFonts
                                                                .manrope(
                                                                    fontSize:
                                                                        28.sp,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            1,
                                                                            37,
                                                                            255,
                                                                            1),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                      ],
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),*/
                                                Text(
                                                  "Recuerda",
                                                  style: GoogleFonts.manrope(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1)),
                                                ),
                                                Text(
                                                  "delivery gratis",
                                                  style: GoogleFonts.manrope(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1)),
                                                )
                                                // Text("Recuerda delivery gratis")
                                              ],
                                            );
                                          }))
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Container(
                              width: 140.w,
                              height: 209.h,
                              //color: Colors.orange,
                              child: Stack(
                                children: List.generate(images.length, (index) {
                                  return AnimatedOpacity(
                                    opacity:
                                        _currentIndex2 == index ? 1.0 : 0.0,
                                    duration: Duration(milliseconds: 2000),
                                    curve: Curves.easeInOut,
                                    child: Container(
                                      width: 140.w,
                                      height: 209.h,
                                      decoration: BoxDecoration(
                                        //  color: Colors.grey,
                                        image: DecorationImage(
                                          image: AssetImage(images[index]),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),

              // Tarjeta blanca justo debajo del ClipPath
              Transform.translate(
                offset: Offset(12, -95), //
                child: Padding(
                  padding: EdgeInsets.only(left: 0.r, right: 21.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40.h,
                        width: double.infinity,
                        // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        decoration: BoxDecoration(
                            //color: Colors.green,
                            ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Categorías",
                                style: GoogleFonts.manrope(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold)),
                            Text("ver más",
                                style: GoogleFonts.manrope(
                                    color: Colors.grey.shade900)),
                          ],
                        ),
                      ),
                      Container(
                        // color: Colors.grey,
                        height: 96.h,
                        width: 1.sw,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Color.fromRGBO(1, 37, 255, 1)),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Text(
                        "Novedades",
                        style: GoogleFonts.manrope(
                            fontSize: 16.sp, fontWeight: FontWeight.w200),
                      ),
                      Container(
                        height: 130,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                    width: 293.w,
                                    height: 123.h,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(1, 37, 255, 1),
                                        borderRadius:
                                            BorderRadius.circular(20.r)),
                                  ),
                                  SizedBox(
                                    width: 19.w,
                                  )
                                ],
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Mover al punto inicial (esquina superior izquierda)
    path.moveTo(0, 0);

    // Línea hasta la esquina inferior izquierda
    path.lineTo(0, size.height - 50.h);

    // Curva en la parte inferior el 2do x2 es el ancho de la curva, que se divide en la mitad de la pantalla
    path.quadraticBezierTo(
        size.width * 0.02,
        size.height * 0.75, // punto 3
        size.width * 0.15,
        size.height * 0.75); //punto 4

    //path.lineTo(size.width * 0.15, size.height * 0.75);

    path.lineTo(size.width * 0.85, size.height * 0.75);
    // Curva en la parte inferior derecha , ( los anchos no se mueven)
    path.quadraticBezierTo(
        size.width * 0.98, size.height * 0.75, size.width, size.height * 0.6);

    // Línea recta hasta la esquina superior derecha
    path.lineTo(size.width, 0);

    // Cierra el path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
