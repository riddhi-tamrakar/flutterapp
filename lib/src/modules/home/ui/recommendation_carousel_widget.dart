import 'package:app/src/modules/home/bloc/bloc/home_bloc.dart';
import 'package:app/src/services/utility.dart';
import 'package:app/src/styles/theme.dart';

import 'package:app/src/widgets/carousel_slider.dart';
import 'package:app/src/widgets/not_found.dart';
import 'package:app/src/widgets/shimmer_loading_widget.dart';
import 'package:app/src/widgets/something_went_wrong.dart';
import 'package:app/src/widgets/spacer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationCarouselWidget extends StatefulWidget {
  @override
  _RecommendationCarouselWidgetPageState createState() =>
      _RecommendationCarouselWidgetPageState();
}

class _RecommendationCarouselWidgetPageState
    extends State<RecommendationCarouselWidget> {
  HomeBloc _bloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(FetchImages(count: 5));
  }

  Widget _list() => BlocBuilder<HomeBloc, HomeState>(
      bloc: _bloc,
      builder: (BuildContext context, HomeState state) {
        if (state is DataLoaded) {
          return CarouselWidget(data: state.obj);
        }

        if (state is HomeInitial || state is Loading) {
          return ShimmerLoading(
              isLoading: true,
              child: Container(
                width: Utility.displayWidth(context) * 0.8,
                height: Utility.displayWidth(context) * 0.7,
              ));
        } else if (state is ErrorReceived) {
          return state.err == "No data found"
              ? NotFound()
              : SomethingWentWrong();
        } else {
          return Container();
        }
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [SpacerWidget(AppTheme.kBodyPadding), _list()],
    );
  }
}
