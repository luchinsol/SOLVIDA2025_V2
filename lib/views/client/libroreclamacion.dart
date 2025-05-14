import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Libroreclamacion extends StatefulWidget {
  const Libroreclamacion({Key? key}) : super(key: key);

  @override
  State<Libroreclamacion> createState() => _LibroreclamacionState();
}

class _LibroreclamacionState extends State<Libroreclamacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Libro de reclamaciones",
          style: GoogleFonts.manrope(fontSize: 14.sp),
        ),
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ingrese la información",
                style: GoogleFonts.manrope(
                    fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.h,
              ),
              Form(
                  child: Column(
                children: [
                  // NOMBRES
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.account_circle_outlined),
                      Container(
                        width: 1.sw - 80.w,
                        child: TextFormField(
                          // controller: _asunto,
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold,
                              fontSize: 11.sp,
                              color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Nombres',
                            hintStyle: GoogleFonts.manrope(fontSize: 11.sp),
                            // prefixIcon: Icon(Icons.abc),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15)),
                            labelText: "Nombres",
                            labelStyle: GoogleFonts.manrope(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            //errorText: _errorText,
                            /*helperText: _errorText == null
                                          ? "Puedes usar letras y números"
                                          : null,*/
                          ),
                          // onChanged: _validateUsername,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.abc),
                      Container(
                        width: 1.sw - 80.w,
                        child: TextFormField(
                          // controller: _asunto,
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold,
                              fontSize: 11.sp,
                              color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Ingresa tu DNI',
                            hintStyle: GoogleFonts.manrope(fontSize: 11.sp),
                            // prefixIcon: Icon(Icons.abc),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15)),
                            labelText: "DNI",
                            labelStyle: GoogleFonts.manrope(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            //errorText: _errorText,
                            /*helperText: _errorText == null
                                          ? "Puedes usar letras y números"
                                          : null,*/
                          ),
                          // onChanged: _validateUsername,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.date_range),
                      Container(
                        width: 1.sw - 80.w,
                        child: TextFormField(
                          // controller: _asunto,
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold,
                              fontSize: 11.sp,
                              color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'DD/MM/AAAA',
                            hintStyle: GoogleFonts.manrope(fontSize: 11.sp),
                            // prefixIcon: Icon(Icons.abc),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15)),
                            labelText: "Fecha del incidente",
                            labelStyle: GoogleFonts.manrope(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            //errorText: _errorText,
                            /*helperText: _errorText == null
                                          ? "Puedes usar letras y números"
                                          : null,*/
                          ),
                          // onChanged: _validateUsername,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.type_specimen),
                      Container(
                        width: 1.sw - 80.w,
                        child: TextFormField(
                          // controller: _asunto,
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold,
                              fontSize: 11.sp,
                              color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Ingresa el tipo de reclamo',
                            hintStyle: GoogleFonts.manrope(fontSize: 11.sp),
                            // prefixIcon: Icon(Icons.abc),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15)),
                            labelText: "Tipo de reclamo",
                            labelStyle: GoogleFonts.manrope(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            //errorText: _errorText,
                            /*helperText: _errorText == null
                                          ? "Puedes usar letras y números"
                                          : null,*/
                          ),
                          // onChanged: _validateUsername,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  TextFormField(
                    maxLines: 10, // Número de líneas visibles
                    decoration: InputDecoration(
                      labelText: 'Descripción del reclamo',
                      labelStyle: GoogleFonts.manrope(
                          fontSize: 11.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      alignLabelWithHint: true,
                      hintText: 'Escribe aquí el reclamo',
                      hintStyle: GoogleFonts.manrope(fontSize: 11.sp),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                    ),
                    onChanged: (value) {
                      // Guarda o procesa el valor si es necesario
                      print('Descripción: $value');
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: 1.sw,
                    height: 50.h,
                    child: ElevatedButton(
                        onPressed: () {
                          // LLAMAMOS A LA FUNCIÓN
                          /* _registermanual(
                          _controllernombres.text,
                          _controllerapellidos.text,
                          _controllertelefono.text,
                          _controlleremail.text,
                          _controllerpass.text);*/

                          // LIMPIAR FORMULARIO
                          /*_formKey.currentState!.reset();
                      _controllerapellidos.clear();
                      _controllernombres.clear();
                      _controllertelefono.clear();
                      _controlleremail.clear();
                      _controllerpass.clear();*/
                        },
                        style: ElevatedButton.styleFrom(
                            shadowColor:
                                const Color.fromARGB(255, 116, 116, 116),
                            backgroundColor: Color.fromRGBO(1, 37, 255, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r))),
                        child: Text(
                          "Enviar reclamo",
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                              color: Colors.white),
                        )),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
