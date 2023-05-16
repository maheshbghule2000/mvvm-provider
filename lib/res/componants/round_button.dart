import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../colors.dart';


class RoundButton extends StatelessWidget {
  final String tital;
  final bool loading;
  final VoidCallback onpress;
  RoundButton(
      {super.key,
      required this.tital,
      this.loading = false,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 40,
        // width: 200,
        decoration: BoxDecoration(
            color: AppColors.skyColor, borderRadius: BorderRadius.circular(30)),
        child: Center(
            child: loading
                ? CircularProgressIndicator(
                    color: AppColors.grayColor,
                  )
                : Text(
                    tital,
                    style: TextStyle(color: AppColors.orangeColor),
                  )),
      ),
    );
  }
}
