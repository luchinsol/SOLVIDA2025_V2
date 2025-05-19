import 'dart:async';
import 'dart:convert';
import 'package:app2025v2/models/ubicacion_model.dart';
import 'package:app2025v2/providers/ubicacion_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Mapa extends StatefulWidget {
  const Mapa({Key? key}) : super(key: key);

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  GoogleMapController? _mapController;

  LatLng? _ubicacionSeleccionada;
  BitmapDescriptor? customIcon;

  UbicacionSeleccionadaModel? _ubicacionModel;
  bool _isLoading = true;

  final String googleApiKey =
      "AIzaSyA45xOgppdm-PXYDE5r07eDlkFuPzYmI9g"; // Reemplaza con tu API Key

  @override
  void initState() {
    super.initState();
    // _loadMapStyle();
    _cargarIconoPersonalizado();
    /*
    _obtenerCoordenadasDeDireccion(
        "Plaza Pampa de Camarones, HCQH+QRM, Av. Brasil S/N, Pampa de Camarones, Yanahuara Cercado De, Arequipa 04013");
    */
    _cargarDatosUbicacion();
  }

  Future<void> _cargarDatosUbicacion() async {
    try {
      final ubicacionProvider =
          Provider.of<UbicacionProvider>(context, listen: false);
      // Usar el ID almacenado en el provider
      final ubicacionId = ubicacionProvider.ubicacionId;

      if (ubicacionId == null) {
        debugPrint('No hay ID de ubicación disponible');
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final ubicacion =
          await ubicacionProvider.obtenerUbicacionDetalle(ubicacionId);

      setState(() {
        _ubicacionModel = ubicacion;
        _ubicacionSeleccionada = LatLng(ubicacion.latitud, ubicacion.longitud);
        //_obtenerCoordenadasDeDireccion(ubicacion.direccion);
        _isLoading = false;
      });
    } catch (e) {
      debugPrint('Error al cargar datos de ubicación: $e');
      setState(() {
        _isLoading = false;
      });
    }
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

  Future<void> _confirmarDireccion() async {
    try {
      final ubicacionProvider =
          Provider.of<UbicacionProvider>(context, listen: false);

      await ubicacionProvider.actualizarUbicacion(
        ubicacionId: _ubicacionModel!.id,
        distrito: _ubicacionModel!.distrito,
        direccion: _ubicacionModel!.direccion,
        latitud: _ubicacionSeleccionada!.latitude,
        longitud: _ubicacionSeleccionada!.longitude,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ubicacionProvider =
        Provider.of<UbicacionProvider>(context, listen: false);
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
                                  _ubicacionModel?.etiqueta ?? 'Etiqueta',
                                  style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11.sp,
                                      color: Colors.white),
                                )),
                            Container(
                              width: 200.w,
                              child: Text(
                                "${_ubicacionModel?.direccion} ${_ubicacionModel?.distrito}" ??
                                    "Dirección no disponible",
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
                          onPressed: () {
                            _confirmarDireccion();
                            if (context.mounted) {
                              context.go('/lista_ubicaciones');
                            }
                          },
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
