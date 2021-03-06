import 'package:flutter/material.dart';


void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

void navigateToAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false);

Widget defultTextButtton(
        {required String text, required void Function()? function}) =>
    TextButton(onPressed: function, child: Text(text.toUpperCase()));

Widget defultFormField({
  required TextInputType type,
  required TextEditingController controller,
  required String label,
   IconData? prefix,
  IconData? suffix,
  bool isPassword = false,
  required String? Function(String? val)? validator,
  void Function(String val)? onChanged,
  VoidCallback? passwordShow,
  VoidCallback? onTap,
  void Function(String)? onSubmeted,
}) =>
    TextFormField(
      onTap: onTap,
      onFieldSubmitted: onSubmeted,
      onChanged: onChanged,
      obscureText: isPassword,
      validator: validator,
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        label: Center(
          child: Text(label),
        ),
        prefixIcon: Icon(prefix),
        border: OutlineInputBorder(),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: passwordShow,
              )
            : null,
      ),
    );

Widget defultButton({
  double width = double.infinity,
  Color Background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required String text,
  required VoidCallback function,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white,
          fontSize: 19
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Background,
      ),
    );


Widget myDivider()=> Padding(
  padding: const EdgeInsets.symmetric(vertical: 10),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[400],
  ),
);
