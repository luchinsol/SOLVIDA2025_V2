import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCarrito extends StatefulWidget {
  const ItemCarrito({super.key});

  @override
  State<ItemCarrito> createState() => _ItemCarritoState();
}

class _ItemCarritoState extends State<ItemCarrito> {
  int contador = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 119.h,
          width: 1.sw - 130.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 55.w,
                    height: 55.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'lib/assets/imagenes/setecientos.png'))),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Promoción Smart Fresh",
                        style: GoogleFonts.manrope(
                            fontWeight: FontWeight.bold, fontSize: 14.sp),
                      ),
                      Row(
                        children: [
                          Text(
                            "S/.20.00",
                            style: GoogleFonts.manrope(
                                fontSize: 12.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10.w),
                          Container(
                            height: 30.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(1, 37, 255, 1),
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Center(
                              child: Text(
                                "10%",
                                style: GoogleFonts.manrope(
                                    fontSize: 12.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              Container(
                width: 140.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (contador > 1) contador--;
                          });
                        },
                        icon: Icon(Icons.remove)),
                    Text(
                      "$contador",
                      style: GoogleFonts.manrope(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      color: Color.fromRGBO(1, 37, 255, 1),
                      onPressed: () {
                        setState(() {
                          if (contador < 99) contador++;
                        });
                      },
                      icon: Icon(Icons.add),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.delete_outline)),
      ],
    );
  }
}
