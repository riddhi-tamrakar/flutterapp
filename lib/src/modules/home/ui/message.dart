import 'package:app/src/modules/home/ui/recommendation_carousel_widget.dart';

import 'package:app/src/styles/theme.dart';
import 'package:app/src/widgets/app_bar_with_overlapped_body.dart';
import 'package:app/src/widgets/models/custom_app_bar.dart';
import 'package:app/src/widgets/not_found.dart';
import 'package:app/src/widgets/spacer_widget.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return OverlappedAppBar(
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: AppTheme.kBodyPadding),
          child: NotFound()),
      topOverFlow: AppTheme.kTopOverFlow,
      customAppBar: CustomAppBar(
        title: 'Message',
        // leading: BackButtonWidget(),
      ),
    );
  }
}
