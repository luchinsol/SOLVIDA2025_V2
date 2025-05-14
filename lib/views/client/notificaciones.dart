import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Notificaciones extends StatefulWidget {
  const Notificaciones({Key? key}) : super(key: key);

  @override
  State<Notificaciones> createState() => _NotificacionesState();
}

class _NotificacionesState extends State<Notificaciones> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Notificaciones",
          style: GoogleFonts.manrope(fontSize: 16.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.r, left: 27.r, right: 27.r),
        child: Column(
          children: [
            Text(
              "02/10/2025",
              style: GoogleFonts.manrope(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade800),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 1.sh - 270.h,
              child: ListView.builder(
                itemCount: 58,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 130.h,
                        //  color: Colors.amber,
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 50.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  image: DecorationImage(
                                      // fit: BoxFit.fill,
                                      image: AssetImage(
                                          'lib/assets/imagenes/logo.png')),
                                  borderRadius: BorderRadius.circular(50.r)),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Accesorios",
                                  style: GoogleFonts.manrope(
                                      fontSize: 14.sp,
                                      color: Color.fromRGBO(1, 37, 255, 1),
                                      fontWeight: FontWeight.w400),
                                ),
                                Container(
                                  width: 210.w,
                                  height: 100.h,
                                  // color: Colors.green,
                                  child: Text(
                                    "20% de descuento en el 3er tomatodo incluye tres pasajes, incluye todos los precios,incluye todos los precios",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.justify,
                                    maxLines: 5,
                                    style: GoogleFonts.manrope(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "12:25 pm",
                                  style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.sp),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.delete_outline))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        indent: sqrt1_2,
                      ),
                      SizedBox(
                        height: 10.h,
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
