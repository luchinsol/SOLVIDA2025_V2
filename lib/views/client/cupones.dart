import 'package:app2025v2/views/sol.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Cupones extends StatefulWidget {
  const Cupones({Key? key}) : super(key: key);

  @override
  State<Cupones> createState() => _CuponesState();
}

class _CuponesState extends State<Cupones> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final List<String> chips = [
    'Todo',
    'Agua',
    'Accesorios',
    'Hogar',
    'Agua',
    'Accesorios',
    'Hogar'
  ];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5), // Tiempo para una vuelta
      vsync: this,
    )..repeat(); // Repite infinitamente
  }

  @override
  void dispose() {
    _controller.dispose(); // Siempre se limpia
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromRGBO(1, 37, 255, 1),
      backgroundColor: Colors.white,
      appBar: AppBar(
        //backgroundColor: Color.fromRGBO(1, 37, 255, 1),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        title: Text(
          "Cupones",
          style: GoogleFonts.manrope(fontSize: 15.sp, color: Colors.black),
        ),
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 120,
                width: 1.sw,
                decoration: BoxDecoration(
                    /*image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('lib/assets/imagenes/fiesta.jpg'),
                  ),*/
                    color: Color.fromRGBO(33, 55, 255, 1)),
                child: Padding(
                  padding: EdgeInsets.only(left: 16.r, right: 16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedTextKit(
                        animatedTexts: [
                          ColorizeAnimatedText(
                            '¡Descuentos increibles!',
                            textStyle: GoogleFonts.manrope(
                              fontSize: 20.sp,
                            ),
                            colors: [
                              Colors.white,
                              Colors.amber,
                              Colors.red,
                              Colors.lightGreenAccent,
                            ],
                          ),
                        ],
                        repeatForever: true,
                        isRepeatingAnimation: true,
                      ).animate().shake(duration: 1.seconds).scale(
                          duration: 1.seconds,
                          begin: Offset(0.7, 0.7),
                          end: Offset(1.0, 1.0)),
                      Text(
                        "%off",
                        style: GoogleFonts.manrope(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 55.sp,
                            letterSpacing: 25),
                      ),
                      RotationTransition(
                          turns: _controller,
                          child: WavySun(size: Size(100, 100)))

                      /* Container(
                        height: 65.h,
                        child: AnimatedTextKit(
                          animatedTexts: [
                            RotateAnimatedText('AWESOME'),
                            RotateAnimatedText('OPTIMISTIC'),
                            RotateAnimatedText('DIFFERENT'),

                            /*
                            ScaleAnimatedText('%off',
                                scalingFactor: 0.8,
                                textStyle: GoogleFonts.manrope(
                                    fontSize: 50, color: Colors.white)),
                            ScaleAnimatedText('%off',
                                scalingFactor: 0.8,
                                textStyle: GoogleFonts.manrope(
                                    fontSize: 50, color: Colors.white)),*/
                          ],
                          repeatForever: true,
                          isRepeatingAnimation: true,
                          onTap: () {
                            print("Tap Event");
                          },
                        ),
                      ),*/
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 10,
                  left: 10,
                  /* child: RotationTransition(
                    turns: _controller,*/
                  child: Container(
                    width: 155.w,
                    height: 155.w,
                    decoration: BoxDecoration(
                        // color: Colors.amber,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                AssetImage('lib/assets/imagenes/money.png'))),
                    //),
                  ))
            ],
          ),
          SizedBox(
            height: 60.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.r, right: 16.r),
            child: Column(
              children: [
// FILTROS DE SELECCIÓN CATEGORÍAS
                Container(
                  height: 40.h,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    Row(
                      children: List.generate(chips.length, (index) {
                        final bool isSelected = selectedIndex == index;

                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                                print("Select $selectedIndex");
                              });
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              decoration: BoxDecoration(
                                color:
                                    isSelected ? Colors.orange : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              child: Text(
                                chips[index],
                                style: GoogleFonts.manrope(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.grey.shade600,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 30.h,
                ),
                // Sección Cupón
                Container(
                  height: 1.sh - 420.h,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 191.h,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Column(
                              children: [
                                Container(
                                  height: 148.h,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'lib/assets/imagenes/fiesta.jpg')),
                                      color: Colors.amber,
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      RotatedBox(
                                        quarterTurns: -1,
                                        child: Text(
                                          "Descuento",
                                          style: GoogleFonts.manrope(
                                              fontSize: 23.sp,
                                              fontWeight: FontWeight.w200),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: List.generate(
                                            19,
                                            (int index) => Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 2.5,
                                                      height: 2.5,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      height: 5.0,
                                                    )
                                                  ],
                                                )),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 85.w,
                                                height: 85.h,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.r),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'lib/assets/imagenes/logo.png'))),
                                              ),
                                              SizedBox(
                                                width: 30.w,
                                              ),
                                              Text(
                                                "-25%",
                                                style: GoogleFonts.manrope(
                                                    color: Colors.white,
                                                    fontSize: 55.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "¡Genial! obtuviste un descuento en tu pedido",
                                            style: GoogleFonts.manrope(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.0, top: 5.r),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "* Válido ingresando el código de referido",
                                            style: GoogleFonts.manrope(
                                                color: Color.fromRGBO(
                                                    1, 37, 255, 1),
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "* Válido: 25 Julio - 30 Agosto",
                                            style: GoogleFonts.manrope(
                                                color: Colors.white,
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      Container(
                                        width: 110.w,
                                        height: 26.h,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              print("usar ahora");
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white),
                                            child: Text(
                                              "Usar cupón",
                                              style: GoogleFonts.manrope(
                                                  fontSize: 11.sp,
                                                  color: Color.fromRGBO(
                                                      1, 37, 255, 1),
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
