import 'package:app2025v2/providers/ubicacion_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Lista extends StatefulWidget {
  const Lista({Key? key}) : super(key: key);

  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        Provider.of<UbicacionProvider>(context, listen: false)
            .cargarUbicaciones(3);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ubicacionProvider = Provider.of<UbicacionProvider>(context);

    //int cantidadDir = 1;
    int cantidadDir = ubicacionProvider.ubicaciones.length;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          leading: Container(
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
                  ))),
          title: Text(
            "Tus direcciones",
            style: GoogleFonts.manrope(
                fontSize: 13.sp, fontWeight: FontWeight.w500),
          )),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 8.r, left: 27.r, right: 27.r),
          child: ubicacionProvider.ubicaciones.isEmpty
              ? nodireccion()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Edita tus direcciones",
                      style: GoogleFonts.manrope(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(1, 37, 255, 1)),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      "Lista",
                      style: GoogleFonts.manrope(
                        fontSize: 11.sp,
                      ),
                    ),
                    SizedBox(
                      height: 33.h,
                    ),
                    Container(
                      height: cantidadDir > 1 ? 478.h : 120.h,
                      child: ListView.builder(
                          itemCount: ubicacionProvider.ubicaciones.length,
                          itemBuilder: (context, index) {
                            final ubicacion =
                                ubicacionProvider.ubicaciones[index];
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 50.h,
                                      width: 300.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                          color: Colors.grey.shade200),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Chip(
                                                backgroundColor: Color.fromRGBO(
                                                    1, 37, 255, 1),
                                                label: Text(
                                                  ubicacion.etiqueta!,
                                                  style: GoogleFonts.manrope(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 11.sp,
                                                      color: Colors.white),
                                                )),
                                            Container(
                                              width: 200.w,
                                              child: Text(
                                                "${ubicacion.direccion} - ${ubicacion.distrito}",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: GoogleFonts.manrope(
                                                  fontSize: 11.sp,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.edit_outlined))
                                  ],
                                ),
                                SizedBox(
                                  height: 29.h,
                                ),
                              ],
                            );
                          }),
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    Container(
                      width: 350.w,
                      height: 50.h,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shadowColor:
                                  const Color.fromARGB(255, 116, 116, 116),
                              backgroundColor: Color.fromRGBO(1, 37, 255, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r))),
                          child: Text(
                            "Confirmación dirección",
                            style: GoogleFonts.manrope(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                                color: Colors.white),
                          )),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget nodireccion() {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Todavía no hay dirección",
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w300,
                  fontSize: 24.sp,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Empieza ahora",
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w300,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 350.w,
          height: 50.h,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(1, 37, 255, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            child: Text(
              "Agregar dirección",
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
