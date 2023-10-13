import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/toogle_screen/toogle_screen.dart';

import '../../../../core/custom_text_form_field.dart';
import '../controller/payment_cubit.dart';


class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController price = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => PaymentCubit()..getAuthToken(),
      child: Scaffold(
          body: BlocConsumer<PaymentCubit, PaymentState>(
              listener: (context, state) {
                if(state is PaymentRequestSuccess)
                  {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=> ToogleScreen() ));
                  }
              },
              builder: (context, state) {
                final cubit = BlocProvider.of<PaymentCubit>(context);

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Form(
                    key: formKey,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/Payment.png'),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomTextFormField(
                              controller: firstName,
                              icon: const Icon(
                                Icons.account_circle,
                                color: Colors.blue,
                              ),
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your user name";
                                }
                                // if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                //   return 'Please enter a valid email address';
                                // }
                              },
                              suffixFun: () {},
                              labelText: 'first name',),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextFormField(
                              controller: lastName,
                              icon: const Icon(
                                Icons.account_circle,
                                color: Colors.blue,
                              ),
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your first name";
                                }
                                // if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                //   return 'Please enter a valid email address';
                                // }
                              },
                              suffixFun: () {},
                              labelText: 'last name',),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextFormField(
                              controller: email,
                              icon: const Icon(
                                Icons.alternate_email_sharp,
                                color: Colors.blue,
                              ),
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your last name";
                                }
                                // if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                //   return 'Please enter a valid email address';
                                // }
                              },
                              suffixFun: () {},
                              labelText: 'email',),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextFormField(
                              controller: phone,
                              icon: const Icon(
                                Icons.phone,
                                color: Colors.blue,
                              ),
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your phone";
                                }
                                // if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                //   return 'Please enter a valid email address';
                                // }
                              },
                              suffixFun: () {},
                              labelText: 'phone',),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextFormField(
                              controller: price,
                              icon: const Icon(
                                Icons.price_change_rounded,
                                color: Colors.blue,
                              ),
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your price";
                                }
                                // if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                //   return 'Please enter a valid email address';
                                // }
                              },
                              suffixFun: () {},
                              labelText: 'price',),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 150,
                              child: FloatingActionButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.getOrderId(
                                        firstName: firstName.text,
                                        lastName: lastName.text,
                                        email: email.text,
                                        phone: phone.text,
                                        price: price.text);
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: const Text("Register",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        letterSpacing: 0.168,
                                        fontWeight: FontWeight.w500)),
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
          )
      ),

    );
  }
}
