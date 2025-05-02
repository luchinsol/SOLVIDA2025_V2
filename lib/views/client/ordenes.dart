import 'dart:math';

import 'package:app2025v2/views/client/components/pedidos/pedido.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Ordenes extends StatefulWidget {
  const Ordenes({Key? key}) : super(key: key);

  @override
  State<Ordenes> createState() => _OrdenesState();
}

class _OrdenesState extends State<Ordenes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          /*leading: Container(
              margin: EdgeInsets.only(left: 20.r),
              width: 30.w,
              height: 10.w,
              decoration: BoxDecoration(
                  //color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(50.r)),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 13.sp,
                  ))),*/
          title: Text(
            'Pedidos',
            style: GoogleFonts.manrope(fontSize: 16.sp),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 27.r, left: 27.r, right: 27.r),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      indent: sqrt1_2,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Container(
                      child: Text(
                    "Hoy",
                    style: GoogleFonts.manrope(fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      indent: sqrt1_2,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                  //color: Colors.amber,
                  height: 1.sh - 300.h,
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return pedido();
                    },
                  )),
            ],
          ),
        ));
  }
}
