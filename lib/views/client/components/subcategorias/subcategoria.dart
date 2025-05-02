import 'package:app2025v2/views/client/components/subcategorias/tarjeta_sub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget subcategoria() {
  return Container(
      height: 194.h,
      //color: Colors.grey,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return tarjeta_sub(context, 194, 128, 19, 100, 100);
          }));
}
