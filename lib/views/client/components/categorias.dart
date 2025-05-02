import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// CATEGORÍA
Widget categoria(String nombre, Icon icono, double tamanio) {
  return Container(
    width: 80.w,
    height: 71.h,
    decoration: BoxDecoration(

        // color: const Color.fromARGB(255, 245, 245, 245),
        borderRadius: BorderRadius.circular(15.r)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 50.w,
          height: 50.w,
          decoration: BoxDecoration(
              // color: const Color.fromARGB(255, 255, 255, 255),
              color: const Color.fromRGBO(1, 37, 255, 1),
              borderRadius: BorderRadius.circular(50.r)),
          child: Center(
              child: IconButton(
            onPressed: () {},
            icon: icono,
            color: Colors.white,
            //color: const Color.fromRGBO(1, 37, 255, 1),
          )),
        ),
        Text(
          nombre,
          style: GoogleFonts.manrope(
              color: Color.fromRGBO(1, 37, 255, 1),
              //color: Colors.white,
              fontSize: tamanio.sp,
              fontWeight: FontWeight.w600),
        )
      ],
    ),
  );
}
