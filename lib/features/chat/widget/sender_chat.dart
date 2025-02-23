import 'package:flutter/material.dart';

import '../../../util/color_const.dart';
import '../../../util/font_family.dart';

class SenderChat extends StatelessWidget {
  const SenderChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        margin: EdgeInsets.only(left: 30),
        decoration: BoxDecoration(
            color: ColorConst.getBlack(context),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
              topLeft: Radius.circular(12),
            )),
        child: Column(
          children: [
            Text(
              "datadatadatadatadatadatadatadatadatadatadatadatadata",
              style: TextStyle(
                  color: ColorConst.getWhite(context),
                  fontSize: 14,
                  fontFamily: FontFamily.robotoSimple,
                  fontWeight: FontWeight.w500),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 6,
                children: [
                  Icon(
                    Icons.read_more,
                    size: 10,
                    color: ColorConst.getWhite(context),
                  ),
                  Text(
                    "Time",
                    style: TextStyle(
                        color: ColorConst.getWhite(context),
                        fontSize: 8,
                        fontFamily: FontFamily.robotoSimple,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
