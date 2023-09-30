import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/providers.dart';
import 'screens/splash_screen.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_)=>ThemeProvider()),
        ChangeNotifierProvider(create:(_)=>PaletteListProvider()),
        ChangeNotifierProvider(create:(_)=>ColorProvider()),
        ChangeNotifierProvider(create:(_)=>PageProvider()),
      ],
      child:Builder(
        builder:(context){
          ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode:themeProvider.themeMode,
            theme:themeProvider.lightTheme(),
            darkTheme: themeProvider.darkTheme(),
            home:const SplashScreen()
          );
        }
      )
    );
  }
}

