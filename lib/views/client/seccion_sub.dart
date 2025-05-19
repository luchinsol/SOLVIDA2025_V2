import 'package:app2025v2/views/client/components/categorias.dart';
import 'package:app2025v2/views/client/components/subcategorias/subcategoria.dart';
import 'package:app2025v2/views/client/components/subcategorias/tarjeta_sub.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SubCategoria extends StatefulWidget {
  const SubCategoria({Key? key}) : super(key: key);

  @override
  State<SubCategoria> createState() => _SubCategoriaState();
}

class _SubCategoriaState extends State<SubCategoria> {
  int selectedIndex = 0;

  final List<String> chips = ['Todos', 'Promos', 'Productos'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lo más vendido',
                style: GoogleFonts.manrope(fontSize: 16.sp),
              ),
              badges.Badge(
                  position: badges.BadgePosition.topEnd(top: -1, end: -1),
                  badgeContent: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      '3',
                      style: GoogleFonts.manrope(
                          color: Color.fromRGBO(1, 37, 255, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  showBadge: true,
                  badgeStyle: badges.BadgeStyle(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(1, 37, 255, 1), width: 2),
                      badgeColor: const Color.fromARGB(255, 255, 255, 255)),
                  child: IconButton(
                    onPressed: () {
                      print("Carrita");
                    },
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      size: 25.sp,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ))
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 27.r, top: 21.r, right: 27.r),
          child: Column(
            children: [
              Row(
                children: List.generate(chips.length, (index) {
                  final bool isSelected = selectedIndex == index;

                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.orange : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        child: Text(
                          chips[index],
                          style: GoogleFonts.manrope(
                            color: isSelected
                                ? Colors.white
                                : Colors.grey.shade600,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 23.h,
              ),
              /* Container(
                height: 1.sh - 198.h,
                child: GridView.count(
                  crossAxisCount: 2, // 2 columnas
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.6, // alto/anchura
                  children: List.generate(7, (index) {
                    return tarjeta_sub(
                        context: context,
                        sub_nombre: sub_nombre,
                        alto: 300,
                        ancho: 169,
                        separacion_tarjeta: 0,
                        ima_alto: 200,
                        ima_ancho: 200,
                        item: item);

                    //return tarjeta_sub(context, 300, 169, 0, 200, 200);
                  }),
                ),
              )*/
            ],
          ),
        ));
  }
}
