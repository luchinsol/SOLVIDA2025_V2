import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class Mapa extends StatefulWidget {
  const Mapa({Key? key}) : super(key: key);

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  GoogleMapController? _mapController;

  LatLng? _ubicacionSeleccionada;
  BitmapDescriptor? customIcon;

  final String googleApiKey =
      "AIzaSyA45xOgppdm-PXYDE5r07eDlkFuPzYmI9g"; // Reemplaza con tu API Key

  @override
  void initState() {
    super.initState();
    // _loadMapStyle();
    _cargarIconoPersonalizado();
    _obtenerCoordenadasDeDireccion(
        "Plaza Pampa de Camarones, HCQH+QRM, Av. Brasil S/N, Pampa de Camarones, Yanahuara Cercado De, Arequipa 04013");
  }

  Future<void> _cargarIconoPersonalizado() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(80, 80)),
      'lib/assets/imagenes/pincito2.png',
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    // _mapController?.setMapStyle(_mapStyle);
  }

  void _actualizarUbicacion(LatLng nuevaUbicacion) {
    setState(() {
      _ubicacionSeleccionada = nuevaUbicacion;
    });
    print("....NUEVA: $nuevaUbicacion");
  }

  Future<void> _obtenerCoordenadasDeDireccion(String direccion) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?address=${Uri.encodeComponent(direccion)}&key=$googleApiKey');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK') {
          final geometry = data['results'][0]['geometry']['location'];
          final lat = geometry['lat'];
          final lng = geometry['lng'];

          setState(() {
            _ubicacionSeleccionada = LatLng(lat, lng);
          });
        } else {
          debugPrint('Error en la API de Geocoding: ${data['status']}');
        }
      } else {
        debugPrint('Error en la solicitud HTTP: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error al obtener las coordenadas: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            "Confirmación",
            style: GoogleFonts.manrope(
                fontSize: 13.sp, fontWeight: FontWeight.w500),
          )),
      body: SafeArea(
        child: _ubicacionSeleccionada == null
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.only(top: 8.r, left: 27.r, right: 27.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ajusta tu ubicación",
                      style: GoogleFonts.manrope(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(1, 37, 255, 1)),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "Tu dirección",
                      style: GoogleFonts.manrope(
                        fontSize: 11.sp,
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Container(
                      height: 50.h,
                      width: 358.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Colors.grey.shade200),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Chip(
                                backgroundColor: Color.fromRGBO(1, 37, 255, 1),
                                label: Text(
                                  'Novia',
                                  style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11.sp,
                                      color: Colors.white),
                                )),
                            Container(
                              width: 200.w,
                              child: Text(
                                "Av. Brasil - Pampa de camarones - Sachaca 448484",
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
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      height: 388.h,
                      child: GoogleMap(
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: CameraPosition(
                          target: _ubicacionSeleccionada!,
                          zoom: 17.5,
                        ),
                        markers: {
                          Marker(
                            markerId: const MarkerId("ubicacion"),
                            position: _ubicacionSeleccionada!,
                            icon: BitmapDescriptor.defaultMarker,
                            draggable: true,
                            onDragEnd: (LatLng position) {
                              _actualizarUbicacion(position);
                            },
                          ),
                        },
                        onTap: _actualizarUbicacion,
                      ),
                    ),
                    SizedBox(height: 27.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20.w,
                          width: 20.w,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(50.r)),
                          child: Icon(
                            Icons.location_pin,
                            color: Colors.red,
                            size: 16.sp,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Ajusta con el pin si es necesario",
                          style: GoogleFonts.manrope(
                            fontSize: 11.sp,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 85.0.h,
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
}
