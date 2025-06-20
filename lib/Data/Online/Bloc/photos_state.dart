import 'package:wallpaper_app/Data/Online/Model.dart';

abstract class PhotosState{}
class PhotosIntialState extends PhotosState{}
class PhotosLoadingState extends PhotosState{}
class PhotosLoadedState extends PhotosState{
  PhotosDataModel photos;
  List<PhotosDataModel>catPhotos;
  PhotosLoadedState({required this.photos,required this.catPhotos});
}
class PhotosErrorState extends PhotosState{
  String error;
  PhotosErrorState({required this.error});
}
class PhotoSearchState extends PhotosState{
  PhotosDataModel photos;
  PhotoSearchState({required this.photos});
}