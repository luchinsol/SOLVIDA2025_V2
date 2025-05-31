import 'package:app2025v2/models/producto_model.dart';
import 'package:app2025v2/models/promocion_model.dart';
import 'package:app2025v2/models/ubicacion_model.dart';
import 'package:app2025v2/providers/carrito_provider.dart';
import 'package:app2025v2/providers/categoria_inicio_provider.dart';
import 'package:app2025v2/providers/ubicacion_provider.dart';
import 'package:app2025v2/views/client/components/items.dart';
import 'package:app2025v2/views/client/components/subcategorias/tarjeta_sub.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Carrito extends StatefulWidget {
  const Carrito({Key? key}) : super(key: key);

  @override
  State<Carrito> createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  void _mostrarPopUp(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true, // 👈 Esto es clave
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text("Agrega una ubicación",
                style: GoogleFonts.manrope(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            SizedBox(height: 10.h),
            Container(
              width: 1.sw,
              child: ElevatedButton(
                  onPressed: () async {
                    context.go('/listadirecciones');
                    // Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(1, 37, 255, 1)),
                  child: Text(
                    "Agregar",
                    style: GoogleFonts.manrope(
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ]),
        );
      },
    );
  }

  bool _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_isInit) {
      final ubicacionProvider =
          Provider.of<UbicacionProvider>(context, listen: false);

      final ubicaciones = ubicacionProvider.allubicaciones.length;

      if (ubicaciones < 1) {
        // Mostramos el popup solo si NO hay teléfono actualizado
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _mostrarPopUp(context);
        });
      }

      _isInit = false;
    }
  }

  //int contador = 1;
  String tipopago = "-";
  bool codigoValido = false;
  final TextEditingController _controllerCodigo = TextEditingController();
  bool _seleccionado = false;
  @override
  Widget build(BuildContext context) {
    final carritProvider = context.watch<CarritoProvider>();
    final categoriaProvider =
        Provider.of<CategoriaInicioProvider>(context, listen: false);
    final subcategoria =
        categoriaProvider.allcategoria_subcategoria?.subcategorias[0];

    final ubicacionProvider = context.watch<UbicacionProvider>();

    UbicacionModel? direccionSeleccionada;

    if (ubicacionProvider.allubicaciones.isNotEmpty) {
      direccionSeleccionada = ubicacionProvider.allubicaciones.firstWhere(
        (u) => u.id == ubicacionProvider.idSeleccionado,
        orElse: () => ubicacionProvider.allubicaciones.first,
      );
    } else {
      direccionSeleccionada = null;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Carrito",
          style: GoogleFonts.manrope(fontSize: 16.sp),
        ),
      ),
      body: carritProvider.totalItems > 0
          ? Padding(
              padding: EdgeInsets.only(top: 0.r, left: 27.r, right: 27.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // DIRECCIÓN Y ETIQUETA
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dirección de entrega",
                        style: GoogleFonts.manrope(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                          onPressed: () {
                            context.push('/listadirecciones');
                          },
                          child: Row(
                            children: [
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
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Chip(
                              backgroundColor: Color.fromRGBO(1, 37, 255, 1),
                              label: Text(
                                direccionSeleccionada?.etiqueta ?? "-/-",
                                style: GoogleFonts.manrope(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                              width: 265.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.r)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${direccionSeleccionada!.direccion} ${direccionSeleccionada!.distrito}" ??
                                      "ninguno",
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
                    height: 20.h,
                  ),

                  Container(
                    height: 1.sh - 255.h,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // TITULO - CAJA CON PRODUCTOS
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Items (${carritProvider.totalItems})",
                                style: GoogleFonts.manrope(fontSize: 14.sp),
                              ),
                              IconButton(
                                  onPressed: () {
                                    carritProvider.deleteCarrito();
                                  },
                                  icon: Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                    size: 24.sp,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),

                          // CARRITO - CAJA
                          Container(
                              color: Colors.yellow.shade100,
                              height: carritProvider.totalItems > 1
                                  ? 270.h
                                  : 125.0.h,
                              child: ListView.builder(
                                  itemCount:
                                      carritProvider.itemsCombinados.length,
                                  itemBuilder: (context, index) {
                                    final item =
                                        carritProvider.itemsCombinados[index];
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        if (item is ProductoModel)
                                          ItemCarrito(
                                            producto: item,
                                            index: index,
                                          )
                                        else if (item is PromocionModel)
                                          ItemCarrito(
                                            producto: item,
                                            index: index,
                                          ),
                                        Divider(
                                          color: Colors.grey.shade400,
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
                            height: 220,
                            //color: Colors.grey,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: subcategoria?.productos.length,
                                itemBuilder: (context, index) {
                                  final producto =
                                      subcategoria?.productos[index];
                                  return tarjeta_sub(
                                      context: context,
                                      alto: 220,
                                      ancho: 133,
                                      separacion_tarjeta: 19,
                                      ima_alto: 100,
                                      ima_ancho: 100,
                                      item: producto,
                                      cajatextoalto: 65,
                                      cajatextoancho: 100);
                                }),
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          /*Text(
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
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(15)),
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp)),
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
                                      fontSize: 23.sp,
                                      fontWeight: FontWeight.w200),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                    19,
                                    (int index) => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                      SizedBox(
                        height: 23.h,
                      ),*/

                          // METODO DE PAGO
                          Text(
                            "Método de pago",
                            style: GoogleFonts.manrope(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          /*  Container(
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
                                      onPressed: () async {},
                                      style: ElevatedButton.styleFrom(
                                          side: BorderSide(
                                              width: 2,
                                              color:
                                                  Color.fromRGBO(1, 37, 255, 1)),
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
                                              color:
                                                  Color.fromRGBO(1, 37, 255, 1)),
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
                      ),*/
                          Container(
                            height: 70.h,
                            width: 1.sw,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                //color: Colors.green.shade100,
                                border: Border.all(
                                    color: Color.fromRGBO(1, 37, 255, 1),
                                    width: 2)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Efectivo",
                                      style: GoogleFonts.manrope(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15.sp),
                                    ),
                                    Checkbox(
                                        value: _seleccionado,
                                        checkColor: Colors
                                            .white, // color del ícono de check (✔)
                                        fillColor: WidgetStateProperty
                                            .resolveWith<Color>(
                                          (Set<WidgetState> states) {
                                            if (states.contains(
                                                WidgetState.selected)) {
                                              return Colors
                                                  .amber; // color cuando está seleccionado
                                            }
                                            return Colors.grey
                                                .shade50; // color cuando está desactivado
                                          },
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.r)),
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _seleccionado = value!;
                                            tipopago =
                                                value! ? "Efectivo" : "-";
                                          });
                                        })
                                  ],
                                ),
                              ),
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
                                  top: 17.r,
                                  left: 21.r,
                                  right: 21.r,
                                  bottom: 17.r),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Tipo de pago",
                                        style: GoogleFonts.manrope(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        "${tipopago}",
                                        style: GoogleFonts.manrope(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Subtotal",
                                        style: GoogleFonts.manrope(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        "S/.${carritProvider.sumatotalPedido.toStringAsFixed(2)}",
                                        style: GoogleFonts.manrope(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Delivery",
                                        style: GoogleFonts.manrope(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        "S/.0.00",
                                        style: GoogleFonts.manrope(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20.r),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20.r))),
                                              child: Center(
                                                  child: Text(
                                                "cupón",
                                                style: GoogleFonts.manrope(
                                                    fontSize: 10.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            )
                                          ]
                                        ],
                                      ),
                                      Text(
                                        codigoValido ? "S/.3.00" : "S/.0.00",
                                        style: GoogleFonts.manrope(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total",
                                        style: GoogleFonts.manrope(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "S/.${carritProvider.sumatotalPedido.toStringAsFixed(2)}",
                                        style: GoogleFonts.manrope(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold),
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
                                            color: const Color.fromARGB(
                                                255, 172, 172, 172),
                                            width: 2),
                                        borderRadius: BorderRadius.circular(15
                                            .r), // Bordes completamente rectos
                                      ),
                                      backgroundColor: Colors.white),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Container(
                                            height: 1.sh / 2.5,
                                            child: Padding(
                                              padding: EdgeInsets.all(20),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    height: 120.w,
                                                    width: 120.w,
                                                    child: Icon(
                                                      Icons.cancel_outlined,
                                                      color: Colors.red,
                                                      size: 120.sp,
                                                    ),
                                                  ),
                                                  /* Icon(
                          Icons.check_circle_outline,
                          size: 60.sp,
                          color: Colors.lightGreen,
                        ),*/
                                                  SizedBox(height: 20),
                                                  Text(
                                                    "¿Deseas cancelar el pedido?",
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.manrope(
                                                      color: Color.fromRGBO(
                                                          1, 37, 255, 1),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 20.sp,
                                                    ),
                                                  ),
                                                  SizedBox(height: 20.h),
                                                  SizedBox(height: 30.h),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.white,
                                                      side: BorderSide(
                                                          color: Color.fromRGBO(
                                                              1, 37, 255, 1)),
                                                    ),
                                                    child: Text(
                                                      "Continuar",
                                                      style:
                                                          GoogleFonts.manrope(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromRGBO(
                                                            1, 37, 255, 1),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      carritProvider
                                                          .deleteCarrito();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
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
                                        borderRadius: BorderRadius.circular(15
                                            .r), // Bordes completamente rectos
                                      ),
                                      backgroundColor:
                                          Color.fromRGBO(1, 37, 255, 1)),
                                  onPressed: _seleccionado
                                      ? () {
                                          carritProvider.deleteCarrito();
                                          context.go('/fin_pedido');
                                        }
                                      : null,
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
                  )
                ],
              ),
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Tu carrito está vacio",
                      style: GoogleFonts.manrope(
                          fontWeight: FontWeight.normal, fontSize: 24.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Empieza ahora",
                      style: GoogleFonts.manrope(
                          fontSize: 14.sp, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 48.h,
                    ),
                    Container(
                      width: 1.sw,
                      child: ElevatedButton(
                          onPressed: () {
                            context.go('/barracliente');
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(1, 37, 255, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r))),
                          child: Text(
                            "Escoger productos",
                            style: GoogleFonts.manrope(
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
