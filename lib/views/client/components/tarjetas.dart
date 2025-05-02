import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// TARJETAS
Widget tarjetas(String titulo, String subtitulo, String chip, String imagen) {
  return Row(
    children: [
      Container(
        width: 315.w,
        height: 145.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.amber,
          //color: const Color.fromRGBO(1, 37, 255, 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Color de la sombra
              spreadRadius: 5, // Qué tan expandida está la sombra
              blurRadius: 5, // Qué tan difuminada está la sombra
              offset: Offset(0, 3), // Desplazamiento de la sombra (x, y)
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 147.5.w,
              height: 138.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                // color: const Color.fromARGB(255, 112, 112, 113),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 9),
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
                    ),
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
                          softWrap: true, // Esto asegura que salte si necesita
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
                                fontWeight: FontWeight.w700, fontSize: 11.sp),
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
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.8, end: 1.0),
              duration: Duration(milliseconds: 1200),
              curve: Curves.easeOutBack,
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: child,
                );
              },
              child: Container(
                width: 152.5.w,
                height: 145.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagen),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                    topLeft: Radius.circular(60.r),
                    bottomLeft: Radius.circular(60.r),
                  ),
                  color: Colors.white,
                ),
              ),
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
