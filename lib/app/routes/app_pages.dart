// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/dashboard_screen/bindings/dashboard_screen_binding.dart';
import 'package:getx_skeleton/app/modules/dashboard_screen/views/dashboard_screen_view.dart';
import 'package:getx_skeleton/app/modules/result_screen/bindings/result_screen_binding.dart';
import 'package:getx_skeleton/app/modules/result_screen/views/result_screen_view.dart';
import 'package:getx_skeleton/app/modules/upcoming_bet_details_screen/bindings/bet_details_screen_binding.dart';
import 'package:getx_skeleton/app/modules/upcoming_bet_details_screen/views/bet_details_screen_view.dart';

import '../modules/bet_comment_screen/bindings/bet_comment_screen_binding.dart';
import '../modules/bet_comment_screen/views/bet_comment_screen_view.dart';
import '../modules/bet_details_screen/bindings/bet_details_screen_binding.dart';
import '../modules/bet_details_screen/views/bet_details_screen_view.dart';
import '../modules/bet_participant_list_screen/bindings/bet_participant_list_screen_binding.dart';
import '../modules/bet_participant_list_screen/views/bet_participant_list_screen_view.dart';
import '../modules/category_bet_details_screen/bindings/bet_details_screen_binding.dart';
import '../modules/category_bet_details_screen/views/bet_details_screen_view.dart';
import '../modules/category_details_screen/bindings/category_details_screen_binding.dart';
import '../modules/category_details_screen/views/category_details_screen_view.dart';

import '../modules/change_password_screen/bindings/change_password_screen_binding.dart';
import '../modules/change_password_screen/views/change_password_screen_view.dart';
import '../modules/change_theme_screen/bindings/change_theme_screen_binding.dart';
import '../modules/change_theme_screen/views/change_theme_screen_view.dart';
import '../modules/create_bet_comment_screen/bindings/create_bet_comment_screen_binding.dart';
import '../modules/create_bet_comment_screen/views/create_bet_comment_screen_view.dart';
import '../modules/deposit_screen/bindings/deposit_screen_binding.dart';
import '../modules/deposit_screen/views/deposit_screen_view.dart';
import '../modules/edit_profile_screen/bindings/edit_profile_screen_binding.dart';
import '../modules/edit_profile_screen/views/edit_profile_screen_view.dart';
import '../modules/forget_password_screen/bindings/forget_password_screen_binding.dart';
import '../modules/forget_password_screen/views/forget_password_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/invite_friend_screen/bindings/invite_friend_screen_binding.dart';
import '../modules/invite_friend_screen/views/invite_friend_screen_view.dart';
import '../modules/login_screen/bindings/login_screen_binding.dart';
import '../modules/login_screen/views/login_screen_view.dart';
import '../modules/my_bet_screen/bindings/my_bet_screen_binding.dart';
import '../modules/my_bet_screen/views/my_bet_screen_view.dart';
import '../modules/my_profile_screen/bindings/my_profile_screen_binding.dart';
import '../modules/my_profile_screen/views/my_profile_screen_view.dart';
import '../modules/my_wallet_screen/bindings/my_wallet_screen_binding.dart';
import '../modules/my_wallet_screen/views/my_wallet_screen_view.dart';
import '../modules/news_details_screen/bindings/news_details_screen_binding.dart';
import '../modules/news_details_screen/views/news_details_screen_view.dart';
import '../modules/news_screen/bindings/news_screen_binding.dart';
import '../modules/news_screen/views/news_screen_view.dart';
import '../modules/notification_screen/bindings/notification_screen_binding.dart';
import '../modules/notification_screen/views/notification_screen_view.dart';
import '../modules/onboard_screen/bindings/onboard_screen_binding.dart';
import '../modules/onboard_screen/views/onboard_screen_view.dart';
import '../modules/otp_verification_screen/bindings/otp_verification_screen_binding.dart';
import '../modules/otp_verification_screen/views/otp_verification_screen_view.dart';
import '../modules/profile_screen/bindings/profile_screen_binding.dart';
import '../modules/profile_screen/views/profile_screen_view.dart';
import '../modules/registration_screen/bindings/registration_screen_binding.dart';
import '../modules/registration_screen/views/registration_screen_view.dart';
import '../modules/reset_password_screen/bindings/reset_password_screen_binding.dart';
import '../modules/reset_password_screen/views/reset_password_screen_view.dart';
import '../modules/search_news_screen/bindings/search_news_screen_binding.dart';
import '../modules/search_news_screen/views/search_news_screen_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/terms_and_sconditions_screen/bindings/terms_and_sconditions_screen_binding.dart';
import '../modules/terms_and_sconditions_screen/views/terms_and_sconditions_screen_view.dart';
import '../modules/welcome_screen/bindings/welcome_screen_binding.dart';
import '../modules/welcome_screen/views/welcome_screen_view.dart';
import '../modules/withdrawal_screen/bindings/withdrawal_screen_binding.dart';
import '../modules/withdrawal_screen/views/withdrawal_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARD_SCREEN,
      page: () => OnboardScreenView(),
      binding: OnboardScreenBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME_SCREEN,
      page: () => const WelcomeScreenView(),
      binding: WelcomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION_SCREEN,
      page: () => RegistrationScreenView(),
      binding: RegistrationScreenBinding(),
    ),
    GetPage(
      name: _Paths.TERMS_AND_CONDITIONS_SCREEN,
      page: () => const TermsAndSconditionsScreenView(),
      binding: TermsAndSconditionsScreenBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD_SCREEN,
      page: () => const ForgetPasswordScreenView(),
      binding: ForgetPasswordScreenBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFICATION_SCREEN,
      page: () => OtpVerificationScreenView(),
      binding: OtpVerificationScreenBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD_SCREEN,
      page: () => const ResetPasswordScreenView(),
      binding: ResetPasswordScreenBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD_SCREEN,
      page: () => DashboardScreenView(),
      binding: DashboardScreenBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY_SCREEN,
      page: () => ResultScreenView(),
      binding: ResultScreenBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY_DETAILS_SCREEN,
      page: () => CategoryDetailsScreenView(),
      binding: CategoryDetailsScreenBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY_BET_DETAILS_SCREEN,
      page: () => const CategoryBetDetailsScreenView(),
      binding: CategoryBetDetailsScreenBinding(),
    ),
    GetPage(
      name: _Paths.BET_DETAILS_SCREEN,
      page: () => const BetDetailsScreenView(),
      binding: BetDetailsScreenBinding(),
    ),
    GetPage(
      name: _Paths.UPCOMING_BET_DETAILS_SCREEN,
      page: () => const UpComingBetDetailsScreenView(),
      binding: UpComingBetDetailsScreenBinding(),
    ),
    GetPage(
      name: _Paths.BET_COMMENT_SCREEN,
      page: () => const BetCommentScreenView(),
      binding: BetCommentScreenBinding(),
    ),
    GetPage(
      name: _Paths.BET_PARTICIPANT_LIST_SCREEN,
      page: () => const BetParticipantListScreenView(),
      binding: BetParticipantListScreenBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_BET_COMMENT_SCREEN,
      page: () => const CreateBetCommentScreenView(),
      binding: CreateBetCommentScreenBinding(),
    ),
    GetPage(
      name: _Paths.MY_WALLET_SCREEN,
      page: () => const MyWalletScreenView(),
      binding: MyWalletScreenBinding(),
    ),
    GetPage(
      name: _Paths.DEPOSIT_SCREEN,
      page: () => const DepositScreenView(),
      binding: DepositScreenBinding(),
    ),
    GetPage(
      name: _Paths.WITHDRAWAL_SCREEN,
      page: () => const WithdrawalScreenView(),
      binding: WithdrawalScreenBinding(),
    ),
    GetPage(
      name: _Paths.MY_BET_SCREEN,
      page: () => const MyBetScreenView(),
      binding: MyBetScreenBinding(),
    ),
    GetPage(
      name: _Paths.NEWS_SCREEN,
      page: () => const NewsScreenView(),
      binding: NewsScreenBinding(),
    ),
    GetPage(
      name: _Paths.NEWS_DETAILS_SCREEN,
      page: () => NewsDetailsScreenView(),
      binding: NewsDetailsScreenBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_NEWS_SCREEN,
      page: () => const SearchNewsScreenView(),
      binding: SearchNewsScreenBinding(),
    ),
    GetPage(
      name: _Paths.INVITE_FRIEND_SCREEN,
      page: () => const InviteFriendScreenView(),
      binding: InviteFriendScreenBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_SCREEN,
      page: () => const ProfileScreenView(),
      binding: ProfileScreenBinding(),
    ),
    GetPage(
      name: _Paths.MY_PROFILE_SCREEN,
      page: () => const MyProfileScreenView(),
      binding: MyProfileScreenBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE_SCREEN,
      page: () => const EditProfileScreenView(),
      binding: EditProfileScreenBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_SCREEN,
      page: () => const NotificationScreenView(),
      binding: NotificationScreenBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_THEME_SCREEN,
      page: () => ChangeThemeScreenView(),
      binding: ChangeThemeScreenBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD_SCREEN,
      page: () => const ChangePasswordScreenView(),
      binding: ChangePasswordScreenBinding(),
    ),
  ];
}
