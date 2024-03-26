import 'package:getx_skeleton/config/theme/my_theme.dart';

class ImageLocations {
  static const String defaultLocation = 'assets/images/';
  static final String fullLogoDark =
      MyTheme().getThemeIsLight ? '${defaultLocation}full_logo_light.png' : '${defaultLocation}full_logo.png';
  static final String appIcon =
      MyTheme().getThemeIsLight ? '${defaultLocation}app_icon_round_light.png' : '${defaultLocation}app_icon_round.png';
  static final String socialLogin =
      MyTheme().getThemeIsLight ? '${defaultLocation}social_login.png' : '${defaultLocation}social_login.png';
  static final String personImage =
      MyTheme().getThemeIsLight ? '${defaultLocation}person.jpg' : '${defaultLocation}person.jpg';
  static final String bannerImage =
      MyTheme().getThemeIsLight ? '${defaultLocation}banner.png' : '${defaultLocation}banner.png';
  static final String newsImage =
      MyTheme().getThemeIsLight ? '${defaultLocation}news.jpg' : '${defaultLocation}news.jpg';
  static final String teamOneImage =
      MyTheme().getThemeIsLight ? '${defaultLocation}team1.png' : '${defaultLocation}team1.png';
  static final String teamTwoImage =
      MyTheme().getThemeIsLight ? '${defaultLocation}team2.png' : '${defaultLocation}team2.png';
  static final List<String> paymentIcons = [
    MyTheme().getThemeIsLight ? '${defaultLocation}paypal_light.png' : '${defaultLocation}paypal_dark.png',
    MyTheme().getThemeIsLight ? '${defaultLocation}stripe_light.png' : '${defaultLocation}stripe_dark.png',
    MyTheme().getThemeIsLight ? '${defaultLocation}razorpay_light.png' : '${defaultLocation}razorpay_dark.png',
    MyTheme().getThemeIsLight ? '${defaultLocation}paystack_light.png' : '${defaultLocation}paystack_dark.png',
    MyTheme().getThemeIsLight ? '${defaultLocation}flutterwave_light.png' : '${defaultLocation}flutterwave_dark.png',
    MyTheme().getThemeIsLight ? '${defaultLocation}payonline_light.png' : '${defaultLocation}payonline_dark.png',
  ];
}
