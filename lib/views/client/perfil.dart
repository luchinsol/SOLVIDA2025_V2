import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
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
          "Mi perfil",
          style: GoogleFonts.manrope(fontSize: 16.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 27.r, left: 27.r, right: 27.r),
        child: Container(
          height: 1.sh,
          child: Column(
            children: [
              // FOTO + NOMBRES
              Container(
                height: 100.h,
                //color: Colors.grey,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // FOTO DEL PERFIL
                    Container(
                      width: 100.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('lib/assets/imagenes/avion.png')),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50.r)),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jorge Perez A.",
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold, fontSize: 24.sp),
                        ),
                        Text(
                          "jorge@gmail.com",
                          style: GoogleFonts.manrope(
                            fontSize: 14.sp,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 36.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Código de referido",
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.bold, fontSize: 14.sp),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.info_outline,
                        color: Color.fromRGBO(1, 37, 255, 1),
                      ))
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.share_outlined)),
                  Text(
                    "SXASDT",
                    style: GoogleFonts.manrope(
                      fontSize: 14.sp,
                    ),
                  )
                ],
              ),
              Container(
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Billetera digital",
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.bold, fontSize: 14.sp),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.info_outline,
                        color: Color.fromRGBO(1, 37, 255, 1),
                      ))
                ],
              ),
              Column(
                children: [
                  Text(
                    "S/.100.3",
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.bold, fontSize: 30.sp),
                  ),
                  Container(
                    width: 1.sw,
                    child: ElevatedButton(
                        onPressed: () {
                          print("retirar");
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r)),
                            backgroundColor: Color.fromRGBO(1, 37, 255, 1)),
                        child: Text(
                          "Retirar monto",
                          style: GoogleFonts.manrope(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
              Container(
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Opciones",
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.bold, fontSize: 14.sp),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 1.sw,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade200,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r))),
                        onPressed: () {
                          context.push('/editarperfil');
                        },
                        child: Text(
                          "Mi perfil",
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                              color: Colors.black),
                        )),
                  ),
                  Container(
                    width: 1.sw,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade200,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r))),
                        onPressed: () {
                          context.push('/soporte');
                        },
                        child: Text(
                          "Soporte técnico",
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                              color: Colors.black),
                        )),
                  ),
                  Container(
                    width: 1.sw,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade200,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r))),
                        onPressed: () {
                          context.push('/libro');
                        },
                        child: Text(
                          "Libro de reclamaciones",
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                              color: Colors.black),
                        )),
                  ),
                  Container(
                    width: 1.sw,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(1, 37, 255, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r))),
                        onPressed: () {
                          context.go('/');
                        },
                        child: Text(
                          "Cerrar sesión",
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                              color: Colors.white),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
