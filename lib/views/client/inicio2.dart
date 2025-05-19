import 'dart:async';

import 'package:app2025v2/models/subcategoria_model.dart';
import 'package:app2025v2/providers/categoria_inicio_provider.dart';
import 'package:app2025v2/providers/categoria_provider.dart';
import 'package:app2025v2/providers/evento_provider.dart';
import 'package:app2025v2/views/client/components/categorias.dart';
import 'package:app2025v2/views/client/components/curvas_effects/curva_inferior/curva2.dart';
import 'package:app2025v2/views/client/components/curvas_effects/curva_superior/clipper1.dart';
import 'package:app2025v2/views/client/components/curvas_effects/curva_inferior/clipper2.dart';
import 'package:app2025v2/views/client/components/curvas_effects/curva_superior/curva1.dart';
import 'package:app2025v2/views/client/components/subcategorias/subcategoria.dart';
import 'package:app2025v2/views/client/components/tarjetas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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

  /* @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showTutorial();
    });*
  }*/

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

  void _scrollArriba() {
    _scrollControllerInicio.animateTo(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _scrollTimer.cancel();
    _bannerController.dispose();

    super.dispose();
  }

  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollController2 = ScrollController();
  final ScrollController _scrollControllerInicio = ScrollController();
  late Timer _scrollTimer;
  int _currentIndex = 0;
  final PageController _bannerController = PageController();
  int _bannerIndex = 0;

  @override
  void initState() {
    super.initState();

    // Llama una vez para obtener los eventos
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        Provider.of<EventoProvider>(context, listen: false).getEventos();
      }
    });

    // Llama una vez para obtener los eventos
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        Provider.of<CategoriaInicioProvider>(context, listen: false)
            .getCategoriaSubcategoria(null);
      }
    });

    Future.microtask(() {
      Provider.of<CategoriaProvider>(context, listen: false).getCategorias();
    });

    _scrollTimer = Timer.periodic(Duration(seconds: 4), (_) {
      if (!mounted) return;

      final eventos =
          Provider.of<EventoProvider>(context, listen: false).todoseventos;

      if (eventos.isEmpty) return;

      final eventoActual = eventos[_currentIndex];
      final banners = eventoActual.banners;

      if (banners.isEmpty) return;
      setState(() {
        // Si aún hay más banners en el evento actual
        if (_bannerIndex < banners.length - 1) {
          _bannerIndex += 1;
        } else {
          // Pasamos al siguiente evento
          _currentIndex = (_currentIndex + 1) % eventos.length;
          _bannerIndex = 0;
        }

        if (_bannerController.hasClients) {
          _bannerController.jumpToPage(_bannerIndex);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final eventos = context.watch<EventoProvider>().todoseventos;
    // Aquí construyes tu vista
    final categorias = context.watch<CategoriaProvider>().allcategorias;
    final categoriaInicio =
        context.watch<CategoriaInicioProvider>().allcategoria_subcategoria;
    //String nombre

    // ⛔ Asegurarse de que hay eventos antes de seguir
    if (eventos.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator()),
      );
    }
    final eventoactual = eventos[_currentIndex];
    final banners = eventoactual.banners;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _scrollControllerInicio,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CURVA 1 SUPERIROR
            Stack(
              children: [
                // CURVA
                Curva1(
                  currentIndex: _currentIndex,
                  fondo: eventoactual.fondofoto,
                ),

                // MENSAJES
                Positioned(
                  top: 160.h,
                  left: 12.w,
                  child: GestureDetector(
                      onTap: () {
                        print("object");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // MENSAJES
                          Container(
                            height: 200.h,
                            width: 248.w,
                            //color: Colors.green,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text.rich(
                                  TextSpan(children: [
                                    TextSpan(
                                        text:
                                            '${banners[_bannerIndex].titulo}\n',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.sp,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1))),
                                    TextSpan(
                                        text:
                                            '${banners[_bannerIndex].descripcion}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1)))
                                  ]),
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: 18.h,
                                ),
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text:
                                          '${banners[_bannerIndex].restriccion}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp,
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1)))
                                ]))
                              ],
                            ),
                          ),
                        ],
                      )),
                ),

                // IMAGEN SOBREPUESTA
                Positioned(
                  top: 160.h,
                  right: 8.w,
                  child: // IMAGENES
                      Container(
                    height: 235.h,
                    width: 140.w,
                    child: PageView.builder(
                        controller: _bannerController,
                        itemCount: banners.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 235.h,
                            width: 140.w,
                            decoration: BoxDecoration(
                              //  color: const Color.fromARGB(255, 100, 125, 134),
                              image: DecorationImage(
                                image: AssetImage(
                                    'lib/assets/imagenes/${banners[_bannerIndex].foto}'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),

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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: categorias.map((item) {
                          return categoria(context, item);
                        }).toList(),
                      ),
                    ),

                    SizedBox(
                      height: 31.h,
                    ),

                    // NOVEDADES
                    Text(
                      "Novedades",
                      style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w400, fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    Container(
                      height: 172.h,
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
                    /*Center(
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
                    ),*/

                    SizedBox(
                      height: 15.h,
                    ),

                    // SUBCATEGORIA 1
                    for (int i = 0;
                        i < (categoriaInicio?.subcategorias.length ?? 0);
                        i++) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            categoriaInicio!.subcategorias[i].nombre, // nombre
                            style: GoogleFonts.manrope(
                              fontSize: 16.sp,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                categoriaInicio.subcategorias[i];
                                print("-----------");
                                print("${categoriaInicio.nombre}");
                                print("${categoriaInicio.subcategorias[i].id}");
                                print(
                                    "${categoriaInicio.subcategorias[i].nombre}");
                                print("-------------");
                                // context.push('/subcategoria');
                                // se llama a un provider , donde se le pasa el
                                // id de la subcategori: localhost:20/subacta/{id}
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
                        height: 10.h,
                      ), // Subcategoria 1
                      subcategoria(categoriaInicio!.subcategorias[i]),

                      if (i == 0) ...[
                        SizedBox(
                          height: 50.h,
                        ),

                        //CONTAINER DE TEMPERATURA

                        Stack(
                          clipBehavior: Clip
                              .none, // ¡Esto es clave para que el vaso se salga!
                          children: [
                            // Container base (el rojo)
                            Container(
                              width: 1.sw,
                              height: 140,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('21°C',
                                      style: GoogleFonts.manrope(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 40,
                                          color: Colors.white)),
                                  Text('¡Qué calor!',
                                      style: GoogleFonts.manrope(
                                          fontSize: 20.sp,
                                          color: Colors.white)),
                                  Text('Mantente siempre hidratado',
                                      style: GoogleFonts.manrope(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp,
                                          color: Colors.white70)),
                                ],
                              ),
                            ),

                            // Vaso que se sale del Container
                            Positioned(
                              right: 15, // Ajusta este valor según tu diseño
                              top:
                                  -30, // Puedes moverlo también hacia arriba si quieres
                              child: Container(
                                height: 200.w,
                                width: 140.h,
                                decoration: BoxDecoration(
                                    //color: Colors.grey,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'lib/assets/imagenes/vaso.png'))),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 28.h,
                        ),
                      ]
                    ], // FIN DEL FOR

                    SizedBox(
                      height: 23.h,
                    ),
                    // subcategoria(),

                    // SUBCATEGORIA 2
                    /*
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Otoño con Sol",
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
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    // Subcategoria 1
                    subcategoria(),
                    SizedBox(
                      height: 23.h,
                    ),
                    subcategoria(),
                    SizedBox(
                      height: 15.h,
                    ),*/

                    // NOVEDADES
                    Text(
                      "Novedades",
                      style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w400, fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    Container(
                      height: 172.h,

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
                    /*Center(
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
                    ),*/
                    // SUBCATEGORIAS

                    SizedBox(
                      height: 7.h,
                    ),

                    Transform.translate(
                      offset: Offset(0, 55),
                      child: Container(
                        height: 66.h,
                        decoration: BoxDecoration(
                            //color: const Color.fromRGBO(1, 37, 255, 1),
                            borderRadius: BorderRadius.circular(25.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 87.w,
                              height: 87.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'lib/assets/imagenes/logo.png'))),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              "! Llevando vida a tu hogar !",
                              style: GoogleFonts.manrope(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(1, 37, 255, 1)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // CURVA 2 INFERIOR
            curva2(onVolverArriba: _scrollArriba)
          ],
        ),
      ),
    );
  }
}
