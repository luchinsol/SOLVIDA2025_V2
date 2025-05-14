import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

IconData getIcono(String tipo) {
  switch (tipo) {
    case 'agua':
      return Icons.opacity_outlined;
    case 'accesorios':
      return Icons.backpack_outlined;
    default:
      return Icons.help_outline;
  }
}

// CATEGORÍA
Widget categoria(String nombre, String icono) {
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
            icon: Icon(getIcono(nombre)),
            color: Colors.white,
            //color: const Color.fromRGBO(1, 37, 255, 1),
          )),
        ),
        Text(
          nombre,
          style: GoogleFonts.manrope(
              color: Color.fromRGBO(1, 37, 255, 1),
              //color: Colors.white,
              fontSize: 13.5.sp,
              fontWeight: FontWeight.w600),
        )
      ],
    ),
  );
}
