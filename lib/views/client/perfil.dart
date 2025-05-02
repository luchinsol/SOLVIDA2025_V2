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
          "Mi cuenta",
          style: GoogleFonts.manrope(fontSize: 16.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 27.r, left: 27.r, right: 27.r),
        child: Container(
          height: 1.sh,
          child: Column(
            children: [
              Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                      // color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Row(
                    children: [
                      Container(
                        height: 50.w,
                        width: 50.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'lib/assets/imagenes/humanbidon.png')),
                            //color: Colors.amber,
                            borderRadius: BorderRadius.circular(50.r)),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "Hola, Jorge Carlos",
                        style: GoogleFonts.manrope(fontSize: 20.sp),
                      )
                    ],
                  )),
              SizedBox(
                height: 10.h,
              ),
              Divider(),
              SizedBox(
                height: 10.h,
              ),
              Column(
                children: [
                  Container(
                    height: 150.h,
                    //color: Colors.amber,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                height: 150.h,
                                width: 200.w,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 20.w,
                              )
                            ],
                          );
                        }),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      height: 50.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                          // color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Row(
                        children: [
                          Icon(Icons.person_outline),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text("Datos personales"),
                          Expanded(child: Container()),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios))
                        ],
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      height: 50.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                          //color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Row(
                        children: [
                          Icon(Icons.settings_outlined),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Configuración",
                            style: GoogleFonts.manrope(fontSize: 14.sp),
                          ),
                          Expanded(child: Container()),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios))
                        ],
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      height: 50.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                          //  color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Row(
                        children: [
                          Icon(Icons.logout_outlined),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Cerrar sesión",
                            style: GoogleFonts.manrope(fontSize: 14.sp),
                          ),
                          Expanded(child: Container()),
                          IconButton(
                              onPressed: () {
                                context.go('/');
                              },
                              icon: Icon(Icons.arrow_forward_ios))
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
