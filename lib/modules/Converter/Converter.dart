import 'package:carruncy_converter/layout/cubit/cubit.dart';
import 'package:carruncy_converter/layout/cubit/states.dart';
import 'package:carruncy_converter/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Converter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var amountController = TextEditingController();
    var fromController = TextEditingController();
    var toController = TextEditingController();
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: defultFormField(
                        type: TextInputType.text,
                        controller: fromController,
                        label: 'from',
                        validator: (value) {
                          return '';
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.swap_horiz),
                  ),
                  Expanded(
                    child: defultFormField(
                        type: TextInputType.text,
                        controller: toController,
                        label: 'to',
                        validator: (value) {
                          return '';
                        }),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              defultFormField(
                  type: TextInputType.text,
                  controller: amountController,
                  label: 'amount',
                  validator: (value) {
                    return '';
                  }),
              SizedBox(
                height: 30,
              ),
              defultButton(
                  Background: Colors.amber ,
                  text: 'convert',
                  function: () {
                    AppCubit.get(context).convert(
                        amount: amountController.text,
                        from: fromController.text,
                        to: toController.text);
                  }),
              SizedBox(
                height: 30,
              ),
              if (cubit.converter_model?.result != null &&
                  amountController.text != null &&
                  state is! ChangeBotNavState
              )
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    dataItem(cubit ,' result :' ,'${cubit.converter_model?.result} \$'),
                    SizedBox(
                      height: 20,
                    ),
                    dataItem(cubit ,' rate :' ,'${cubit.converter_model?.info?.rate} '),


                    SizedBox(
                      height: 20,
                    ),
                    dataItem(cubit ,' date :' ,'${cubit.converter_model?.date} '),

                  ],
                )
            ],
          ),
        );
      },
      listener: (context, state) {

      },
    );
  }
  Widget dataItem(cubit , text,text1)=>  Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        color:cubit.isDark ? Colors.blueGrey: Colors.grey[300],
        borderRadius: BorderRadius.circular(25)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 25,
            color: cubit.isDark ?Colors.white: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          text1,
          style: TextStyle(
            fontSize: 20,
            color: cubit.isDark ?Colors.white: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
