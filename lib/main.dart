import 'package:app2025v2/class_config/clase_notificacion.dart';
import 'package:app2025v2/class_config/socket_central.dart';
import 'package:app2025v2/providers/atencioncliente_provider.dart';
import 'package:app2025v2/providers/carrito_provider.dart';
import 'package:app2025v2/providers/categoria_inicio_provider.dart';
import 'package:app2025v2/providers/categoria_provider.dart';
import 'package:app2025v2/providers/cliente_provider.dart';
import 'package:app2025v2/providers/cupon_provider.dart';
import 'package:app2025v2/providers/delivery_provider.dart';
import 'package:app2025v2/providers/detalleproducto_provider.dart';
import 'package:app2025v2/providers/evento_provider.dart';
import 'package:app2025v2/providers/iniciarapp_provider.dart';
import 'package:app2025v2/providers/notificacion_provider.dart';
import 'package:app2025v2/providers/novedades_provider.dart';
import 'package:app2025v2/providers/pedido_provider.dart';
import 'package:app2025v2/providers/subcategoria_provider.dart';
import 'package:app2025v2/providers/temperatura_provider.dart';
import 'package:app2025v2/providers/ubicacion_provider.dart';
import 'package:app2025v2/views/barra/barra.dart';
import 'package:app2025v2/views/client/carrito.dart';
import 'package:app2025v2/views/client/circular.dart';
import 'package:app2025v2/views/client/completacategoria.dart';
import 'package:app2025v2/views/client/detalle_producto.dart';
import 'package:app2025v2/views/client/editarperfil.dart';
import 'package:app2025v2/views/client/finpedido.dart';
import 'package:app2025v2/views/client/inicio2.dart';
import 'package:app2025v2/views/client/libroreclamacion.dart';
import 'package:app2025v2/views/client/seccion_sub.dart';
import 'package:app2025v2/views/client/soporte.dart';
import 'package:app2025v2/views/client/todocategoria.dart';
import 'package:app2025v2/views/sesion_register/otp.dart';
import 'package:app2025v2/views/sesion_register/register.dart';
import 'package:app2025v2/views/ubicacion/lista.dart';
import 'package:app2025v2/views/ubicacion/location.dart';
import 'package:app2025v2/views/sesion_register/login.dart';
import 'package:app2025v2/views/ubicacion/mapa.dart';
import 'package:app2025v2/views/previa.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: ".env");
  // Inicializa el servicio de notificaciones
  final notificationsService = NotificationsService();
  await notificationsService
      .requestNotificationPermission(); // Solicita permisos
  await notificationsService.initNotification(); // Configura las notificaciones
  // final usuarioPrefs = await SharedPreferences.getInstance();
  await initializeDateFormatting('es_ES', null);
  SocketService().connectToSocket(); // Escuchar eventos
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ClienteProvider()),
      /* ChangeNotifierProvider(
          create: (context) => IniciarappProvider(usuarioPrefs)),*/

      ChangeNotifierProvider(create: (context) => NotificacionProvider()),
      ChangeNotifierProvider(create: (context) => EventoProvider()),
      ChangeNotifierProvider(create: (context) => CategoriaProvider()),
      ChangeNotifierProvider(create: (context) => CategoriaInicioProvider()),
      ChangeNotifierProvider(create: (context) => CarritoProvider()),
      ChangeNotifierProvider(create: (context) => SubcategoriaProvider()),
      ChangeNotifierProvider(create: (context) => TemperaturaProvider()),
      ChangeNotifierProvider(create: (context) => DetalleProductoProvider()),
      ChangeNotifierProvider(create: (context) => UbicacionProvider()),
      ChangeNotifierProvider(create: (context) => CuponProvider()),
      ChangeNotifierProvider(create: (context) => NovedadesProvider()),
      ChangeNotifierProvider(create: (context) => DeliveryProvider()),
      ChangeNotifierProvider(create: (context) => PedidoProvider()),
      ChangeNotifierProvider(create: (context) => AtencionClienteProvider()),
    ],
    child: const MyApp(),
  ));
}

// RUTAS PARA NAVEGACIÓN
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Login();
      },
    ),
    GoRoute(
      path: '/previa',
      builder: (BuildContext context, GoRouterState state) {
        return const Previa();
      },
    ),
    GoRoute(
      path: '/barracliente',
      builder: (BuildContext context, GoRouterState state) {
        return const BarraNavegacion();
      },
    ),
    GoRoute(
      path: '/mapa',
      builder: (BuildContext context, GoRouterState state) {
        return const Mapa();
      },
    ),
    GoRoute(
      path: '/location',
      builder: (BuildContext context, GoRouterState state) {
        return const Location();
      },
    ),
    GoRoute(
      path: '/subcategoria',
      builder: (BuildContext context, GoRouterState state) {
        return const SubCategoria();
      },
    ),
    GoRoute(
      path: '/todocategoria',
      builder: (BuildContext context, GoRouterState state) {
        return const TodoCategoria();
      },
    ),
    GoRoute(
      path: '/allcategoria_sub',
      builder: (BuildContext context, GoRouterState state) {
        return const Completacategoria();
      },
    ),
    GoRoute(
      path: '/detalle_producto',
      builder: (BuildContext context, GoRouterState state) {
        return const DetalleProducto();
      },
    ),
    GoRoute(
      path: '/carrito',
      builder: (BuildContext context, GoRouterState state) {
        return const Carrito();
      },
    ),
    GoRoute(
        path: '/fin_pedido',
        builder: (BuildContext context, GoRouterState state) {
          return const Finpedido();
        }),
    GoRoute(
        path: '/listadirecciones',
        builder: (BuildContext context, GoRouterState state) {
          return Lista();
        }),
    GoRoute(
        path: '/register',
        builder: (BuildContext context, GoRouterState state) {
          return Register();
        }),
    GoRoute(
        path: '/recovery',
        builder: (BuildContext context, GoRouterState state) {
          return Otp();
        }),
    GoRoute(
        path: '/editarperfil',
        builder: (BuildContext context, GoRouterState state) {
          return EditarPerfil();
        }),
    GoRoute(
        path: '/soporte',
        builder: (BuildContext context, GoRouterState state) {
          return Soporte();
        }),
    GoRoute(
        path: '/libro',
        builder: (BuildContext context, GoRouterState state) {
          return Libroreclamacion();
        })
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412, 917),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: _router,
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            //home: Inicio2(),
          );
        });
  }
}
