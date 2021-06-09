import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:app/src/modules/home/models/imageData.dart';

import 'package:app/src/services/db_service.dart';
import 'package:app/src/services/db_service_response.model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());
  final DbServices _dbServices = DbServices();

  @override
  Stream<Transition<HomeEvent, HomeState>> transformEvents(
    Stream<HomeEvent> events,
    TransitionFunction<HomeEvent, HomeState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is FetchImages) {
      try {
        yield Loading();
        List<ImageData> _data = await _fetchImageData(event.count);

        yield DataLoaded(obj: _data);
      } catch (e) {
        yield ErrorReceived(err: e);
      }
    }
  }

  Future<List<ImageData>> _fetchImageData(count) async {
    try {
      final ResponseModel _response = await _dbServices
          .getapi('/shibes?count=$count&urls=true&httpsUrls=true');
      print(_response.statusCode);
      if (_response.statusCode == 200) {
        final data = _response.data as List;
        return data.map((i) {
          return ImageData(
            i,
          );
        }).toList();
      } else if (_response.statusCode == 400) {
        throw ('No data found');
      } else if (_response.statusCode == 404) {
        throw ('Something went wrong');
      } else {
        throw ('Something went wrong');
      }
    } catch (e) {
      print(e);
      throw (e);
    }
  }
}
