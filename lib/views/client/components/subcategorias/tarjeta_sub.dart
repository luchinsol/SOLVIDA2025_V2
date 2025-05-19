import 'package:app2025v2/models/producto_model.dart';
import 'package:app2025v2/models/promocion_model.dart';
import 'package:app2025v2/providers/generico_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

Widget tarjeta_sub({
  required BuildContext context,
  required String sub_nombre,
  required double alto,
  required double ancho,
  required double separacion_tarjeta,
  required double ima_alto,
  required double ima_ancho,
  required dynamic item,
}) {
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
                  spreadRadius: 0,
                  blurRadius: 6,
                  offset: Offset(0, 4),
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
                        if (item is ProductoModel) {
                          print("soy producto");
                          print(item);
                          print(item.id);
                          print(item.nombre);
                          print(item.valoracion);
                          print(item.fotos);
                          print(item.estilo);
                          Provider.of<GenericoProvider>(context, listen: false)
                              .setGenerico(item, sub_nombre);
                        } else if (item is PromocionModel) {
                          print("SOy promo");
                          print(item);
                          print(item.id);
                          print(item.nombre);
                          print(item.valoracion);
                          print(item.fotos);
                          print(item.estilo);
                          Provider.of<GenericoProvider>(context, listen: false)
                              .setGenerico(item, sub_nombre);
                        }
                        //  Provider<ProductoGenerico>.context().llamarProducto(item.id);
                        context.push('/detalle_producto');
                        //print("hola soy producto ${item.id}");
                      },
                      child: Container(
                        height: ima_alto.h,
                        width: ima_ancho.w,
                        decoration: BoxDecoration(
                          //color: Colors.white,
                          image: DecorationImage(
                            image: NetworkImage('${item.fotos[0]}'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    item.descuento != 0
                        ? Positioned(
                            top: 0.h,
                            right: -0.0.w,
                            child: Container(
                              width: 45.w,
                              height: 45.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                    color: Color.fromRGBO(1, 37, 255, 1)),
                              ),
                              child: Center(
                                child: Text(
                                  "${item.descuento}",
                                  style: GoogleFonts.manrope(
                                    fontSize: 14.sp,
                                    color: Color.fromRGBO(1, 37, 255, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
                Container(
                  width: 100.w,
                  child: Divider(height: 2),
                ),
                SizedBox(height: 7.h),
                Text(
                  "${item.nombre}",
                  style: GoogleFonts.manrope(
                      fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      "${item.valoracion}",
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
                          "S/.${item.precio}",
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
