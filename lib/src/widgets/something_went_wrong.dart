import 'package:app/src/services/utility.dart';
import 'package:app/src/styles/theme.dart';
import 'package:app/src/widgets/spacer_widget.dart';
import 'package:app/src/widgets/svg_image.dart';
import 'package:flutter/material.dart';

class SomethingWentWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpacerWidget(Utility.displayHeight(context) * .20),
          SVGImageWidget(
            height: Utility.displayWidth(context) * .60,
            name: 'something_went_wrong',
          ),
          SpacerWidget(AppTheme.kBodyPadding * 2),
          Padding(
            padding: const EdgeInsets.all(AppTheme.kBodyPadding),
            child: Center(
              child: Text(
                "Something went wrong, please try again later.",
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ]);
  }
}
