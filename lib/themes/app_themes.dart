part of 'index.dart';

ThemeData getAppTheme(BuildContext _) {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: getPrimaryMaterialColor(),
    fontFamily: 'Poppins',
    applyElevationOverlayColor: false,
    useMaterial3: true,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedLabelStyle: TextStyle(color: ThemeColors.green),
        unselectedLabelStyle: TextStyle(color: ThemeColors.greyShadow)),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
      minimumSize: const Size(double.infinity, 50),
    )),
    buttonTheme: ButtonThemeData(
      buttonColor: ThemeColors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: Color(0xff017663)),
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: ThemeColors.greyShadow,
      thickness: 1,
    ),
  );
}
