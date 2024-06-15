import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oneweather/features/home/cubit/home_cubit.dart';
import '../../../../app/injuctoin_container.dart';
import '../../../../core/utils/text_field.dart';

class SearchCity extends StatefulWidget {
  SearchCity({super.key, required this.function});

  final Function() function;

  Color suffixColor = Colors.grey;

  @override
  State<SearchCity> createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return MyTextField(
          onChanged: (value) {
            setState(() {
              if (value.isNotEmpty) {
                widget.suffixColor = Colors.blue;
              } else {
                widget.suffixColor = Colors.grey;
              }
            });
          },
          controller: sl<HomeCubit>().cityController,
          hint: 'choose city',
          suffixIcon: const Icon(Icons.arrow_forward),
          suffixPressed: widget.function,
          suffixColor: widget.suffixColor,
          validation: (value) {
            if (value.isEmpty) {
              return 'required city name';
            }
          },
        );
      },
    );
  }
}
