import 'dart:async';

import 'package:app2025v2/views/client/components/categorias.dart';
import 'package:app2025v2/views/client/components/curvas_effects/curva_inferior/curva2.dart';
import 'package:app2025v2/views/client/components/curvas_effects/curva_superior/clipper1.dart';
import 'package:app2025v2/views/client/components/curvas_effects/curva_inferior/clipper2.dart';
import 'package:app2025v2/views/client/components/curvas_effects/curva_superior/curva1.dart';
import 'package:app2025v2/views/client/components/subcategorias/subcategoria.dart';
import 'package:app2025v2/views/client/components/tarjetas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class Inicio2 extends StatefulWidget {
  const Inicio2({Key? key}) : super(key: key);

  @override
  State<Inicio2> createState() => _Inicio2State();
}

class _Inicio2State extends State<Inicio2> {
  final PageController _pageController = PageController();
  final GlobalKey _imageKey = GlobalKey();
  late TutorialCoachMark tutorialCoachMark;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showTutorial();
    });
  }

  void _showTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: _createTargets(),
      colorShadow: const Color.fromARGB(255, 59, 59, 59),
      textSkip: "Saltar",
      paddingFocus: 3,
      opacityShadow: 0.8,
    );
    tutorialCoachMark.show(context: context);
  }

  List<TargetFocus> _createTargets() {
    return [
      TargetFocus(
        identify: "item1",
        keyTarget: _imageKey,
        shape: ShapeLightFocus.RRect, // forma rectangular
        radius: 8, // esquinas redondeadas
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Text(
              "Haz clic en la imagen para más detalles.",
              style: GoogleFonts.manrope(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      )
    ];
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CURVA 1 SUPERIROR
            Curva1(),

            // CUERPO DEL APP
            Transform.translate(
              offset: Offset(0, -60), //
              child: Padding(
                padding: EdgeInsets.only(left: 14.r, right: 14.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CATEGORÍA + VERMAS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Categorías",
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold, fontSize: 14.sp),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "ver más",
                              style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                  color: Colors.grey.shade600),
                            ))
                      ],
                    ),
                    // LIST VIEW * OJO CATEGORIAS
                    Container(
                      height: 96.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(25.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.3), // Color de la sombra
                            spreadRadius: 5, // Qué tan expandida está la sombra
                            blurRadius: 5, // Qué tan difuminada está la sombra
                            offset: Offset(
                                0, 3), // Desplazamiento de la sombra (x, y)
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          categoria('Agua', Icon(Icons.opacity_outlined), 13.5),
                          SizedBox(
                            width: 130.w,
                          ),
                          categoria('Accesorios',
                              Icon(Icons.shopping_bag_outlined), 12),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 20.h,
                    ),

                    // NOVEDADES
                    Text(
                      "Novedades",
                      style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w400, fontSize: 16.sp),
                    ),

                    Container(
                      height: 150.h,
                      key: _imageKey,
                      //color: Colors.pink,
                      child: ListView.builder(
                          controller: _pageController,
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return tarjetas(
                                '-20%',
                                'Paquetes 700ml S/.36 todo el año',
                                'Accesorios',
                                'lib/assets/imagenes/bodegon.png');
                          }),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 3, // Número de páginas
                        effect: ExpandingDotsEffect(
                          dotHeight: 3.5.h,
                          dotWidth: 15.w,
                          activeDotColor:
                              const Color.fromARGB(255, 33, 51, 170),
                          dotColor: Colors.grey.shade300,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20.h,
                    ),

                    // SUBCATEGORIAS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Navidad con Sol",
                          style: GoogleFonts.manrope(
                            fontSize: 16.sp,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              context.push('/subcategoria');
                            },
                            child: Text(
                              "ver más",
                              style: GoogleFonts.manrope(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade600),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),

                    // Subcategoria 1
                    subcategoria(),
                    SizedBox(
                      height: 20.h,
                    ),
                    subcategoria(),
                    // NOVEDADES
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Novedades",
                      style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w400, fontSize: 16.sp),
                    ),

                    Container(
                      height: 150.h,

                      //color: Colors.pink,
                      child: ListView.builder(
                          controller: _pageController,
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return tarjetas(
                                '-20%',
                                'Paquetes 700ml S/.36 todo el año',
                                'Accesorios',
                                'lib/assets/imagenes/bodegon.png');
                          }),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 3, // Número de páginas
                        effect: ExpandingDotsEffect(
                          dotHeight: 3.5.h,
                          dotWidth: 15.w,
                          activeDotColor:
                              const Color.fromARGB(255, 33, 51, 170),
                          dotColor: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // SUBCATEGORIAS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Navidad con Sol",
                          style: GoogleFonts.manrope(
                            fontSize: 16.sp,
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "ver más",
                              style: GoogleFonts.manrope(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade600),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    subcategoria(),
                    Transform.translate(
                      offset: Offset(0, 75),
                      child: Container(
                        height: 66.h,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(1, 37, 255, 1),
                            borderRadius: BorderRadius.circular(25.r)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 33.w,
                            ),
                            Icon(
                              Icons.verified,
                              color: Colors.white,
                              size: 30.sp,
                            ),
                            SizedBox(
                              width: 39.5.w,
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: 'Explora más\n',
                                  style: GoogleFonts.manrope(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600)),
                              TextSpan(
                                  text: 'novedades',
                                  style: GoogleFonts.manrope(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600))
                            ]))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // CURVA 2 INFERIOR
            curva2()
          ],
        ),
      ),
    );
  }
}
