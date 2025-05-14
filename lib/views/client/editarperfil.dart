import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class EditarPerfil extends StatefulWidget {
  const EditarPerfil({Key? key}) : super(key: key);

  @override
  State<EditarPerfil> createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  // ATRIBUTOS
  TextEditingController _nombres = TextEditingController();
  TextEditingController _apellidos = TextEditingController();
  TextEditingController _telefono = TextEditingController();
  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Editar perfil",
          style: GoogleFonts.manrope(
            fontSize: 14.sp,
          ),
        ),
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100.w,
                height: 100.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/imagenes/avion.png')),
                    // color: Colors.grey,
                    borderRadius: BorderRadius.circular(50.r)),
              ),
              SizedBox(
                height: 29.h,
              ),
              Text(
                "Jorge Perez A.",
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.bold, fontSize: 24.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "jorge@gmail.com",
                style: GoogleFonts.manrope(fontSize: 16.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "964777177",
                style: GoogleFonts.manrope(fontSize: 16.sp),
              ),
              SizedBox(
                height: 43.h,
              ),
              Form(
                  child: Column(
                children: [
                  SizedBox(
                    height: 19.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.account_circle_outlined),
                      Container(
                        width: 1.sw - 80.w,
                        child: TextFormField(
                          controller: _nombres,
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold,
                              fontSize: 11.sp,
                              color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Ingresa tus nombres',
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
                          controller: _nombres,
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold,
                              fontSize: 11.sp,
                              color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Ingresa tus apellidos',
                            hintStyle: GoogleFonts.manrope(fontSize: 11.sp),
                            // prefixIcon: Icon(Icons.abc),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15)),
                            labelText: "Apellidos",
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
                      Icon(Icons.phone_android_outlined),
                      Container(
                        width: 1.sw - 80.w,
                        child: TextFormField(
                          controller: _nombres,
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold,
                              fontSize: 11.sp,
                              color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Ingresa tu teléfono',
                            hintStyle: GoogleFonts.manrope(fontSize: 11.sp),
                            // prefixIcon: Icon(Icons.abc),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15)),
                            labelText: "Teléfono",
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
                      Icon(Icons.email_outlined),
                      Container(
                        width: 1.sw - 80.w,
                        child: TextFormField(
                          controller: _nombres,
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold,
                              fontSize: 11.sp,
                              color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Ingresa tu email',
                            hintStyle: GoogleFonts.manrope(fontSize: 11.sp),
                            // prefixIcon: Icon(Icons.abc),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15)),
                            labelText: "E-mail",
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
                ],
              )),
              SizedBox(
                height: 19.h,
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
                        shadowColor: const Color.fromARGB(255, 116, 116, 116),
                        backgroundColor: Color.fromRGBO(1, 37, 255, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r))),
                    child: Text(
                      "Guardar cambios",
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
