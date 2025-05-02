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
        padding: EdgeInsets.only(top: 27.r, left: 27.r, right: 27.r),
        child: Container(
          height: 1.sh,
          child: ListView.builder(
            itemCount: 58,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 100.h,
                    //color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  // fit: BoxFit.fill,
                                  image: AssetImage(
                                      'lib/assets/imagenes/bidon.png')),
                              borderRadius: BorderRadius.circular(50.r)),
                        ),
                        SizedBox(
                          width: 0.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Accesorios",
                              style: GoogleFonts.manrope(
                                  fontSize: 14.sp, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              width: 190.w,
                              // color: Colors.green,
                              child: Text(
                                "20% de descuento en el 3er tomatodo incluye tres pasajes",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: GoogleFonts.manrope(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: 50.w,
                          height: 50.w,
                          // color: Colors.amber,
                          child: Text(
                            "F:19/04",
                            style: GoogleFonts.manrope(fontSize: 14.sp),
                          ),
                        )
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
      ),
    );
  }
}
