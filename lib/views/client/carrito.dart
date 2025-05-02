import 'package:app2025v2/views/client/components/items.dart';
import 'package:app2025v2/views/client/components/subcategorias/tarjeta_sub.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Carrito extends StatefulWidget {
  const Carrito({Key? key}) : super(key: key);

  @override
  State<Carrito> createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  //int contador = 1;

  bool codigoValido = false;
  final TextEditingController _controllerCodigo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int cantidad = 1;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Carrito",
          style: GoogleFonts.manrope(fontSize: 16.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 0.r, left: 27.r, right: 27.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dirección de entrega",
                    style: GoogleFonts.manrope(
                        fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Color.fromRGBO(1, 37, 255, 1),
                          ),
                          Text(
                            "Cambiar",
                            style: GoogleFonts.manrope(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(1, 37, 255, 1)),
                          ),
                        ],
                      ))
                ],
              ),
              Container(
                ///color: Colors.grey,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(
                          backgroundColor: Color.fromRGBO(1, 37, 255, 1),
                          label: Text(
                            "Mi casa",
                            style: GoogleFonts.manrope(
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                      Container(
                          width: 255.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Av Dolores - J.L.B y Rivero - Hartley Arequipa",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.manrope(fontSize: 14.sp),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 13.h,
              ),
              Text(
                "Items ($cantidad)",
                style: GoogleFonts.manrope(fontSize: 14.sp),
              ),
              SizedBox(
                height: 13.h,
              ),
              Container(
                  //color: Colors.amber,
                  height: cantidad > 1 ? 250.h : 125.0.h,
                  child: ListView.builder(
                      itemCount: cantidad,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ItemCarrito(),
                            Divider(
                              color: Colors.grey.shade200,
                            )
                          ],
                        );
                      })),
              SizedBox(
                height: 18.h,
              ),
              Text(
                "Agrega a tu pedido",
                style: GoogleFonts.manrope(fontSize: 14.sp),
              ),
              SizedBox(
                height: 18.h,
              ),
              Container(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return tarjeta_sub(context, 194, 128, 10, 100, 100);
                    }),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                "Cupón de descuento",
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
              SizedBox(
                height: 18.h,
              ),
              Container(
                height: 85.h,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(15.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 0),
                          child: Container(
                            width: 250.w,
                            height: 50.h,
                            //color: Colors.white,
                            child: TextFormField(
                              controller: _controllerCodigo,
                              decoration: InputDecoration(
                                hintText: "Ingresa tu cupón",
                                /*contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.sp, vertical: 16.sp),*/

                                // labelText: "Email o usuario",
                                labelStyle: GoogleFonts.manrope(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                filled: true,
                                fillColor: Color.fromRGBO(
                                    246, 246, 246, 1), // Fondo blanco
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                if (_controllerCodigo.text == "SOLVIDA") {
                                  codigoValido = true;
                                }
                              });
                            },
                            child: Text(
                              "Aplicar",
                              style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(1, 37, 255, 1)),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Usa el código ",
                          style: GoogleFonts.manrope(fontSize: 14.sp)),
                      TextSpan(
                          text: "SOLVIDA",
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold, fontSize: 14.sp)),
                      TextSpan(
                          text: " y obtén descuento ",
                          style: GoogleFonts.manrope(fontSize: 14.sp)),
                    ]))
                  ],
                ),
              ),
              if (codigoValido) ...[
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 148.h,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.r),
                          bottomLeft: Radius.circular(25.r))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          "Descuento",
                          style: GoogleFonts.manrope(
                              fontSize: 23.sp, fontWeight: FontWeight.w200),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                            19,
                            (int index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 2.5,
                                      height: 2.5,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    )
                                  ],
                                )),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "-25%",
                                style: GoogleFonts.manrope(
                                    color: Colors.white,
                                    fontSize: 60.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Container(
                                width: 71.w,
                                height: 71.h,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'lib/assets/imagenes/logo.png'))),
                              )
                            ],
                          ),
                          Text(
                            "¡Genial! obtuviste un descuento en tu pedido",
                            style: GoogleFonts.manrope(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "Válido: 24 de Julio - 30 de Agosto",
                            style: GoogleFonts.manrope(
                                fontSize: 10.sp, fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
              SizedBox(
                height: 23.h,
              ),
              Text(
                "Método de pago",
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
              SizedBox(
                height: 18.h,
              ),
              Container(
                height: 70.h,
                //color: Colors.yellowAccent,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          width: 95.w,
                          height: 65.h,
                          child: ElevatedButton(
                              onPressed: () async {
                                final Uri url = Uri.parse(
                                    'https://yape.com.pe/qr/964269494');
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url,
                                      mode: LaunchMode.externalApplication);
                                } else {
                                  throw 'No se pudo abrir Yape';
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                      width: 2,
                                      color: Color.fromRGBO(1, 37, 255, 1)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.r))),
                              child: Center(
                                child: Text(
                                  "Efectivo S/.",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.manrope(
                                      fontSize: 11.5.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(1, 37, 255, 1)),
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 26.w,
                        )
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                "Resumen",
                style: GoogleFonts.manrope(
                    fontSize: 14.sp, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 18.h,
              ),
              Container(
                width: 359.w,
                height: 200.h,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 17.r, left: 21.r, right: 21.r, bottom: 17.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tipo de pago",
                            style: GoogleFonts.manrope(
                                fontSize: 15.sp, fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "Efectivo",
                            style: GoogleFonts.manrope(
                                fontSize: 15.sp, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: GoogleFonts.manrope(
                                fontSize: 15.sp, fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "S/.55.00",
                            style: GoogleFonts.manrope(
                                fontSize: 15.sp, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery",
                            style: GoogleFonts.manrope(
                                fontSize: 15.sp, fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "S/.0.00",
                            style: GoogleFonts.manrope(
                                fontSize: 15.sp, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Descuento",
                                style: GoogleFonts.manrope(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.normal),
                              ),
                              if (codigoValido) ...[
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 51.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.r),
                                          bottomLeft: Radius.circular(20.r))),
                                  child: Center(
                                      child: Text(
                                    "cupón",
                                    style: GoogleFonts.manrope(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                                )
                              ]
                            ],
                          ),
                          Text(
                            codigoValido ? "S/.3.00" : "S/.0.00",
                            style: GoogleFonts.manrope(
                                fontSize: 15.sp, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: GoogleFonts.manrope(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "S/.52.00",
                            style: GoogleFonts.manrope(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 17.h,
              ),
              Container(
                  width: 1.sw,
                  height: 56.h,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: const Color.fromARGB(255, 172, 172, 172),
                                width: 2),
                            borderRadius: BorderRadius.circular(
                                15.r), // Bordes completamente rectos
                          ),
                          backgroundColor: Colors.white),
                      onPressed: () {},
                      child: Text(
                        "Cancelar pedido",
                        style: GoogleFonts.manrope(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp),
                      ))),
              SizedBox(
                height: 10.h,
              ),
              Container(
                  width: 1.sw,
                  height: 56.h,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15.r), // Bordes completamente rectos
                          ),
                          backgroundColor: Color.fromRGBO(1, 37, 255, 1)),
                      onPressed: () {
                        context.go('/fin_pedido');
                      },
                      child: Text(
                        "Proceder con el pedido",
                        style: GoogleFonts.manrope(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp),
                      ))),
              SizedBox(
                height: 50.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
