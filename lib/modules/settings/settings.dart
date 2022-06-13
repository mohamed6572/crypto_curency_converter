import 'package:carruncy_converter/layout/cubit/cubit.dart';
import 'package:carruncy_converter/layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_switch/sliding_switch.dart';

class Settings extends StatelessWidget {
  Color? def;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dark Mode',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SlidingSwitch(
                  width: 80,
                  colorOn: Colors.green,
                  colorOff: Colors.black,
                  background:
                      cubit.isDark ? def = Colors.green : def = Colors.red,
                  height: 40,
                  value: cubit.isDark,
                  onChanged: (bool value) {},
                  onTap: () {
                    cubit.ChangeTheme();
                  },
                  onDoubleTap: () {},
                  onSwipe: () {})
            ],
          ),
        );
      },
    );
  }
}
