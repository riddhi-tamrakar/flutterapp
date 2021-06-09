import 'package:app/src/modules/home/models/imageData.dart';
import 'package:app/src/services/utility.dart';
import 'package:app/src/styles/theme.dart';
import 'package:app/src/widgets/shimmer_loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'custom_card_widget.dart';

class GriViewWidget extends StatelessWidget {
  final List<ImageData> data;

  GriViewWidget({Key key, @required this.data}) : super(key: key);

  Widget _listItem(ImageData item, context) => Container(
        padding: const EdgeInsets.all(
          AppTheme.kBorderRadius,
        ),
        child: CustomCard(
          radius: AppTheme.kBorderRadius,
          color: AppTheme.kOnPrimaryColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.kBorderRadius),
            child: SizedBox(
                child: item != null && item != ''
                    ? CachedNetworkImage(
                        placeholder: (context, url) {
                          return ShimmerLoading(
                            child: Container(
                              width: Utility.displayWidth(context) * 0.3,
                              height: Utility.displayWidth(context) * 0.3,
                            ),
                            isLoading: true,
                          );
                        },
                        fit: BoxFit.cover,
                        imageUrl: item.coverUrl,
                      )
                    : SizedBox(
                        width: Utility.displayWidth(context) * 0.3,
                        height: Utility.displayWidth(context) * 0.3,
                      )),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.kOnPrimaryColor,
      child: GridView.builder(
        itemCount: data.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return _listItem(data[index], context);
        },
      ),
    );
  }
}
