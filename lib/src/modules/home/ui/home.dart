import 'package:app/src/modules/home/bloc/bloc/home_bloc.dart';
import 'package:app/src/modules/home/ui/recommendation_carousel_widget.dart';
import 'package:app/src/modules/home/ui/recommendation_gridview_widget.dart';

import 'package:app/src/styles/theme.dart';
import 'package:app/src/widgets/app_bar_with_overlapped_body.dart';
import 'package:app/src/widgets/models/custom_app_bar.dart';
import 'package:app/src/widgets/spacer_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _bloc = HomeBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OverlappedAppBar(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: AppTheme.kBodyPadding),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SpacerWidget(AppTheme.kBodyPadding),
            Container(child: RecommendationCarouselWidget()),
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(AppTheme.kBorderRadius),
                    child: RecommendationGridViewWidget()))
          ],
        ),
      ),
      topOverFlow: AppTheme.kTopOverFlow,
      customAppBar: CustomAppBar(
        title: 'Home',
        // leading: BackButtonWidget(),
      ),
    );
  }
}
