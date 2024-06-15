import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/injuctoin_container.dart';
import '../../../../core/utils/button.dart';
import '../../../../core/utils/loading_widget.dart';
import '../../cubit/location_cubit.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        if (state is GetCurrentPositionLoadingState) {
          return const LoadingWidget();
        }
        return AppButton(
            widget: TextButton(
              onPressed: () {
                sl<LocationCubit>().getCurrentPosition(context);
              },
              child: Text(
                'Current Location',
                style: Theme.of(context).textTheme.bodyMedium!,
              ),
            ),
            color: Colors.white38);
      },
    );
  }
}
