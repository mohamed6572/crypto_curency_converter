import 'package:carruncy_converter/layout/cubit/cubit.dart';
import 'package:carruncy_converter/layout/cubit/states.dart';
import 'package:carruncy_converter/modules/Converter/Converter.dart';
import 'package:carruncy_converter/shared/components/constens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScrean extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context,state){
        var cubit =AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.Titles[cubit.currentindex],

            ),
          ),
          body: cubit.Screans[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(

            currentIndex: cubit.currentindex,
            onTap: (index){
              cubit.changeBottomIndex(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.monetization_on),label: 'Crypto'),
              BottomNavigationBarItem(icon: Icon(Icons.swap_horiz),label: 'Converter'),
              BottomNavigationBarItem(icon: Icon(Icons.calculate),label: 'calculator'),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
            ],
          ),
        );
      },
    );
  }
}
