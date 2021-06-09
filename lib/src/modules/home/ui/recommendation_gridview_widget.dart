import 'package:app/src/modules/home/bloc/bloc/home_bloc.dart';
import 'package:app/src/services/utility.dart';

import 'package:app/src/widgets/grid_view.dart';
import 'package:app/src/widgets/shimmer_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationGridViewWidget extends StatefulWidget {
  @override
  _RecommendationGridViewPageState createState() =>
      _RecommendationGridViewPageState();
}

class _RecommendationGridViewPageState
    extends State<RecommendationGridViewWidget> {
  HomeBloc _bloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(FetchImages(count: 20));
  }

  Widget _list() => BlocBuilder<HomeBloc, HomeState>(
      bloc: _bloc,
      builder: (BuildContext context, HomeState state) {
        if (state is DataLoaded) {
          return GriViewWidget(data: state.obj);
        }

        if (state is HomeInitial || state is Loading) {
          return ShimmerLoading(
              isLoading: true,
              child: Container(
                width: Utility.displayWidth(context) * 0.3,
                height: Utility.displayWidth(context) * 0.3,
              ));
        } else if (state is ErrorReceived) {
          return Text(state.err);
        } else {
          return Container();
        }
      });

  @override
  Widget build(BuildContext context) {
    return Container(child: _list());
  }
}
