import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/Data/Online/Bloc/photos_event.dart';
import 'package:wallpaper_app/Data/Online/Bloc/photos_state.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/Data/Online/Model.dart';
import 'package:wallpaper_app/appContents.dart';

class PhotosBloc extends Bloc<PhotosEvents, PhotosState> {
  PhotosBloc() : super(PhotosIntialState()) {
    on<SetInitialPhotos>((event, emit) async {
      emit(PhotosLoadingState());
      String url = "https://api.pexels.com/v1/curated?page=1&per_page=20";
      http.Response res = await http.get(
        Uri.parse(url),
        headers: {
          "Authorization":
              "HuieUshJkwM4HmRbzixTAj8TPpuxD3npz442tslVjWHlkne4jLBotquH"
        },
      );
      List<PhotosDataModel> catPhotos = [];
      Map<String, dynamic> map = {};
      map = {"aurthToken": "tokan"};
      List<String> cat = AppConstents.cat;
      for (int i = 0; i < cat.length; i++) {
        String catUrl =
            "https://api.pexels.com/v1/search?query=${cat[i]}&per_page=1";

        http.Response catRes = await http.get(
          Uri.parse(catUrl),
          headers: {
            "Authorization":
                "HuieUshJkwM4HmRbzixTAj8TPpuxD3npz442tslVjWHlkne4jLBotquH"
          },
        );
        if (catRes.statusCode == 200) {
          dynamic catData = jsonDecode(catRes.body);
          catPhotos.add(PhotosDataModel.fromJson(catData));
          print(catRes.body);
        }
      }
      if (res.statusCode == 200) {
        dynamic data = jsonDecode(res.body);
        emit(PhotosLoadedState(
            photos: PhotosDataModel.fromJson(data), catPhotos: catPhotos));
      } else {
        emit(PhotosErrorState(
            error: "Photos Could not load : ${res.statusCode}"));
      }
    });
    on<SearchPhoto>((event, emit) async {
      emit(PhotosLoadingState());
      String catUrl =
          "https://api.pexels.com/v1/search?query=${event.search}&per_page=20";

      http.Response searchRes = await http.get(
        Uri.parse(catUrl),
        headers: {
          "Authorization":
              "HuieUshJkwM4HmRbzixTAj8TPpuxD3npz442tslVjWHlkne4jLBotquH"
        },
      );
      if (searchRes.statusCode == 200) {
        dynamic data = jsonDecode(searchRes.body);
        emit(PhotoSearchState(photos: PhotosDataModel.fromJson(data)));
      } else {
        emit(PhotosErrorState(error: "The Image Not found"));
      }
    });
  }
}
