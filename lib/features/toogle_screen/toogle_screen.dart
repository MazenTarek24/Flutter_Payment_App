import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/constant.dart';
import 'package:payment/core/navigation.dart';
import 'package:payment/features/ref_code_screen/RefCodeScreen.dart';
import 'package:payment/features/visa_screen/VisaScreen.dart';

import '../register_screen/presentation/controller/payment_cubit.dart';


class ToogleScreen extends StatelessWidget {
  const ToogleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (context) => PaymentCubit(),
    child: BlocConsumer<PaymentCubit,PaymentState>(
    listener: (context, state) {
      if(state is PaymentKioskSuccess){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const RefCodeScreen(),));
      }
    },
    builder: (context, state) {
      var cubit = PaymentCubit.get(context);

      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top:40.0,left: 18.0,right: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    cubit.getKioskPayment();
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(15.0),
                      border:
                      Border.all(color: Colors.black87, width: 2.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Image(
                          image: NetworkImage(ImageConstants.refCodeImgUrl),
                        ),
                        const SizedBox(height: 15.0),
                        const Text(
                          'Payment with Ref code',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: InkWell(
                  onTap: () {
                    navigateAndFinish(context, const VisaScreen());
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black87, width: 2.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  [
                        Image(
                          image: NetworkImage(ImageConstants.visaImgUrl),
                        ),
                        const Text(
                          'Payment with visa',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      );
    },
    ),
    );
  }
}
