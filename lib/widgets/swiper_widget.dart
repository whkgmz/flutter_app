import 'package:flutter/material.dart';
import 'package:flutter_rush/model/banner_model.dart';
import 'package:flutter_rush/page/browser_page.dart';
import 'package:flutter_rush/utils/global_utils.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperWidget extends StatefulWidget {
  final List<BannerModel> initData;

  const SwiperWidget({Key key, this.initData}) : super(key: key);

  @override
  _SwiperWidgetState createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
            child: Swiper(
              duration: 500,
              autoplay: true,
              pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.grey, activeColor: Colors.white)
              ),
              itemCount: widget.initData.length,
              itemBuilder: (context, index) => _buildBanner(
                 widget.initData[index],
              ),
              viewportFraction: 0.8,
              scale: 0.9,
              onTap: (index) => _tapBanner(
                 widget.initData[index],
              ),
            ),
        constraints: BoxConstraints.loose(Size(
            GlobalUtils.calcScreenWidth(),
            GlobalUtils.calcWidgetHeightMultiple(0.25))));
  }

  void _tapBanner(BannerModel model) async {
    await Navigator.of(this.context).push(MaterialPageRoute(builder: (_) {
      return Browser(
        title: model.title,
        url: model.url,
      );
    }));
  }

  Widget _buildBanner(BannerModel model) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.0))),
      child: Image(
        image: NetworkImage(model.imagePath),
        fit: BoxFit.fill,
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 4.0,
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}
