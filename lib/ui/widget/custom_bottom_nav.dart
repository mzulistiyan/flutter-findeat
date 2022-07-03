import 'package:flutter/material.dart';
import 'package:flutter_application_findeat/cubit/page_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNav extends StatelessWidget {
  final int index;
  final Icon icon;

  const CustomBottomNav({
    Key? key,
    required this.index,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          icon,
          Container(
            width: 30,
            height: 3,
            decoration: BoxDecoration(
                color: context.read<PageCubit>().state == index
                    ? Colors.blue
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(16)),
          )
        ],
      ),
    );
  }
}
