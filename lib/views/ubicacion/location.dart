import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final TextEditingController _username = TextEditingController();
  String? _selectedDepartamento; // Agrega esto a tu clase
  String? _selectedDistrito; // Agrega esto a tu clase

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
          backgroundColor: Colors.white,
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
            "Indicaciones del pedido",
            style: GoogleFonts.manrope(
                fontSize: 13.sp, fontWeight: FontWeight.w500),
          )),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 8.r, left: 27.r, right: 27.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Agrega tu dirección",
                style: GoogleFonts.manrope(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(1, 37, 255, 1)),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Ingresa tu información abajo",
                style: GoogleFonts.manrope(
                  fontSize: 11.sp,
                ),
              ),
              SizedBox(
                height: 33.h,
              ),
              Form(
                  child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    value: _selectedDepartamento,
                    items: ['Arequipa', 'Moquegua', 'Lima']
                        .map((departamento) => DropdownMenuItem(
                              value: departamento,
                              child: Text(departamento),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedDepartamento = value;
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_searching),
                      labelText: "Departamento",
                      hintText: "Selecciona un departamento",
                      labelStyle: GoogleFonts.manrope(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      filled: true,
                      fillColor: Color.fromRGBO(246, 246, 246, 1),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  SizedBox(
                    height: 41.h,
                  ),
                  /*TextFormField(
                    controller: _username,
                    decoration: InputDecoration(
                      /*contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.sp, ver  ical: 16.sp),*/
                      prefixIcon: Icon(
                        Icons.maps_home_work,
                      ),
                      labelText: "Departamento",
                      labelStyle: GoogleFonts.manrope(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      filled: true,
                      fillColor:
                          Color.fromRGBO(246, 246, 246, 1), // Fondo blanco
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  SizedBox(
                    height: 41.h,
                  ),*/
                  DropdownButtonFormField<String>(
                    value: _selectedDistrito,
                    items: ['Sachaca', 'M.Melgar']
                        .map((departamento) => DropdownMenuItem(
                              value: departamento,
                              child: Text(departamento),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedDistrito = value;
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_city),
                      labelText: "Distrito",
                      hintText: "Selecciona un distrito",
                      hintStyle: GoogleFonts.manrope(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      labelStyle: GoogleFonts.manrope(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      filled: true,
                      fillColor: Color.fromRGBO(246, 246, 246, 1),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  SizedBox(
                    height: 41.h,
                  ),
                  TextFormField(
                    controller: _username,
                    decoration: InputDecoration(
                      /*contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.sp, ver  ical: 16.sp),*/
                      prefixIcon: Icon(
                        Icons.map_outlined,
                      ),
                      labelText: "Dirección",
                      hintText: "Ej. Av. Sol",
                      hintStyle: GoogleFonts.manrope(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      labelStyle: GoogleFonts.manrope(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      filled: true,
                      fillColor:
                          Color.fromRGBO(246, 246, 246, 1), // Fondo blanco
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  SizedBox(
                    height: 41.h,
                  ),
                  TextFormField(
                    controller: _username,
                    decoration: InputDecoration(
                      /*contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.sp, ver  ical: 16.sp),*/
                      prefixIcon: Icon(
                        Icons.maps_home_work_outlined,
                      ),
                      labelText: "Número/Mz./Lote",
                      hintText: "Ej. 200/F/2",
                      hintStyle: GoogleFonts.manrope(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      labelStyle: GoogleFonts.manrope(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      filled: true,
                      fillColor:
                          Color.fromRGBO(246, 246, 246, 1), // Fondo blanco
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  SizedBox(
                    height: 41.h,
                  ),
                  TextFormField(
                    controller: _username,
                    decoration: InputDecoration(
                      /*contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.sp, ver  ical: 16.sp),*/
                      prefixIcon: Icon(
                        Icons.label_outline,
                      ),

                      labelText: "Etiqueta tu dirección",
                      hintText: "Ej. Casa / Oficina / Novia",
                      hintStyle: GoogleFonts.manrope(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      labelStyle: GoogleFonts.manrope(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      filled: true,
                      fillColor:
                          Color.fromRGBO(246, 246, 246, 1), // Fondo blanco
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ],
              )),
              SizedBox(
                height: 45.h,
              ),
              Container(
                width: 350.w,
                height: 50.h,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shadowColor: const Color.fromARGB(255, 116, 116, 116),
                        backgroundColor: Color.fromRGBO(1, 37, 255, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r))),
                    child: Text(
                      "Continuar",
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
}
