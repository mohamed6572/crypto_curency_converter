import 'package:carruncy_converter/layout/cubit/cubit.dart';
import 'package:carruncy_converter/layout/cubit/states.dart';
import 'package:carruncy_converter/shared/Bloc_Observer.dart';
import 'package:carruncy_converter/shared/network/local/cash_helper.dart';
import 'package:carruncy_converter/shared/network/remote/dio_helper.dart';
import 'package:carruncy_converter/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/HomeScrean.dart';

void main() {
  BlocOverrides.runZoned(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Cash_Helper.Init();
      Dio_Helper.init();
      bool? isDark1 = Cash_Helper.getBoolen(key: 'isDark') ;
      print(isDark1);
      runApp(MyApp(isDark1));
    },
    blocObserver: MyBlocObserver(),
  );
}
class MyApp extends StatelessWidget {
final bool? isdark ;
MyApp(this.isdark);
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()..GetCrypto()..ChangeTheme(value: isdark),)
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: cubit.isDark ? ThemeMode.dark:  ThemeMode.light,
            home: HomeScrean(),

          );
        },

      ),
    );
  }
}
