import 'package:app2025v2/views/client/components/curvas_effects/curva_inferior/clipper2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget curva2() {
  return ClipPath(
    clipper: MyCustomClipper2(),
    child: Container(
      height: 250.h,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('lib/assets/imagenes/azul.jpg')),
          // borderRadius: BorderRadius.circular(20.r),
          color: const Color.fromRGBO(1, 37, 255, 1)),
      child: Padding(
        padding: EdgeInsets.only(left: 18.0, top: 55, right: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 141.w,
              height: 101.h,
              //color: Colors.white,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/assets/imagenes/moto.png'))),
            ),
            Container(
              width: 160.w,
              height: 110.h,
              decoration: BoxDecoration(
                  //color: Colors.white
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivery",
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.bold,
                        fontSize: 26.sp,
                        color: Colors.white),
                  ),
                  Text(
                    "gratis!",
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.bold,
                        fontSize: 26.sp,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    "Horario 8am - 4pm",
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
