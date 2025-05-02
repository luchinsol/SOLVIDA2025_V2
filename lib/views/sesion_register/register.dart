import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _controlleremail = TextEditingController();
  TextEditingController _controllerpass = TextEditingController();
  TextEditingController _controllernombres = TextEditingController();
  TextEditingController _controllertelefono = TextEditingController();
  TextEditingController _controlleruser = TextEditingController();

  Future<void> _registermanual(String email, String pass) async {
    showDialog(
      context: context,
      barrierDismissible: false, // Evita que el usuario cierre el diálogo
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      },
    );

    try {
      UserCredential userCred =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      print("Login exitoso: ${userCred.user!.uid}");
      if (mounted) Navigator.of(context).pop(); // Cierra el diálogo
      context.go('/');
    } catch (e) {
      print("Error de registro: $e");
      if (mounted) Navigator.of(context).pop();

      String errorMessage = "Error al registrar la cuenta";
      if (e is FirebaseAuthException) {
        errorMessage = e.message ?? errorMessage;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  Future<void> registerWithGoogle() async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        )),
      );
      // Forzar selección de cuenta cada vez
      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ['email'],
        signInOption: SignInOption.standard, // Esto muestra el selector siempre
      );

      // Cerrar cualquier sesión previa de Google
      await googleSignIn.signOut();
      await Future.delayed(Duration(milliseconds: 100));

      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      Navigator.of(context, rootNavigator: true).pop(); // Cierra el dialog

      if (googleUser == null) return; // El usuario canceló el login

      GoogleSignInAuthentication? googleAuth = await googleUser.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential user =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print("........../////.......GOOGLE");
      print(user.user?.phoneNumber);
      print(user.user?.photoURL);
      print(user.user?.email);
      print(user.user?.displayName);
      /* SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('fotito', user.user!.photoURL!);*/

      context.go('/');

      // Navegar a la página principal después del login exitoso
    } catch (e) {
      print("Error en Google SignIn: $e");
      // Mostrar error al usuario
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al iniciar sesión con Google")),
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 8.r, left: 27.r, right: 27.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Registra tu nueva cuenta",
                style: GoogleFonts.manrope(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(1, 37, 255, 1)),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                "Ingresa tu información abajo",
                style: GoogleFonts.manrope(
                  fontSize: 11.sp,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    //controller: _password,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.abc),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                      labelText: "Nombres",
                      labelStyle: GoogleFonts.manrope(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 11.sp),
                      filled: true,
                      fillColor: Color.fromRGBO(246, 246, 246, 1),
                      //errorText: _errorText,
                      /*helperText: _errorText == null
                                    ? "Puedes usar letras y números"
                                    : null,*/
                    ),
                    // onChanged: _validateUsername,
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  TextFormField(
                    controller: _controlleremail,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                      labelText: "Email",
                      labelStyle: GoogleFonts.manrope(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 11.sp),
                      filled: true,
                      fillColor: Color.fromRGBO(246, 246, 246, 1),
                      //errorText: _errorText,
                      /*helperText: _errorText == null
                                    ? "Puedes usar letras y números"
                                    : null,*/
                    ),
                    // onChanged: _validateUsername,
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  TextFormField(
                    //controller: _password,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_android_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                      labelText: "Teléfono",
                      labelStyle: GoogleFonts.manrope(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 11.sp),
                      filled: true,
                      fillColor: Color.fromRGBO(246, 246, 246, 1),
                      //errorText: _errorText,
                      /*helperText: _errorText == null
                                    ? "Puedes usar letras y números"
                                    : null,*/
                    ),
                    // onChanged: _validateUsername,
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  TextFormField(
                    //controller: _password,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                      labelText: "Usuario",
                      labelStyle: GoogleFonts.manrope(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 11.sp),
                      filled: true,
                      fillColor: Color.fromRGBO(246, 246, 246, 1),
                      //errorText: _errorText,
                      /*helperText: _errorText == null
                                    ? "Puedes usar letras y números"
                                    : null,*/
                    ),
                    // onChanged: _validateUsername,
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  TextFormField(
                    controller: _controllerpass,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                      labelText: "Contraseña",
                      labelStyle: GoogleFonts.manrope(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 11.sp),
                      filled: true,
                      fillColor: Color.fromRGBO(246, 246, 246, 1),
                      //errorText: _errorText,
                      /*helperText: _errorText == null
                                    ? "Puedes usar letras y números"
                                    : null,*/
                    ),
                    // onChanged: _validateUsername,
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                ],
              )),
              Container(
                width: 1.sw,
                height: 50.h,
                child: ElevatedButton(
                    onPressed: () {
                      _registermanual(
                          _controlleremail.text, _controllerpass.text);
                    },
                    style: ElevatedButton.styleFrom(
                        shadowColor: const Color.fromARGB(255, 116, 116, 116),
                        backgroundColor: Color.fromRGBO(1, 37, 255, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r))),
                    child: Text(
                      "Registrarse",
                      style: GoogleFonts.manrope(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: Colors.white),
                    )),
              ),
              SizedBox(
                height: 29.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 27, right: 20),
                      child: Divider(
                        color: Colors.black,
                        thickness: 1, // Grosor de la línea
                        endIndent: 10, // Espaciado al final
                      ),
                    ),
                  ),
                  Text(
                    "o regístrate",
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: Colors.black),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 27, left: 20),
                      child: Divider(
                        color: Colors.black,
                        thickness: 1,
                        indent: 10, // Espaciado al inicio
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 29.h,
              ),
              Container(
                width: 350.w,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    registerWithGoogle();

                    // Forma CORRECTA de navegar:
                  },
                  style: ElevatedButton.styleFrom(
                    shadowColor: const Color.fromARGB(
                        255, 134, 134, 134), // Elimina la sombra

                    backgroundColor: Colors.white, // Blanco puro
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'lib/assets/imagenes/google.png'))),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        "Registrarse con Google",
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 46.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "¿ Ya tienes cuenta ?",
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        context.go('/');
                      },
                      child: Text(
                        "Inicia aquí",
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: Colors.amber.shade700,
                        ),
                      ))
                ],
              )
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
