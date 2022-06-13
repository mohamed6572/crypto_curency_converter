import 'dart:async';

import 'package:buildcondition/buildcondition.dart';
import 'package:carruncy_converter/layout/cubit/cubit.dart';
import 'package:carruncy_converter/layout/cubit/states.dart';
import 'package:carruncy_converter/models/coinModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Crypto_Screan extends StatefulWidget {
  @override
  State<Crypto_Screan> createState() => _Crypto_ScreanState();
}

class _Crypto_ScreanState extends State<Crypto_Screan> {
  // void initState() {
  //   Timer.periodic(Duration(seconds: 10), (timer) => AppCubit()..GetCrypto());
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return BuildCondition(
          condition: state is! AppGetCryptoLodingState,
          fallback:(context) =>  Center(
            child: CircularProgressIndicator(),
          ),
          builder: (context) =>  ListView.builder(
            physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => CryptoItem(model: coinList[index]),
              itemCount: coinList.length),
        );
      },
    );
  }
  Widget CryptoItem({required Coin model})=>Padding(
    padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
    child: Container(
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppCubit.get(context).isDark
         ? Colors.white30
         : Colors.grey[300]
        ,

      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              padding: EdgeInsets.all(6),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[300],
                 ),
              child: Image(
                image: NetworkImage('${model.imageUrl}'),
              ),

            ),
          ),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                  fit: BoxFit.scaleDown,

                  child: Text('${model.name}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[900],
                        fontSize: 25
                    ),
                  )),
              Text('${model.symbol}',
                style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 20
                ),),
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Text('${model.price} USD',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
                      fontSize: 20
                  ),
                ),
                //  change.toDouble() < 0
                //                         ? change.toDouble().toString()
                //                         : '+' + change.toDouble().toString(),
                //                     style: TextStyle(
                //                       color: change.toDouble() < 0 ? Colors.red : Colors.green,
                Text(
                  model.change < 0
                  ?model.change.toDouble().toString()
                  :'+'+ model.change.toDouble().toString(),
                  style: TextStyle(
                      color:  model.change < 0
                      ?Colors.red
                      :Colors.green,
                      fontSize: 18
                  ),),
                Text(model.changePercentage<0
                  ?model.changePercentage.toDouble().toString() +'%'
                  :'+'+model.changePercentage.toDouble().toString() +'%',

                  style: TextStyle(
                      color: model.changePercentage<0
                          ?Colors.red
                          :Colors.green,
                      fontSize: 18
                  ),),
              ],
            ),
          )

        ],
      ),
    ),
  );
}
