import 'dart:math';

import 'package:app2025v2/views/client/components/pedidos/timeline.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final estados = [
  {'label': 'Pendiente', 'icon': Icons.hourglass_empty, 'color': Colors.grey},
  {'label': 'En proceso', 'icon': Icons.local_shipping, 'color': Colors.orange},
  {'label': 'Entregado', 'icon': Icons.check_circle, 'color': Colors.green},
];

Widget pedido() {
  return Column(
    children: [
      Container(
        height: 310.h,
        width: 360.w,
        decoration: BoxDecoration(),
        child: Column(
          children: [
            // TÍTULO DEL PEDIDO
            Container(
              // color: Colors.amber,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                        // color: Colors.amber,
                        image: DecorationImage(
                            image:
                                AssetImage('lib/assets/imagenes/bidon.png'))),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Container(
                    height: 50.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bidon 20L',
                          style: GoogleFonts.manrope(fontSize: 14.sp),
                        ),
                        Text(
                          "S/.25",
                          style: GoogleFonts.manrope(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: 'ID:',
                        style: GoogleFonts.manrope(fontSize: 14.sp)),
                    TextSpan(
                        text: '#123456',
                        style: GoogleFonts.manrope(
                            fontWeight: FontWeight.bold, fontSize: 14.sp))
                  ]))
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            // CONTENIDO
            Container(
              padding: EdgeInsets.only(left: 0.r, right: 0.r),
              width: 360.w,
              height: 50.h,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Row(children: [
                Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(50.r)),
                  child: Icon(
                    Icons.timer_outlined,
                    color: const Color.fromRGBO(1, 37, 255, 1),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [...List.generate(9, (index) => timeline())],
                  ),
                ),
                Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.r)),
                  child: Icon(
                    Icons.delivery_dining,
                    color: const Color.fromRGBO(1, 37, 255, 1),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [...List.generate(9, (index) => timeline())],
                  ),
                ),
                Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.r)),
                  child: Icon(
                    Icons.check,
                    color: const Color.fromRGBO(1, 37, 255, 1),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fecha: 24/05",
                        style: GoogleFonts.manrope(
                            fontWeight: FontWeight.bold, fontSize: 14.sp),
                      ),
                      Text(
                        "Hora: 8:00 am",
                        style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w500, fontSize: 14.sp),
                      ),
                      Text(
                        "Cantidad:3",
                        style: GoogleFonts.manrope(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Llega entre: 8:45 am - 11:00 am",
                        style: GoogleFonts.manrope(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(1, 37, 255, 1)),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
                  child: Chip(
                    // shadowColor: Colors.amber,
                    label: Text(
                      "pendiente",
                      style: GoogleFonts.manrope(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: Color.fromRGBO(1, 37, 255, 1)),
                    ),
                    backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Text(
                    "Dirección: ",
                    style: GoogleFonts.manrope(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade600),
                  ),
                  Container(
                    //color: Colors.green,
                    width: 280.5.w,
                    child: Text(
                      "Los Aálamos -Socabaya - Mz 3 - Av . Siempre viva",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.manrope(
                          fontSize: 14.sp, color: Colors.grey.shade600),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
                width: 1.sw,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.grey.shade300, width: 1),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Anular pedido",
                          style: GoogleFonts.manrope(
                              fontSize: 14.sp, color: Colors.red.shade200),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.cancel_outlined,
                          color: Colors.red.shade200,
                        )
                      ],
                    )))
          ],
        ),
      ),
      Divider(
        color: Colors.grey.shade300,
        indent: sqrt1_2,
      )
    ],
  );
}
