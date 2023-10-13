import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key, required this.icon, required this.validation, required this.controller, required this.suffixFun,
    this.suffix,    this.isPassword = false, required this.labelText , this.onSubmit}) : super(key: key);

  final bool isPassword ;
  final Icon? icon;
  final String? Function(String?)? validation;
  final TextEditingController controller;
  final Function suffixFun;
  final IconData? suffix;
  final String labelText;
  final Function? onSubmit;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) {
        onSubmit!(value);
      },
      obscureText: isPassword ? true : false,
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blue
              )
          ),
          focusColor: const Color(0xff757575),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),

          prefixIcon: icon,
          suffixIcon: IconButton(
              onPressed: (){
                suffixFun();
              }, icon: Icon(suffix,color: Colors.blue,)

          )
      ),
      validator: validation,
    );
  }
}
