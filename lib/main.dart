import 'package:device_preview/device_preview.dart';
import 'package:engaz/features/auth/login/controller/login_cubit.dart';
import 'package:engaz/features/auth/reset_password/controller/cubit/code_cubit.dart';
import 'package:engaz/features/auth/reset_password/controller/cubit/forget_password_cubit.dart';
import 'package:engaz/features/auth/reset_password/controller/cubit/reset_password_cubit.dart';
import 'package:engaz/features/auth/sign_up/controller/resend_opt_cubit/cubit/resend_otp_cubit.dart';
import 'package:engaz/features/auth/verify_email/controller/cubit/verify_email_cubit.dart';
import 'package:engaz/features/home/cubits/get_all_category/getallcategory_cubit.dart';
import 'package:engaz/features/home/cubits/get_productes/cubit/get_products_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/network/api.dart';
import 'core/network/observer.dart';
import 'features/auth/reset_password/view/enter_phone_number_screen.dart';
import 'features/auth/reset_password/view/in_put_new_password.dart';
import 'features/auth/reset_password/view/last_screen.dart';
import 'features/auth/reset_password/view/post_code_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/auth/sign_up/controller/sign_up_cubit/sign_up_cubit.dart';
import 'features/cart/cubits/add_to_cart/cubit/add_to_cart_cubit.dart';
import 'features/cart/cubits/check_out/check_out_bloc.dart';
import 'features/cart/cubits/get_cart_amount/get_cart_amount_cubit.dart';
import 'features/cart/cubits/get_cart_item/get_cart_item_cubit.dart';
import 'features/favorite/cubits/get_all_favourite_list/cubit/get_all_favourite_list_cubit.dart';
import 'features/home/cubits/add_product_to_favorit_list/cubit/add_product_to_favorit_list_cubit.dart';
import 'features/home/cubits/get_bundles/cubit/get_bundles_cubit.dart';
import 'features/home/cubits/home_slider/cubit/home_slider_cubit.dart';
import 'features/home/screens/main_home.dart';
import 'features/home/screens/spacific_categorie_screen.dart';
import 'features/settings/controller/delete_account/cubit/delete_account_cubit.dart';
import 'features/settings/controller/get_user_data/cubit/get_user_data_cubit.dart';
import 'features/settings/controller/update_user_data/cubit/update_user_data_cubit.dart';
import 'features/splash_screen&&on_boarding/screens/splash_screen.dart';
import 'features/tracking_order/controller/cancel_update_order/cubit/cancel_update_order_bloc.dart';
import 'features/tracking_order/controller/get_order_list_data/cubite/get_order_list_data_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = const SimpleBlocObserver();
  DioHelper.init();
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const Orderak(),
  ));}

class Orderak extends StatelessWidget {
  const Orderak({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => DeleteAccountCubit()),

          BlocProvider(create: (context) => SignUpCubit()),
          BlocProvider(create: (context) => VerifyEmailCubit()),
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => ForgetPasswordCubit()),
          BlocProvider(create: (context) => ResendOtpCubit()),
          BlocProvider(create: (context) => CodeCubit()),
          BlocProvider(create: (context) => ResetPasswordCubit()),
          BlocProvider(create: (context) => GetProductsCubit()),
          BlocProvider(create: (context) => GetCitiesCubit()),
          BlocProvider(create: (context) => GetGovernmentCubit()),
          BlocProvider(create: (context) => GetCountiesCubit()),
          BlocProvider(create: (context) => HomeSliderCubit()),
          BlocProvider(create: (context) => GetBusinessTypesCubit()),
          BlocProvider(create: (context) => GetAllFavouriteListCubit()),
          BlocProvider(create: (context) => AddProductToFavoritListCubit()),
          BlocProvider(create: (context) => AddProductToCartListCubit()),
          BlocProvider(create: (context) => GetAllCartListCubit()),
          BlocProvider(create: (context) => GetAmountCubit()),
          BlocProvider(create: (context) => GetUserDataCubit()),
          BlocProvider(create: (context) => UpdateUserDataCubit()),
          BlocProvider(create: (context) => CheckOutCubit()),
          BlocProvider(create: (context) => GetBundlesCubit()),
          BlocProvider(create: (context) => GetOrderListDataCubit()),
          BlocProvider(create: (context) => CancelUpdateOrderCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white, // 👈 يخلي كل الـ Scaffold أبيض تلقائيًا
            cardColor: Colors.white,               // 👈 الكروت تبقى بيضاء تلقائيًا
          ),

          initialRoute: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName: (context) => const SplashScreen(),
            EnterPhoneNumberScreen.routeName: (context) =>
                EnterPhoneNumberScreen(),
            // InPutNewPassword.routeName: (context) => InPutNewPassword(),
            LastScreen.routeName: (context) => LastScreen(),
            MainHome.routeName: (context) => MainHome(),
          },
          locale: const Locale('ar', ''),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar', ''), // Only Arabic supported
          ],
        ),
      ),
    );
  }
}
