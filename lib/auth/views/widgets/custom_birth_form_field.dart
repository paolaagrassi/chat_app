// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomBirthFormField extends StatefulWidget {
  CustomBirthFormField({required this.controller, super.key});

  TextEditingController? controller;

  @override
  State<CustomBirthFormField> createState() => _CustomBirthFormFieldState();
}

class _CustomBirthFormFieldState extends State<CustomBirthFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.datetime,
      decoration: const InputDecoration(
        labelText: 'Select yout birth date',
        prefixIcon: Icon(
          Icons.date_range_outlined,
        ),
        labelStyle: TextStyle(color: Colors.grey),
      ),
      onTap: () async {
        final currencyDate = DateTime.now();
        final currencyYear = currencyDate.year;
        final minimumYear = currencyYear - 18;

        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime(minimumYear),
            firstDate: DateTime(1980),
            lastDate: DateTime(minimumYear),
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
          widget.controller!.text = DateFormat('yyyy-MM-dd').format(pickedDate);
        }
      },
    );
  }
}
