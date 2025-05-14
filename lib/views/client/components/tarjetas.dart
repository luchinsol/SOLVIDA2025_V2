import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// TARJETAS
Widget tarjetas(String titulo, String subtitulo, String chip, String imagen) {
  return Row(
    children: [
      // EXTERNO
      Container(
        width: 293.w,
        height: 172.h,
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(20.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // INTERNO
            Container(
              width: 293.w,
              height: 135.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Colors.grey,
                //color: const Color.fromRGBO(1, 37, 255, 1),
                /*boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3), // Color de la sombra
                    spreadRadius: 5, // Qué tan expandida está la sombra
                    blurRadius: 5, // Qué tan difuminada está la sombra
                    offset: Offset(0, 3), // Desplazamiento de la sombra (x, y)
                  ),
                ],*/
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // MENSAJE O DESCRIPCION
                  Container(
                    width: 138.w,
                    height: 135.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      // color: const Color.fromARGB(255, 67, 67, 126),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            titulo,
                            style: GoogleFonts.manrope(
                                fontSize: 26.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ).animate().shake(
                              duration: 1.seconds, curve: Curves.easeInOut),
                          Container(
                              height: 40.h,
                              //color: Colors.grey,
                              child: Text(
                                subtitulo,
                                style: GoogleFonts.manrope(
                                  fontSize: 13.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                softWrap:
                                    true, // Esto asegura que salte si necesita
                              )),
                          Container(
                            width: 100.w, // o el que necesites
                            // height: 30.h,
                            child: Chip(
                              label: Center(
                                child: Text(
                                  chip,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 11.sp),
                                ),
                              ),
                              backgroundColor: Colors.white,
                              shape: StadiumBorder(
                                side: BorderSide(
                                  color: Colors.blue,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 155.w,
                    height: 145.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imagen),
                        // fit: BoxFit.contain,
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.r),
                        bottomRight: Radius.circular(20.r),
                        topLeft: Radius.circular(60.r),
                        bottomLeft: Radius.circular(60.r),
                      ),
                      color: Colors.white,
                    ),
                  ).animate().scale(
                      duration: 1.seconds,
                      begin: Offset(0.7, 0.7),
                      end: Offset(1.0, 1.0)),
                ],
              ),
            ),
            SizedBox(
              height: 11.h,
            ),
            Text(
              "* Válido solo para compras mayores a S/.10",
              style: GoogleFonts.manrope(
                  fontSize: 10.sp, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
      SizedBox(
        width: 19.w,
      )
    ],
  );
}
