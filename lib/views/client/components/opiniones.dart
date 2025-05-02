import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget opiniones() {
  return Container(
    height: 45.w,
    color: Colors.grey.shade50,
    child: Row(
      children: [
        Container(
          width: 45.w,
          height: 45.w,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              image: DecorationImage(
                  image: AssetImage('lib/assets/imagenes/humanbidon.png')),
              borderRadius: BorderRadius.circular(50.r)),
        ),
        SizedBox(
          width: 15.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Margarita Alvarez",
              style: GoogleFonts.manrope(
                  fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
            Row(
              children: [
                Text(
                  '4.5',
                  style: GoogleFonts.manrope(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                )
              ],
            ),
          ],
        )
      ],
    ),
  );
}
