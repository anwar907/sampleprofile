part of 'index.dart';

class ThemeColors {
  static const green = Color(0xFF017663);
  static const greenRGB = Color.fromRGBO(232, 247, 243, 0.4);
  static const borderGreyRGB = Color.fromRGBO(0, 0, 0, 0.12);
  static MaterialColor primary = getPrimaryMaterialColor();
  static const greyShadow = Color(0xFF8E8E93);
}

MaterialColor getPrimaryMaterialColor() {
  Map<int, Color> color = {
    50: const Color(0xffE8F7F3),
    100: const Color(0xffBBE5DC),
    200: const Color(0xff8ED4C6),
    300: const Color(0xff61C1B0),
    400: const Color(0xff2EAD9A),
    500: const Color(0xff009886),
    600: const Color(0xff008371),
    700: const Color(0xff006E5E),
    800: const Color(0xff00594B),
    900: const Color(0xff004439)
  };
  return MaterialColor(0xff017663, color);
}
