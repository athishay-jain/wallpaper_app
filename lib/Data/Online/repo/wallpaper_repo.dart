import 'package:wallpaper_app/Data/Online/Model.dart';
import 'package:wallpaper_app/Data/Online/helper/api_helper.dart';
import 'package:wallpaper_app/Utilitis/app_constens.dart';

class WallpaperRepo {
  ApiHelper apiHelper;

  WallpaperRepo({required this.apiHelper});

  Future<PhotosDataModel> trendingWall() async {
    try {
      dynamic response = await apiHelper.getApi(url: AppUrl.trending_url);
      return PhotosDataModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
