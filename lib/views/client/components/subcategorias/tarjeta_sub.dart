import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

Widget tarjeta_sub(BuildContext context, double alto, double ancho,
    double separacion_tarjeta, double ima_alto, double ima_ancho) {
  return Padding(
    padding: const EdgeInsets.all(1.0),
    child: Row(
      children: [
        Container(
          height: alto.h, //194.h,
          width: ancho.w, //128.w,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 202, 201, 201).withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
              //color: Color.fromRGBO(1, 37, 255, 1),
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r)),
          child: Padding(
            padding: EdgeInsets.only(top: 6.0.r, left: 14.r, right: 14.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.push('/detalle_producto');
                        print("hola soy 2");
                      },
                      child: Container(
                        height: ima_alto.h,
                        width: ima_ancho.w,
                        decoration: BoxDecoration(
                          //color: Colors.white,
                          image: DecorationImage(
                            image:
                                AssetImage('lib/assets/imagenes/recargas.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0.h,
                      right: -0.0.w,
                      child: Container(
                        width: 45.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          border:
                              Border.all(color: Color.fromRGBO(1, 37, 255, 1)),
                        ),
                        child: Center(
                          child: Text(
                            "-10%",
                            style: GoogleFonts.manrope(
                              fontSize: 14.sp,
                              color: Color.fromRGBO(1, 37, 255, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 100.w,
                  child: Divider(height: 2),
                ),
                SizedBox(height: 7.h),
                Text(
                  "Recarga",
                  style: GoogleFonts.manrope(
                      fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      "4.5",
                      style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w400, fontSize: 12.sp),
                    ),
                    Icon(
                      Icons.star_rounded,
                      size: 16.sp,
                      color: Colors.amber,
                    )
                  ],
                ),
                SizedBox(height: 8.h),
                Container(
                  height: 24.h,
                  width: 108.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Und",
                          style: GoogleFonts.manrope(
                              fontSize: 12.sp, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "S/.12",
                          style: GoogleFonts.manrope(
                              fontSize: 12.sp, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 24.w,
                          height: 24.w,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(1, 37, 255, 1),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 14.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: separacion_tarjeta.w),
      ],
    ),
  );
}
