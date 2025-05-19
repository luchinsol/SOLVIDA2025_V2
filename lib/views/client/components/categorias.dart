import 'package:app2025v2/providers/categoria_inicio_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

IconData getIcono(String tipo) {
  switch (tipo) {
    case 'agua':
      return Icons.opacity_outlined;
    case 'accesorios':
      return Icons.backpack_outlined;
    default:
      return Icons.help_outline;
  }
}

// CATEGORÍA
Widget categoria(BuildContext context, dynamic item) {
  return Container(
    width: 80.w,
    height: 71.h,
    decoration: BoxDecoration(

        // color: const Color.fromARGB(255, 245, 245, 245),
        borderRadius: BorderRadius.circular(15.r)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 50.w,
          height: 50.w,
          decoration: BoxDecoration(
              // color: const Color.fromARGB(255, 255, 255, 255),
              color: const Color.fromRGBO(1, 37, 255, 1),
              borderRadius: BorderRadius.circular(50.r)),
          child: Center(
              child: IconButton(
            onPressed: () async {
              // Mostrar el diálogo de carga
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                },
              );

              try {
                // Esperar a que cargue la categoría
                await Provider.of<CategoriaInicioProvider>(context,
                        listen: false)
                    .getCategoriaSubcategoria(item.id);
              } catch (e) {
                print("Error cargando categoría: $e");
              } finally {
                // Cerrar el diálogo cuando termina la carga
                Navigator.of(context).pop();
              }

              // Aquí puedes navegar a otra vista, por ejemplo:
              // context.push('/subcategoria');
            },
            icon: Icon(getIcono(item.nombre)),
            color: Colors.white,
            //color: const Color.fromRGBO(1, 37, 255, 1),
          )),
        ),
        Text(
          item.nombre,
          style: GoogleFonts.manrope(
              color: Color.fromRGBO(1, 37, 255, 1),
              //color: Colors.white,
              fontSize: 13.5.sp,
              fontWeight: FontWeight.w600),
        )
      ],
    ),
  );
}
