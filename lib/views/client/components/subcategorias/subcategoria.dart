import 'package:app2025v2/views/client/components/subcategorias/tarjeta_sub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget subcategoria() {
  return Container(
      height: 200.h,
      // color: const Color.fromARGB(255, 191, 34, 34),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return tarjeta_sub(context, 194, 133, 19, 100, 100);
          }));
}
