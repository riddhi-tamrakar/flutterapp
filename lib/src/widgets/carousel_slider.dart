import 'package:app/src/modules/home/models/imageData.dart';
import 'package:app/src/services/utility.dart';
import 'package:app/src/styles/theme.dart';
import 'package:app/src/widgets/shimmer_loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'custom_card_widget.dart';

class CarouselWidget extends StatelessWidget {
  final List<ImageData> data;

  CarouselWidget({Key key, @required this.data}) : super(key: key);

  Widget _listItem(ImageData item, context) => Container(
        margin: EdgeInsets.only(
          bottom: AppTheme.kBodyPadding,
        ),
        child: CustomCard(
          radius: AppTheme.kHomeItemBorderRadius,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.kHomeItemBorderRadius),
            child: SizedBox(
                child: item != null && item != ''
                    ? CachedNetworkImage(
                        placeholder: (context, url) {
                          return ShimmerLoading(
                            child: Container(
                              width: Utility.displayWidth(context) * 0.7,
                              height: Utility.displayWidth(context) * 0.7,
                            ),
                            isLoading: true,
                          );
                        },
                        fit: BoxFit.cover,
                        imageUrl: item.coverUrl,
                      )
                    : SizedBox(
                        width: Utility.displayWidth(context) * 0.7,
                        height: Utility.displayWidth(context) * 0.7,
                      )),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
            height: Utility.displayWidth(context) * 0.7,
            enableInfiniteScroll: false,
            disableCenter: false,
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {}),
        items: data.map<Widget>((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: Utility.displayWidth(context) * 0.9,
                  margin: const EdgeInsets.only(
                    top: AppTheme.kBodyPadding,
                    right: AppTheme.kBodyPadding,
                  ),
                  child: _listItem(i, context));
            },
          );
        }).toList(),
      ),
    );
  }
}
