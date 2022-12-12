// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCalendarField extends StatelessWidget {
  CustomCalendarField({required this.controller, super.key});

  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.datetime,
      decoration: const InputDecoration(
        labelText: 'Select yout birth date',
        prefixIcon: Icon(
          Icons.date_range_outlined,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        labelStyle: TextStyle(color: Colors.grey),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1970),
            lastDate: DateTime.now(),
            builder: (context, child) => Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(
                      primary: Color.fromARGB(255, 136, 22, 230),
                      onPrimary: Colors.white, // <-- SEE HERE
                      onSurface: Colors.black, // <-- SEE HERE
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                          foregroundColor: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                  child: child!,
                ));
        if (pickedDate != null) {
          controller!.text = DateFormat('yyyy-MM-dd').format(pickedDate);
        }
      },
    );
  }
}
